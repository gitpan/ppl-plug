/*
 * npperlplus.c
 *
 *
 * (c) Copyright 1995, Stan Melax, ALL RIGHTS RESERVED.
 * Copyright (C) 1998 Frank Holtry.  All Rights Reserved.
 * (see the accompanying COPYRIGHT files for details of the copyright
 * terms and conditions).
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the same terms as Perl itself.
 *
 * Based on the Netscape Client Plugin "shell".
 * 
 * Frank Holtry <fholtry@lucent.com>
 * Steve Lidie  <sol0@Lehigh.EDU>
 *
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <fcntl.h>
#include "npapi.h"
#include "np_perl.h"
#include "sys/types.h"
#include "sys/wait.h"
#include "unistd.h"

#define PPL_HOME "http://www.rmi.net/~fholtry"

static int ppl_instance;

NPError NPPerl_Execl();
NPError NPPerl_TmpOpen();

/***********************************************************************
 * Instance state information about the plugin.
 *
 * PLUGIN DEVELOPERS:
 *      Use this struct to hold per-instance information that you'll
 *      need in the various functions in this file.
 ***********************************************************************/


typedef struct _PluginInstance
{
  uint16 mode;
  Window window;
  Display *display;
  uint32 x, y;
  uint32 width, height;
  int temp_fd;
  int prog_fd;
  char tmpname[64];
  char filename[64];
  char secure_parms[CGISIZE+1];
  int from;
  int write_cgi;
  char perl_exe[PPL_MAX_STRING_LENGTH];
  char secure_cgi[PPL_MAX_STRING_LENGTH];
} PluginInstance;

char*
NPP_GetMIMEDescription(void)
{
  return(MIME_TYPE);
}


NPError
NPP_Initialize(void)
{
  ppl_instance = 0;
  return NPERR_NO_ERROR;
}


void
NPP_Shutdown(void)
{
}


NPError
NPP_GetValue(void *future, NPPVariable variable, void *value)
{
  NPError err = NPERR_NO_ERROR;

  switch (variable) {
  case NPPVpluginNameString:
    *((char **)value) = "PerlPlus Plugin " VERSION;
    break;
  case NPPVpluginDescriptionString:
    *((char **)value) = "This plugin executes Perl scripts with Opcode restrictions and URL authentication - see the <a href=" PPL_HOME ">PerlPlus Plugin</a> home page for more details." ;
    break;
  default:
    err = NPERR_GENERIC_ERROR;
  }
  return err;
}


NPError 
NPP_New(NPMIMEType pluginType,
        NPP instance,
        uint16 mode,
        int16 argc,
        char* argn[],
        char* argv[],
        NPSavedData* saved)
{
  PluginInstance* This;
  char *env;
  

  if (instance == NULL)
    return NPERR_INVALID_INSTANCE_ERROR;
                
  instance->pdata = NPN_MemAlloc(sizeof(PluginInstance));
        
  This = (PluginInstance*) instance->pdata;

  if (This != NULL)
    {
      /* mode is NP_EMBED, NP_FULL, or NP_BACKGROUND (see npapi.h) */
      This->mode = mode;
      This->window = (Window) 0;

      /* PLUGIN DEVELOPERS:
       *      Initialize fields of your plugin
       *      instance data here.  If the NPSavedData is non-
       *      NULL, you can use that data (returned by you from
       *      NPP_Destroy to set up the new plugin instance).
       */

      strncpy(This->perl_exe,   PERL_EXE_PATH, PPL_MAX_STRING_LENGTH);
      This->perl_exe[PPL_MAX_STRING_LENGTH] = '\0';
      strncpy(This->secure_cgi, SECURE_CGI,    PPL_MAX_STRING_LENGTH);
      This->secure_cgi[PPL_MAX_STRING_LENGTH] = '\0';

#if ALLOW_ENV_CONFIG

      /* If you want to open yet another security hole you have to ask for it! */

      env = getenv("PPL_PERL_EXE");
      if (env) {
	strncpy(This->perl_exe, env, PPL_MAX_STRING_LENGTH);
	This->perl_exe[PPL_MAX_STRING_LENGTH] = '\0';
      }
      env = getenv("PPL_SECURE_CGI");
      if (env) {
	strncpy(This->secure_cgi, env, PPL_MAX_STRING_LENGTH);
	This->secure_cgi[PPL_MAX_STRING_LENGTH] = '\0';
      }

#endif
      /*
       * In order to allow multiple instances of the plugin, say in an embedded
       * mode, the temp files have to have unique names.  We use both the pid of
       * the browser and an instance number. 0, 1, ...
       */

      sprintf (This->filename, "/tmp/NPperlplusplugin-%d.%d", getpid(), ppl_instance); 
      sprintf (This->tmpname, "/tmp/NPperlplustmp-%d.%d", getpid(), ppl_instance);

      NPPerl_TmpOpen(This);

      ppl_instance++; /* count this ppl instance */

      sprintf (This->secure_parms, "%d\n", 0);
      This->from = 0;
      This->write_cgi = 0;
      return NPERR_NO_ERROR;
    }
  else
    return NPERR_OUT_OF_MEMORY_ERROR;
}


NPError 
NPP_Destroy(NPP instance, NPSavedData** save)
{
  PluginInstance* This;

  if (instance == NULL)
    return NPERR_INVALID_INSTANCE_ERROR;

  This = (PluginInstance*) instance->pdata;
  unlink(This->filename);
  unlink(This->tmpname);

  /* PLUGIN DEVELOPERS:
   *      If desired, call NP_MemAlloc to create a
   *      NPSavedDate structure containing any state information
   *      that you want restored if this plugin instance is later
   *      recreated.
   */

  if (This != NULL) {
    NPN_MemFree(instance->pdata);
    instance->pdata = NULL;
  }

  return NPERR_NO_ERROR;
}


NPError 
NPP_SetWindow(NPP instance, NPWindow* window)
{
  PluginInstance* This;
  NPError rc;

  if (instance == NULL)
    return NPERR_INVALID_INSTANCE_ERROR;

  This = (PluginInstance*) instance->pdata;

  /*
   * PLUGIN DEVELOPERS:
   *      Before setting window to point to the
   *      new window, you may wish to compare the new window
   *      info to the previous window (if any) to note window
   *      size changes, etc.
   */

  if(((Window)This->window != (Window)0) && ((Window)window->window != (Window)This->window)){

#if DEBUG
	  fprintf(stderr,"Old windowid = %x New windowid = %x\n", This->window, window->window);
#endif
	  This->window = (Window) window->window;
	  This->x = window->x;
	  This->y = window->y;
	  This->width = window->width;
	  This->height = window->height;
	  This->display = ((NPSetWindowCallbackStruct *)window->ws_info)->display;
	  if ((rc = NPPerl_TmpOpen(This)) == 0){
		return(NPPerl_Execl(This)); /*restart the perl program in the new window*/
	  }else{
		return(rc);
	  }
  }
        
  This->window = (Window) window->window;
  This->x = window->x;
  This->y = window->y;
  This->width = window->width;
  This->height = window->height;
  This->display = ((NPSetWindowCallbackStruct *)window->ws_info)->display;

  return NPERR_NO_ERROR;
}


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

  /*
   * Determine where this stream is from.  If it's from the application, we
   * will need to check it's authorization before executing it.  If it's from
   * the authorization CGI, we'll get the authorization parameters from it.
   */

  if(This->from == FROM_CGI) /* Why does cgi give me back two streams? */
    return NPERR_NO_ERROR;

  if ((strcmp(This->secure_cgi, stream->url)) == 0){
    This->from = FROM_CGI;
  }else{
    This->from = FROM_APPLICATION;
  }
  return NPERR_NO_ERROR;
}

/*
 * This gets called when a CGI app returns in response to a GET/POSTUrlNotify
 */

void 
NPP_URLNotify(NPP instance,
	      const char *url, 
	      NPReason reason,
	      void *notifyData)
{
  return;
}


/* PLUGIN DEVELOPERS:
 *      These next 2 functions are directly relevant in a plug-in which
 *      handles the data in a streaming manner. If you want zero bytes
 *      because no buffer space is YET available, return 0. As long as
 *      the stream has not been written to the plugin, Navigator will
 *      continue trying to send bytes.  If the plugin doesn't want them,
 *      just return some large number from NPP_WriteReady(), and
 *      ignore them in NPP_Write().  For a NP_ASFILE stream, they are
 *      still called but can safely be ignored using this strategy.
 */

int32 STREAMBUFSIZE = 0X0FFFFFFF; /* If we are reading from a file in NPAsFile
                                   * mode so we can take any size stream in our
                                   * write call (since we ignore it) */

int32 
NPP_WriteReady(NPP instance, NPStream *stream)
{
  PluginInstance* This;
  if (instance != NULL)
    This = (PluginInstance*) instance->pdata;

  switch(This->from){
  case FROM_APPLICATION:
    /* Number of bytes ready to accept from application */
    return STREAMBUFSIZE;
    break;
  case FROM_CGI:
    /*number of bytes ready to accept from CGI */
    return CGISIZE;
    break;
  }
}


int32 
NPP_Write(NPP instance, NPStream *stream, int32 offset, int32 len, void *buffer) {
  if (instance != NULL) {
    PluginInstance* This = (PluginInstance*) instance->pdata;
    /*
     * Write the incomming stream to our temprorary file.  Note that this method
     * may get called multiple times by the browser, depending on network latencies
     * and other confounding events.  That's why we save it to a temp file.
     */

    switch(This->from){
    case FROM_APPLICATION:
      len = write(This->temp_fd, buffer, len) ;
      break;
    case FROM_CGI:

#if DEBUG
      fprintf(stderr, "buffer = %s\n", buffer);
#endif

      if(This->write_cgi == 0){
	strncpy(This->secure_parms, buffer, CGISIZE);
	This->secure_parms[CGISIZE] = '\0';
	This->write_cgi = 1;
      }
      break;
    }
  }
  return len;             /* The number of bytes accepted */
}


NPError 
NPP_DestroyStream(NPP instance, NPStream *stream, NPError reason) {

  PluginInstance* This;
  FILE *LOG;
  pid_t	perl;
  char *copy_buf;
  int in_bytes, out_bytes;
  int rc;

  if (instance == NULL)
    return NPERR_INVALID_INSTANCE_ERROR;

  This = (PluginInstance*) instance->pdata;
  /*
   * If this stream came from the CGI, then we check the parameters it returned
   * and if everything is ok, we fork/exec the application. If the stream came
   * from the application, then we have to run an authorization check before
   * running the application.
   */
  switch(This->from){
  case FROM_APPLICATION:
    /* POST to the security CGI here */
    NPPerl_CheckAuth(instance, stream);
    break;
  case FROM_CGI:
    return (rc = NPPerl_Execl(This));
  }
  return NPERR_NO_ERROR;
} /* end NPP_DestroyStream */


void 
NPP_StreamAsFile(NPP instance, NPStream *stream, const char* fname)
{
  PluginInstance* This;
  if (instance != NULL)
    This = (PluginInstance*) instance->pdata;
}


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
       *  If your plugin would like to take over
       *  printing completely when it is in full-screen mode,
       *  set printInfo->pluginPrinted to TRUE and print your
       *  plugin as you see fit.  If your plugin wants Netscape
       *  to handle printing in this case, set
       *  printInfo->pluginPrinted to FALSE (the default) and
       *  do nothing.  If you do want to handle printing
       *  yourself, printOne is true if the print button
       *  (as opposed to the print menu) was clicked.
       *  On the Macintosh, platformPrint is a THPrint; on
       *  Windows, platformPrint is a structure
       *  (defined in npapi.h) containing the printer name, port,
       *  etc.
       */

      void* platformPrint =
	printInfo->print.fullPrint.platformPrint;
      NPBool printOne =
	printInfo->print.fullPrint.printOne;
                        
      /* Do the default*/
      printInfo->print.fullPrint.pluginPrinted = FALSE;
    }
    else {  /* If not fullscreen, we must be embedded */
      /*
       * PLUGIN DEVELOPERS:
       *  If your plugin is embedded, or is full-screen
       *  but you returned false in pluginPrinted above, NPP_Print
       *  will be called with mode == NP_EMBED.  The NPWindow
       *  in the printInfo gives the location and dimensions of
       *  the embedded plugin on the printed page.  On the
       *  Macintosh, platformPrint is the printer port; on
       *  Windows, platformPrint is the handle to the printing
       *  device context.
       */

      NPWindow* printWindow =
	&(printInfo->print.embedPrint.window);
      void* platformPrint =
	printInfo->print.embedPrint.platformPrint;
    }
  }
}

/*
 * Open the temporary files
 */
NPError
NPPerl_TmpOpen(PluginInstance *This) {

      if ((This->prog_fd  = open(This->filename, O_WRONLY|O_CREAT, 0700)) == -1){
	fprintf (stderr, "Could not open %s for output\n", This->filename) ;
	return NPERR_GENERIC_ERROR;
      }

      if ((This->temp_fd  = open(This->tmpname, O_RDWR|O_CREAT, 0700)) == -1){
	fprintf (stderr, "Could not open %s for output\n", This->tmpname) ;
	return NPERR_GENERIC_ERROR;
      }
      return NPERR_NO_ERROR;
}

/*
 * Execute the Perl Program
 * This routine appends the program temp file to the temp file containing the
 * opcode restriction stuff and execls an interpreter to run the result.
 */

NPError
NPPerl_Execl(PluginInstance *This) {

	pid_t	perl;
	char *copy_buf;
	int in_bytes, out_bytes;
	int rc;

	if ((rc = NPPerl_WriteTemp(This)) == 1){
	  if ((copy_buf = NPN_MemAlloc(PPL_INBUF_SZ)) == NULL){
	    fprintf(stderr, "ERROR: Not enough memory for copy buffer\n");
	    return(NPERR_GENERIC_ERROR);
	  }
	
	  lseek(This->temp_fd, 0L, 0);
	
	  while ( (in_bytes = read(This->temp_fd, copy_buf, PPL_INBUF_SZ)) > 0 ) {
	    out_bytes = write(This->prog_fd, copy_buf, in_bytes);
	    if (out_bytes != in_bytes) {
	      fprintf(stderr, "ERROR:  copy write failed\n");
	      return(NPERR_GENERIC_ERROR);
	    }
	  }
	  if (in_bytes == -1) {
	    perror("ZORK!\n");
	    fprintf(stderr, "ERROR:  copy read failed\n");
	    return(NPERR_GENERIC_ERROR);
	  }
	  NPN_MemFree(copy_buf);
	
	  close(This->prog_fd);
	  close(This->temp_fd);
	} else {
	  fprintf(stderr,"ERROR: Attempt to execute unauthorized application failed.\n");
	  close(This->prog_fd);
	  close(This->temp_fd);
	  unlink(This->filename);
	  unlink(This->tmpname);
	  return NPERR_GENERIC_ERROR;
	}
	if (( perl=fork() ) == -1){
	  fprintf(stderr, "Could not fork Perl interpreter.\n");
	  return NPERR_GENERIC_ERROR;
	}else {
	  if(perl == 0)
	    execl(This->perl_exe, This->perl_exe, This->filename, (char *) NULL);
	} /* end fork */
}


/*
 * Local hacks to implement the security stuff
 */

int
NPPerl_WriteTemp(PluginInstance *This) {
	 
  char winparms[PPL_WINPARM_SZ];
  char *cmdpre = "$ENV{PATH}=\"/bin:/usr/bin\";";
  char *cmdpst;
  char cmd[PPL_MAX_CMD];
  int l;

  if ((cmdpst = NPN_MemAlloc((uint32)PPL_OPLIST_SZ)) == NULL){
    fprintf(stderr, "ERROR: Not enough memory for oplist\n");
    return(-1);
  }
  switch (This->secure_parms[0]) {
  case '0': /* Execution not authorized */
    return(-1);
  case '1': /* Opcodes 'default:', relatively secure*/
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
    break;
  case '5': /* user defined security level */
    sprintf(cmdpst, "use Opcode; %s %s\n", SECURE_OPSETS_USER, OPM_ADD(OPSLIST));
    break;
  default: /* yes, it has happened, and will happen again! */
    fprintf(stderr, "ERROR:  security level=%d!\n", This->secure_parms[0]);
    return(-1);
  }

  /* Build a perl string for the %Plugin::brinfo hash to hold the window parameters for Tk. */

  sprintf(winparms, "$Plugin::brinfo{xwindow_id} = 0x%x; $Plugin::brinfo{x_min} = %d; $Plugin::brinfo{y_min} = %d; $Plugin::brinfo{x_len} = %d; $Plugin::brinfo{y_len} = %d; $Plugin::brinfo{display} = 0x%x; $Plugin::brinfo{version} = %s;",
	  This->window, This->x, This ->y, This->width, This->height, This->display, VERSION);

  l = strlen(This->perl_exe) + strlen(cmdpre) + strlen(winparms) + strlen(cmdpst) + 7 + 1;
  if (l > PPL_MAX_CMD) {
    fprintf(stderr, "PerlPlus plugin preamble string length %d > %d.\n", l, PPL_MAX_CMD);
    return(NPERR_GENERIC_ERROR);
  }

  sprintf(cmd, "#!%s\n\n%s\n%s\n%s\n", This->perl_exe, cmdpre, winparms, cmdpst);
  write(This->prog_fd, cmd, strlen(cmd));

#if DEBUG
  fprintf(stderr, "perl_exe length %d\n", strlen(This->perl_exe));
  fprintf(stderr, "cmdpre   length %d\n", strlen(cmdpre));
  fprintf(stderr, "winparms length %d\n", strlen(winparms));
  fprintf(stderr, "cmdpst   length %d\n", strlen(cmdpst));
  fprintf(stderr, "cmd   length %d\n", strlen(cmd));
  fprintf(stderr, "This->secure_parms[0] =  0x%x\n", This->secure_parms[0]);
#endif

  NPN_MemFree(cmdpst);
  return(1);

}

int
NPPerl_CheckAuth(NPP instance, NPStream *stream) {

  char buffer[PPL_MAX_STRING_LENGTH];
  int l;

  PluginInstance* This;
  if (instance != NULL)
    This = (PluginInstance*) instance->pdata;


  l = strlen(CGI_TYPE) + strlen(stream->url) + 4 + 1;
  if (l > PPL_MAX_STRING_LENGTH) {
    fprintf(stderr, "POST string length %d > %d.\n", l, PPL_MAX_STRING_LENGTH);
    return(NPERR_GENERIC_ERROR);
  }

  sprintf(buffer,"%s %d\n\nURL=%s\n", CGI_CTYPE, strlen(stream->url)+4, stream->url);

#if DEBUG
  fprintf(stderr, "POST buffer length %d\n", strlen(buffer));
#endif

  /*
   * Send the URL to the CGI program for authorization checking.
   */

  NPN_PostURLNotify(instance,
		    This->secure_cgi, NULL,
		    strlen( buffer ),
		    (const char *)buffer,
		    FALSE, NULL);

}
