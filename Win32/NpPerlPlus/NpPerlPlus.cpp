/* -*- Mode: C; tab-width: 4; -*- */
/*******************************************************************************
 * NpPerlPlus.c
 ******************************************************************************
 * Netscape Navigator Windows Plugin Template
 * Copyright (c) 1996 Netscape Communications. All rights reserved.
 ******************************************************************************/


#include <io.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <stdio.h>
#include <string.h>
#include <process.h>
#include "npapi.h"

#include <windows.h>

#include "np_perl.h"

#define PROPERTY "PluginInstance"

const char* gInstanceLookupString = "instance->pdata";

static int ppl_instance; // added for NpPerlPlus


typedef struct _PluginInstance
{
	NPWindow*			fWindow;
	uint16				fMode;

	HWND				fhWnd;
	WNDPROC				fDefaultWindowProc;

	// Additional for PerlPlusPlugin

	uint32	x, y;
	uint32	width, height;
	int temp_fd;
	int	prog_fd;
#ifdef NPP_DEBUG
	char logname[64];
	FILE *log_fd;
#endif
	char tmpname[64];
	char filename[64];
	char secure_parms[CGISIZE + 1];
	int from;
	int write_cgi;
	char perl_exe[PPL_MAX_STRING_LENGTH];
	char secure_cgi[PPL_MAX_STRING_LENGTH];

} PluginInstance;	

/* Functions added for NpPerlPlus */

LRESULT CALLBACK PluginWindowProc( HWND hWnd, WORD Message, WORD wParam, LONG lParam)
{
	PAINTSTRUCT paint;
	HDC hDC;
	PluginInstance *This = (PluginInstance *)::GetProp (hWnd, PROPERTY);

	switch(Message){
	case WM_PAINT:
		hDC = BeginPaint(This->fhWnd, &paint);
		InvalidateRect( This->fhWnd, NULL, TRUE );
		ShowWindow( This->fhWnd, SW_SHOWMAXIMIZED);
		UpdateWindow( This->fhWnd );
		EndPaint (This->fhWnd, &paint);
		break;
	default:
			return DefWindowProc(hWnd, Message, wParam, lParam);

	}

    
	return DefWindowProc(hWnd, Message, wParam, lParam);
}


/* 
 * local hacks to implement the security stuff
 */

int16
NPPerl_WriteTemp(PluginInstance *This)
{
	char winparms[PPL_WINPARM_SZ];
	char *cmdpre = "$ENV{PATH}=\"C:\\ActiveState\\Perl\\bin\";";
	char *cmdpst;
	char cmd[PPL_MAX_CMD];
	int l;

	if ((cmdpst = (char *)NPN_MemAlloc((uint32)PPL_OPLIST_SZ)) == NULL)
	{
		fprintf(stderr, "ERROR: Not enough memory for oplist\n");
		return(-1);
	}

	switch (This->secure_parms[0])
	{
	case '0': /* Execution not authorized */
		return(-1);
		break;
	case '1': /* Opcodes 'default:', relatively secure */
		sprintf(cmdpst, "use Opcode; %s %s\n", SECURE_OPSETS_L1, OPM_ADD(OPSLIST));
		break;
	case '2': /* Perl/Tk */
		sprintf(cmdpst, "use Opcode; %s %s\n", SECURE_OPSETS_L2, OPM_ADD(OPSLIST));
		break;
	case '3': /* Perl/Tk with math, strings, files */
		sprintf(cmdpst, "use Opcode; %s %s\n", SECURE_OPSETS_L3, OPM_ADD(OPSLIST));
		break;
	case '4': /* All opcodes permitted, no security via opcodes */
		sprintf(cmdpst, "use Opcode; %s %s\n", SECURE_OPSETS_L4, OPM_ADD(OPSLIST));
#ifdef NPP_DEBUG
		fprintf(This->log_fd, "%s\n", cmdpst);
#endif
		break;
	case '5': /* use defined security level */
		sprintf(cmdpst, "use Opcode; %s %s\n", SECURE_OPSETS_USER, OPM_ADD(OPSLIST));
		break;
	default: /* yes, it has happened, and will happen again! */
		fprintf(stderr, "ERROR: security level = %d\n", This->secure_parms[0]);
		return(-1);
	}

	/* Build a perl string for the %Plugin::brinfo hash to hold the window parameter for TK. */

	/* use this for windowed plugin */
//	sprintf(winparms, "$Plugin::brinfo{xwindow_id} = 0x%x; $Plugin::brinfo{x_min} = %d; $Plugin::brinfo{y_min} = %d; $Plugin::brinfo{x_len} = %d; $Plugin::brinfo{y_len} = %d; $Plugin::brinfo{version} = %s;",
//		This->fhWnd, This->x, This->y, This->width, This->height, VERSION);

	/* use this for plugin without capability to draw in Netscape*/
	sprintf(winparms, "$Plugin::brinfo{x_min} = %d; $Plugin::brinfo{y_min} = %d; $Plugin::brinfo{x_len} = %d; $Plugin::brinfo{y_len} = %d; $Plugin::brinfo{version} = %s;",
		This->x, This->y, This->width, This->height, VERSION);

	/* Try this for windowless plugin with Netscape as parent */
//	sprintf(winparms, "$Plugin::brinfo{xwindow_id} = 0x%x; $Plugin::brinfo{x_min} = %d; $Plugin::brinfo{y_min} = %d; $Plugin::brinfo{x_len} = %d; $Plugin::brinfo{y_len} = %d; $Plugin::brinfo{version} = %s;",
//		This->phWnd, This->x, This->y, This->width, This->height, VERSION);

	l = strlen(This->perl_exe) + strlen(cmdpre) + strlen(winparms) + strlen(cmdpst) + 7 + 1;
	if (l > PPL_MAX_CMD)
	{
		fprintf(stderr, "PerlPlus plugin preamble string length %d > %d.\n", l, PPL_MAX_CMD);
		return(NPERR_GENERIC_ERROR);
	}

	sprintf(cmd, "#!%s\n\n%s\n%s\n%s\n", This->perl_exe, cmdpre, winparms, cmdpst);
	write(This->prog_fd, cmd, strlen(cmd));

#ifdef NPP_DEBUG
	fprintf(This->log_fd, "This->fhWnd %x\n", This->fhWnd);
	fprintf(This->log_fd, "perl_exe length %d\n", strlen(This->perl_exe));
	fprintf(This->log_fd, "cmdpre   length %d\n", strlen(cmdpre));
	fprintf(This->log_fd, "winparms length %d\n", strlen(winparms));
	fprintf(This->log_fd, "cmdpst   length %d\n", strlen(cmdpst));
	fprintf(This->log_fd, "cmd  length %d\n", strlen(cmd));
	fprintf(This->log_fd, "This->secure_parms[0] = 0x%x\n", This->secure_parms[0]);
#endif

	NPN_MemFree(cmdpst);
	return(1);
}

NPError
NPPerl_TmpOpen(PluginInstance *This)
{
	if((This->prog_fd = open(This->filename, _O_WRONLY|_O_CREAT, 0700)) == -1)
	{
		/* This code needs to be replaced, probably by CFILE methoods */
		fprintf(stderr, "could not open %s for output\n", This->filename);
		return NPERR_GENERIC_ERROR;
	}
	if ((This->temp_fd = open(This->tmpname, _O_RDWR|_O_CREAT, 0700)) == -1)
	{
		fprintf (stderr, "Could not open %s for output\n", This->tmpname);
		return NPERR_GENERIC_ERROR;
	}
#ifdef NPP_DEBUG
	if ((This->log_fd = fopen(This->logname,"a+")) == NULL)
	{
		fprintf (stderr, "Could not open %s for output\n", "c:\\temp\\plugin_log");
		return NPERR_GENERIC_ERROR;
	}
#endif
	return NPERR_NO_ERROR;
}

/*
 * Execute the Perl Program
 * This routine append the program temp file to the temp file containing the
 * opcode restriction stuff and execls an interpreter to run the result.
 */

NPError
NPPerl_Execl(PluginInstance *This)
{
	int perl;
	char *copy_buf;
	int in_bytes, out_bytes;
	int rc;
	PluginInstance * my_ptr;

	my_ptr = This;

	if ((rc = NPPerl_WriteTemp(This)) == 1) 
	{
		if ((copy_buf = (char *)NPN_MemAlloc(PPL_INBUF_SZ)) == NULL)
		{
			fprintf(stderr, "ERROR: Not enough memory for copy buffer\n");
			return(NPERR_GENERIC_ERROR);
		}
		lseek(This->temp_fd, 0L, 0);

		while ((in_bytes = read(This->temp_fd, copy_buf, PPL_INBUF_SZ)) > 0)
		{
			out_bytes = write(This->prog_fd, copy_buf, in_bytes);
			if (out_bytes != in_bytes)
			{
				fprintf(stderr, "ERROR: copy write failed\n");
				return(NPERR_GENERIC_ERROR);
			}
		}
		if (in_bytes == -1)
		{
			perror("ZORK!\n");
			fprintf(stderr, "ERROR: copy read failed\n");
			return(NPERR_GENERIC_ERROR);
		}
		NPN_MemFree(copy_buf);

		close(This->prog_fd);
		close(This->temp_fd);
	} else {
		fprintf(stderr, "ERROR: Attempt to execute unauthorized application failed.\n");
		close(This->prog_fd);
		close(This->temp_fd);
		unlink(This->filename);
		unlink(This->tmpname);
#ifdef NPP_DEBUG
		unlink(This->logname);
#endif
		return NPERR_GENERIC_ERROR;
	}

	if (( perl = _spawnl(_P_NOWAIT, This->perl_exe, This->perl_exe, This->filename, NULL)) == -1)
	{
		return NPERR_GENERIC_ERROR;
	}
	return(NPERR_NO_ERROR);
}



int
NPPerl_CheckAuth(NPP instance, NPStream *stream)
{
	char buffer[PPL_MAX_STRING_LENGTH];
	int l;

	PluginInstance *This;
	if (instance != NULL)
		This = (PluginInstance *)instance->pdata;

	l = strlen(CGI_TYPE) + strlen(stream->url) + 4 + 1;
	if (l > PPL_MAX_STRING_LENGTH)
	{
		fprintf(stderr, "POST string length %d > %d.\n", l , PPL_MAX_STRING_LENGTH);
		return(NPERR_GENERIC_ERROR);
	}
	sprintf(buffer, "%s %d\n\nURL=%s\n", CGI_TYPE, strlen(stream->url)+4, stream->url);

#ifdef NPP_DEBUG
	fprintf(This->log_fd, "POST buffer length %d\n", strlen(buffer));
#endif
	/*
	 * Send the URL to the CGI program for authorization checking.
	 */

	NPN_PostURLNotify(instance,
						This->secure_cgi, NULL,
						strlen(buffer),
						(const char *)buffer,
						FALSE, NULL);

	return(NPERR_NO_ERROR);
}
 
/* End Custom functions */

/*+++++++++++++++++++++++++++++++++++++++++++++++++
 * NPP_Initialize:
 * Provides global initialization for a plug-in, and returns an error value. 
 *
 * This function is called once when a plug-in is loaded, before the first instance
 * is created. You should allocate any memory or resources shared by all
 * instances of your plug-in at this time. After the last instance has been deleted,
 * NPP_Shutdown will be called, where you can release any memory or
 * resources allocated by NPP_Initialize. 
 +++++++++++++++++++++++++++++++++++++++++++++++++*/
NPError
NPP_Initialize(void)
{
	ppl_instance = 0; // added for PerlPlusPlugin
    return NPERR_NO_ERROR;
}

/*+++++++++++++++++++++++++++++++++++++++++++++++++
 * NPP_GetJavaClass:
 * New in Netscape Navigator 3.0. 
 *
 * NPP_GetJavaClass is called during initialization to ask your plugin
 * what its associated Java class is. If you don't have one, just return
 * NULL. Otherwise, use the javah-generated "use_" function to both
 * initialize your class and return it. If you can't find your class, an
 * error will be signalled by "use_" and will cause the Navigator to
 * complain to the user.
 +++++++++++++++++++++++++++++++++++++++++++++++++*/
jref
NPP_GetJavaClass(void)
{
	return NULL;
}

/*+++++++++++++++++++++++++++++++++++++++++++++++++
 * NPP_Shutdown:
 * Provides global deinitialization for a plug-in. 
 * 
 * This function is called once after the last instance of your plug-in is destroyed.
 * Use this function to release any memory or resources shared across all
 * instances of your plug-in. You should be a good citizen and declare that
 * you're not using your java class any more. This allows java to unload
 * it, freeing up memory.
 +++++++++++++++++++++++++++++++++++++++++++++++++*/
void
NPP_Shutdown(void)
{
	return;
}

/*+++++++++++++++++++++++++++++++++++++++++++++++++
 * NPP_New:
 * Creates a new instance of a plug-in and returns an error value. 
 * 
 * NPP_New creates a new instance of your plug-in with MIME type specified
 * by pluginType. The parameter mode is NP_EMBED if the instance was created
 * by an EMBED tag, or NP_FULL if the instance was created by a separate file.
 * You can allocate any instance-specific private data in instance->pdata at this
 * time. The NPP pointer is valid until the instance is destroyed. 
 +++++++++++++++++++++++++++++++++++++++++++++++++*/
NPError 
NPP_New(NPMIMEType pluginType,
	NPP instance,
	uint16 mode,
	int16 argc,
	char* argn[],
	char* argv[],
	NPSavedData* saved)
{
	NPError result = NPERR_NO_ERROR;
	PluginInstance* This;
	
	if (instance == NULL) {
		return NPERR_INVALID_INSTANCE_ERROR;
	}
	instance->pdata = NPN_MemAlloc(sizeof(PluginInstance));
	This = (PluginInstance*) instance->pdata;
	if (This == NULL) {
	    return NPERR_OUT_OF_MEMORY_ERROR;
	}
	/* mode is NP_EMBED, NP_FULL, or NP_BACKGROUND (see npapi.h) */
	This->fWindow = NULL;
	This->fMode = mode;
	
	This->fhWnd = NULL;
	This->fDefaultWindowProc = NULL;

		/* PLUGIN DEVELOPERS:
		 *	Initialize fields of your plugin
		 *	instance data here.  If the NPSavedData is non-
		 *	NULL, you can use that data (returned by you from
		 *	NPP_Destroy to set up the new plugin instance).
		 */

	// Added for NpPerlPlus

	strncpy(This->perl_exe, PERL_EXE_PATH, PPL_MAX_STRING_LENGTH);
	This->perl_exe[PPL_MAX_STRING_LENGTH] ='\0';
	strncpy(This->secure_cgi, SECURE_CGI, PPL_MAX_STRING_LENGTH);
	This->secure_cgi[PPL_MAX_STRING_LENGTH] = '\0';

#if ALLOW_ENV_CONFIG
	env = getenv("PPL_PERL_EXE");
	if (env) {
		strncpy(This->perl_exe, env, PPL_MAX_STRING_LENGTH);
		This->perl_exe[PPL_MAX_STRING_LENGTH] ='\0';
	}
	env = getenv("PPL_SECURE_CGI");
	if (env) {
	strncpy(This->secure_cgi, PERL_EXE_PATH, PPL_MAX_STRING_LENGTH);
	This->secure_cgi[PPL_MAX_STRING_LENGTH] = '\0';
	}
#endif
	/*
	 * In order to allow multiple instances of the plugin, say in an embedded
	 * mode, the temp files have to have uniuqe names.  We use both the pid of
	 * the browser and an instance number. 0, 1, ...
	 */
	sprintf (This->filename, "c:\\temp\\NPperlplusplugin-%d-%d", ppl_instance, _getpid());
	sprintf (This->tmpname, "c:\\temp\\NPperlplustmp-%d-%d", ppl_instance, _getpid());
#ifdef NPP_DEBUG
	sprintf (This->logname, "c:\\temp\\NPperlpluslog-%d-%d", ppl_instance, _getpid());
#endif



	NPPerl_TmpOpen(This);
	ppl_instance++; /* count this ppl instance */

	sprintf(This->secure_parms, "%d\n", 0);
	This->from =0;
	This->write_cgi = 0;
	return result;
}


/*+++++++++++++++++++++++++++++++++++++++++++++++++
 * NPP_Destroy:
 * Deletes a specific instance of a plug-in and returns an error value. 

 * NPP_Destroy is called when a plug-in instance is deleted, typically because the
 * user has left the page containing the instance, closed the window, or quit the
 * application. You should delete any private instance-specific information stored
 * in instance->pdata. If the instance being deleted is the last instance created
 * by your plug-in, NPP_Shutdown will subsequently be called, where you can
 * delete any data allocated in NPP_Initialize to be shared by all your plug-in's
 * instances. Note that you should not perform any graphics operations in
 * NPP_Destroy as the instance's window is no longer guaranteed to be valid. 
 +++++++++++++++++++++++++++++++++++++++++++++++++*/
NPError 
NPP_Destroy(NPP instance, NPSavedData** save)
{
	PluginInstance* This;

	if (instance == NULL)
		return NPERR_INVALID_INSTANCE_ERROR;

	This = (PluginInstance*) instance->pdata;
	if( This->fWindow != NULL ) { /* If we have a window, clean
								 * it up. */
		SetWindowLong( This->fhWnd, GWL_WNDPROC, (LONG)This->fDefaultWindowProc);
		RemoveProp(This->fhWnd, PROPERTY);
		RemoveProp(This->fhWnd, gInstanceLookupString);
		This->fDefaultWindowProc = NULL;
		This->fhWnd = NULL;

		unlink(This->filename);
		unlink(This->tmpname);
#ifdef NPP_DEBUG
		unlink(This->logname);
#endif
	}


	/* PLUGIN DEVELOPERS:
	 *	If desired, call NP_MemAlloc to create a
	 *	NPSavedDate structure containing any state information
	 *	that you want restored if this plugin instance is later
	 *	recreated.
	 */

	if (This != NULL) {
		NPN_MemFree(instance->pdata);
		instance->pdata = NULL;
	}

	return NPERR_NO_ERROR;
}

/*+++++++++++++++++++++++++++++++++++++++++++++++++
 * NPP_SetWindow:
 * Sets the window in which a plug-in draws, and returns an error value. 
 * 
 * NPP_SetWindow informs the plug-in instance specified by instance of the
 * the window denoted by window in which the instance draws. This NPWindow
 * pointer is valid for the life of the instance, or until NPP_SetWindow is called
 * again with a different value. Subsequent calls to NPP_SetWindow for a given
 * instance typically indicate that the window has been resized. If either window
 * or window->window are NULL, the plug-in must not perform any additional
 * graphics operations on the window and should free any resources associated
 * with the window. 
 +++++++++++++++++++++++++++++++++++++++++++++++++*/



NPError 
NPP_SetWindow(NPP instance, NPWindow* window)
{
	NPError result = NPERR_NO_ERROR;
	PluginInstance* This;



#ifdef NPP_DEBUG
	LONG parent_hwnd;
	LONG  id;
	LONG style;
	LONG hinstance;
	unsigned long class_name;
	char class_nameA[256];
	WNDCLASSEX class_struct;
	WNDCLASSEX * class_ptr;
#endif

	if (instance == NULL)
		return NPERR_INVALID_INSTANCE_ERROR;

	This = (PluginInstance*) instance->pdata;

	/*
	 * PLUGIN DEVELOPERS:
	 *	Before setting window to point to the
	 *	new window, you may wish to compare the new window
	 *	info to the previous window (if any) to note window
	 *	size changes, etc.
	 */
	if( This->fWindow != NULL ) /* If we already have a window, clean
								 * it up before trying to subclass
								 * the new window. */
	{
		if( (window == NULL) || ( window->window == NULL ) ) {
			/* There is now no window to use. get rid of the old
			 * one and exit. */
			SetWindowLong( This->fhWnd, GWL_WNDPROC, (LONG)This->fDefaultWindowProc);
			This->fDefaultWindowProc = NULL;
			This->fhWnd = NULL;
			This->fWindow=window;
			RemoveProp(This->fhWnd, PROPERTY);
			RemoveProp(This->fhWnd, gInstanceLookupString);
			return NPERR_NO_ERROR;
		}

		else if ( This->fhWnd == (HWND) window->window ) {
			/* The new window is the same as the old one. Redraw and get out. */
			InvalidateRect( This->fhWnd, NULL, TRUE );
			UpdateWindow( This->fhWnd );
			This->fWindow=window;
			return NPERR_NO_ERROR;
		}
		else {
			/* We've been given a new window, so clean up the old window, so that we can 
			   subclass the new one later. */
			SetWindowLong( This->fhWnd, GWL_WNDPROC, (LONG)This->fDefaultWindowProc);
			RemoveProp(This->fhWnd, PROPERTY);
			RemoveProp(This->fhWnd, gInstanceLookupString);
			This->fDefaultWindowProc = NULL;
			This->fhWnd = NULL;

			/*
			 * Added for NpPerlPlus
			 * Don't wait, subclass the new window now and restart
			 * the perl program with it.
			 */
			This->fDefaultWindowProc = (WNDPROC)SetWindowLong( (HWND)window->window, GWL_WNDPROC, (LONG)PluginWindowProc);
			This->fhWnd = (HWND) window->window;
			SetProp( This->fhWnd, gInstanceLookupString, (HANDLE)This);
			SetProp(This->fhWnd, PROPERTY, (HANDLE)This);

			InvalidateRect( This->fhWnd, NULL, TRUE );
			UpdateWindow( This->fhWnd );
	
			This->fWindow = window;			
			This->x = window->x;
			This->y = window->y;
			This->width = window->width;
			This->height = window->height;


			if ((result = NPPerl_TmpOpen(This)) == 0) {
				return(NPPerl_Execl(This)); /* Restart the perl program in the new window */
			} else {
				return result;
			}
		}
	}
	else if( (window == NULL) || ( window->window == NULL ) ) {
		/* We can just get out of here if there is no current
		 * window and there is no new window to use. */
		This->fWindow=window;
		return NPERR_NO_ERROR;
	}

	/* At this point, we will subclass
	 * window->window so that we can begin drawing and
	 * receiving window messages. */
	This->fDefaultWindowProc = (WNDPROC)SetWindowLong( (HWND)window->window, GWL_WNDPROC, (LONG)PluginWindowProc);
	This->fhWnd = (HWND) window->window;
	SetProp( This->fhWnd, gInstanceLookupString, (HANDLE)This);
	SetProp(This->fhWnd, PROPERTY, (HANDLE)This);

	InvalidateRect( This->fhWnd, NULL, TRUE );
	ShowWindow( This->fhWnd, SW_SHOWMAXIMIZED);
	UpdateWindow( This->fhWnd );
	This->fWindow = window;
	This->x = window->x;
	This->y = window->y;
	This->width = window->width;
	This->height = window->height;

#ifdef NPP_DEBUG
	style = GetWindowLong(This->fhWnd, GWL_STYLE);
	id = GetWindowLong(This->fhWnd, GWL_ID);
	parent_hwnd = GetWindowLong(This->fhWnd, GWL_HWNDPARENT);
	class_name = GetClassLong(This->fhWnd, GCW_ATOM);
	hinstance = GetWindowLong(This->fhWnd, GWL_HINSTANCE);
	class_ptr = &class_struct;
	GlobalGetAtomName((ATOM)class_struct.lpszClassName, class_nameA, 256);
	GetClassInfoEx( (HINSTANCE)hinstance, (const char *)class_name, class_ptr);

	fprintf(This->log_fd, "\nMy Hwnd = 0x%x, \nMy id = 0x%x, \nMy parent = 0x%x, \nMy Style = 0x%x, \nMy Class = 0x%x\n", This->fhWnd,  id, parent_hwnd, style, class_name);
    fprintf(This->log_fd, "\nClass style = 0x%x, Class name = %s\n", class_struct.style, class_nameA);
#endif

	return result;
}

/*+++++++++++++++++++++++++++++++++++++++++++++++++
 * NPP_NewStream:
 * Notifies an instance of a new data stream and returns an error value. 
 * 
 * NPP_NewStream notifies the instance denoted by instance of the creation of
 * a new stream specifed by stream. The NPStream* pointer is valid until the
 * stream is destroyed. The MIME type of the stream is provided by the
 * parameter type. 
 +++++++++++++++++++++++++++++++++++++++++++++++++*/
NPError 
NPP_NewStream(NPP instance,
	      NPMIMEType type,
	      NPStream *stream, 
	      NPBool seekable,
	      uint16 *stype)
{
	PluginInstance* This;

	if (instance == NULL)
		return NPERR_INVALID_INSTANCE_ERROR;

	This = (PluginInstance*) instance->pdata;

	if(This->from == FROM_CGI) /* Why does cgi give me back two streams? */
		return NPERR_NO_ERROR;

	if((strcmp(This->secure_cgi, stream->url)) == 0) {
			This->from = FROM_CGI;
	} else {
		This->from = FROM_APPLICATION;
	}
	return NPERR_NO_ERROR;
}


/* PLUGIN DEVELOPERS:
 *	These next 2 functions are directly relevant in a plug-in which
 *	handles the data in a streaming manner. If you want zero bytes
 *	because no buffer space is YET available, return 0. As long as
 *	the stream has not been written to the plugin, Navigator will
 *	continue trying to send bytes.  If the plugin doesn't want them,
 *	just return some large number from NPP_WriteReady(), and
 *	ignore them in NPP_Write().  For a NP_ASFILE stream, they are
 *	still called but can safely be ignored using this strategy.
 */

int32 STREAMBUFSIZE = 0X0FFFFFFF; /* If we are reading from a file in NPAsFile
								   * mode so we can take any size stream in our
								   * write call (since we ignore it) */

/*+++++++++++++++++++++++++++++++++++++++++++++++++
 * NPP_WriteReady:
 * Returns the maximum number of bytes that an instance is prepared to accept
 * from the stream. 
 * 
 * NPP_WriteReady determines the maximum number of bytes that the
 * instance will consume from the stream in a subsequent call NPP_Write. This
 * function allows Netscape to only send as much data to the instance as the
 * instance is capable of handling at a time, allowing more efficient use of
 * resources within both Netscape and the plug-in. 
 +++++++++++++++++++++++++++++++++++++++++++++++++*/
int32 
NPP_WriteReady(NPP instance, NPStream *stream)
{
	PluginInstance* This;
	if (instance != NULL)
		This = (PluginInstance*) instance->pdata;

	/* added for NpPerlPlus Plug-in */

	/* Number of bytes ready to accept in NPP_Write() */
	switch(This->from){
	case FROM_APPLICATION:
		/* Number of bytes ready to accept from application */
		return STREAMBUFSIZE;
		break;
	case FROM_CGI:
		/* Number of bytes ready to accept from CGI */
		return CGISIZE;
		break;
	}
	return STREAMBUFSIZE;
}


/*+++++++++++++++++++++++++++++++++++++++++++++++++
 * NPP_Write:
 * Delivers data from a stream and returns the number of bytes written. 
 * 
 * NPP_Write is called after a call to NPP_NewStream in which the plug-in
 * requested a normal-mode stream, in which the data in the stream is delivered
 * progressively over a series of calls to NPP_WriteReady and NPP_Write. The
 * function delivers a buffer buf of len bytes of data from the stream identified
 * by stream to the instance. The parameter offset is the logical position of
 * buf from the beginning of the data in the stream. 
 * 
 * The function returns the number of bytes written (consumed by the instance).
 * A negative return value causes an error on the stream, which will
 * subsequently be destroyed via a call to NPP_DestroyStream. 
 * 
 * Note that a plug-in must consume at least as many bytes as it indicated in the
 * preceeding NPP_WriteReady call. All data consumed must be either processed
 * immediately or copied to memory allocated by the plug-in: the buf parameter
 * is not persistent. 
 +++++++++++++++++++++++++++++++++++++++++++++++++*/
int32 
NPP_Write(NPP instance, NPStream *stream, int32 offset, int32 len, void *buffer)
{
	if (instance != NULL) {
		PluginInstance* This = (PluginInstance*) instance->pdata;
	
	/* added for NpPerlPlus Plug-in */
	/* 
	 * Write the incomming stream to our temporary file.  Note that this method
	 * may get called multiple times by the browser, depending on  network
	 * latency and other confounding events.   That's why we save it 
	 * to a temp file.
	 */

		switch(This->from) {
		case FROM_APPLICATION:
			len = write(This->temp_fd, buffer, len);
			break;
		case FROM_CGI:
#ifdef NPP_DEBUG
		fprintf(This->log_fd, "buffer = %s\n", buffer);
#endif
			if(This->write_cgi == 0 ) {
				strncpy(This->secure_parms, (char *)buffer, CGISIZE);
				This->secure_parms[CGISIZE] = '\0';
				This->write_cgi = 1;
			}
#ifdef NPP_DEBUG
			fprintf(This->log_fd, "This->secure_parms = %s\n", This->secure_parms);
#endif
			break;
		}
	}
		return len;		/* The number of bytes accepted */
}

/*+++++++++++++++++++++++++++++++++++++++++++++++++
 * NPP_DestroyStream:
 * Indicates the closure and deletion of a stream, and returns an error value. 
 * 
 * The NPP_DestroyStream function is called when the stream identified by
 * stream for the plug-in instance denoted by instance will be destroyed. You
 * should delete any private data allocated in stream->pdata at this time. 
 +++++++++++++++++++++++++++++++++++++++++++++++++*/
NPError 
NPP_DestroyStream(NPP instance, NPStream *stream, NPError reason)
{
	PluginInstance* This;
	int rc;

	if (instance == NULL)
		return NPERR_INVALID_INSTANCE_ERROR;
	This = (PluginInstance*) instance->pdata;

	/* Added for NpPerlPlus Plug-in */
	/*
	 * If this stream came from the CGI, then we check the parameters it returned
	 * and if everything is ok, we fork/exec the application.  If the stream came
	 * from the application, then we have to run an authorization check before
	 * running the application.
	 */

		switch(This->from){
		case FROM_APPLICATION:
			/* POST to the secureity CGI here */
			NPPerl_CheckAuth(instance, stream);
			break;
		case FROM_CGI:
			return(rc = NPPerl_Execl(This));
		}
	return NPERR_NO_ERROR;
}

/*+++++++++++++++++++++++++++++++++++++++++++++++++
 * NPP_StreamAsFile:
 * Provides a local file name for the data from a stream. 
 * 
 * NPP_StreamAsFile provides the instance with a full path to a local file,
 * identified by fname, for the stream specified by stream. NPP_StreamAsFile is
 * called as a result of the plug-in requesting mode NP_ASFILEONLY or
 * NP_ASFILE in a previous call to NPP_NewStream. If an error occurs while
 * retrieving the data or writing the file, fname may be NULL. 
 +++++++++++++++++++++++++++++++++++++++++++++++++*/
void 
NPP_StreamAsFile(NPP instance, NPStream *stream, const char* fname)
{
	PluginInstance* This;
	if (instance != NULL)
		This = (PluginInstance*) instance->pdata;
}

/*+++++++++++++++++++++++++++++++++++++++++++++++++
 * NPP_Print:
 +++++++++++++++++++++++++++++++++++++++++++++++++*/
void 
NPP_Print(NPP instance, NPPrint* printInfo)
{
	if(printInfo == NULL)
		return;

	if (instance != NULL) {
		PluginInstance* This = (PluginInstance*) instance->pdata;
	
		if (printInfo->mode == NP_FULL) {
		    /*
		     * PLUGIN DEVELOPERS:
		     *	If your plugin would like to take over
		     *	printing completely when it is in full-screen mode,
		     *	set printInfo->pluginPrinted to TRUE and print your
		     *	plugin as you see fit.  If your plugin wants Netscape
		     *	to handle printing in this case, set
		     *	printInfo->pluginPrinted to FALSE (the default) and
		     *	do nothing.  If you do want to handle printing
		     *	yourself, printOne is true if the print button
		     *	(as opposed to the print menu) was clicked.
		     *	On the Macintosh, platformPrint is a THPrint; on
		     *	Windows, platformPrint is a structure
		     *	(defined in npapi.h) containing the printer name, port,
		     *	etc.
		     */

			void* platformPrint =
				printInfo->print.fullPrint.platformPrint;
			NPBool printOne =
				printInfo->print.fullPrint.printOne;
			
			/* Do the default*/
			printInfo->print.fullPrint.pluginPrinted = FALSE;
		}
		else {	/* If not fullscreen, we must be embedded */
		    /*
		     * PLUGIN DEVELOPERS:
		     *	If your plugin is embedded, or is full-screen
		     *	but you returned false in pluginPrinted above, NPP_Print
		     *	will be called with mode == NP_EMBED.  The NPWindow
		     *	in the printInfo gives the location and dimensions of
		     *	the embedded plugin on the printed page.  On the
		     *	Macintosh, platformPrint is the printer port; on
		     *	Windows, platformPrint is the handle to the printing
		     *	device context.
		     */

			NPWindow* printWindow =
				&(printInfo->print.embedPrint.window);
			void* platformPrint =
				printInfo->print.embedPrint.platformPrint;
		}
	}
}

/*+++++++++++++++++++++++++++++++++++++++++++++++++
 * NPP_URLNotify:
 * Notifies the instance of the completion of a URL request. 
 * 
 * NPP_URLNotify is called when Netscape completes a NPN_GetURLNotify or
 * NPN_PostURLNotify request, to inform the plug-in that the request,
 * identified by url, has completed for the reason specified by reason. The most
 * common reason code is NPRES_DONE, indicating simply that the request
 * completed normally. Other possible reason codes are NPRES_USER_BREAK,
 * indicating that the request was halted due to a user action (for example,
 * clicking the "Stop" button), and NPRES_NETWORK_ERR, indicating that the
 * request could not be completed (for example, because the URL could not be
 * found). The complete list of reason codes is found in npapi.h. 
 * 
 * The parameter notifyData is the same plug-in-private value passed as an
 * argument to the corresponding NPN_GetURLNotify or NPN_PostURLNotify
 * call, and can be used by your plug-in to uniquely identify the request. 
 +++++++++++++++++++++++++++++++++++++++++++++++++*/
void
NPP_URLNotify(NPP instance, const char* url, NPReason reason, void* notifyData)
{
	return;
}

/*+++++++++++++++++++++++++++++++++++++++++++++++++
 * NPP_HandleEvent:
 * Mac-only, but stub must be present for Windows
 * Delivers a platform-specific event to the instance. 
 * 
 * On the Macintosh, event is a pointer to a standard Macintosh EventRecord.
 * All standard event types are passed to the instance as appropriate. In general,
 * return TRUE if you handle the event and FALSE if you ignore the event. 
 +++++++++++++++++++++++++++++++++++++++++++++++++*/
int16
NPP_HandleEvent(NPP instance, void* event)
{
	return 0;
}
/*******************************************************************************/

