# Microsoft Developer Studio Generated NMAKE File, Based on NpPerlPlus.dsp
CFG=NpPerlPlus - Win32 Release
!IF "$(CFG)" == ""
CFG=NpPerlPlus - Win32 Debug
!MESSAGE No configuration specified. Defaulting to NpPerlPlus - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "NpPerlPlus - Win32 Release" && "$(CFG)" !=\
 "NpPerlPlus - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "NpPerlPlus.mak" CFG="NpPerlPlus - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "NpPerlPlus - Win32 Release" (based on\
 "Win32 (x86) Dynamic-Link Library")
!MESSAGE "NpPerlPlus - Win32 Debug" (based on\
 "Win32 (x86) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "NpPerlPlus - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\NpPerlPlus.dll"

!ELSE 

ALL : "$(OUTDIR)\NpPerlPlus.dll"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\NpPerlPlus.obj"
	-@erase "$(INTDIR)\NpPerlPlus.res"
	-@erase "$(INTDIR)\npwin.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(OUTDIR)\NpPerlPlus.dll"
	-@erase "$(OUTDIR)\NpPerlPlus.exp"
	-@erase "$(OUTDIR)\NpPerlPlus.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)\NpPerlPlus.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\Release/
CPP_SBRS=.

.c{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o NUL /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\NpPerlPlus.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\NpPerlPlus.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /subsystem:windows /dll /incremental:no\
 /pdb:"$(OUTDIR)\NpPerlPlus.pdb" /machine:I386 /def:".\NpPerlPlus.def"\
 /out:"$(OUTDIR)\NpPerlPlus.dll" /implib:"$(OUTDIR)\NpPerlPlus.lib" 
DEF_FILE= \
	".\NpPerlPlus.def"
LINK32_OBJS= \
	"$(INTDIR)\NpPerlPlus.obj" \
	"$(INTDIR)\NpPerlPlus.res" \
	"$(INTDIR)\npwin.obj"

"$(OUTDIR)\NpPerlPlus.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "NpPerlPlus - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

!IF "$(RECURSE)" == "0" 

ALL : "$(OUTDIR)\NpPerlPlus.dll" "$(OUTDIR)\NpPerlPlus.bsc"

!ELSE 

ALL : "$(OUTDIR)\NpPerlPlus.dll" "$(OUTDIR)\NpPerlPlus.bsc"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\NpPerlPlus.obj"
	-@erase "$(INTDIR)\NpPerlPlus.res"
	-@erase "$(INTDIR)\NpPerlPlus.sbr"
	-@erase "$(INTDIR)\npwin.obj"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\vc50.pdb"
	-@erase "$(OUTDIR)\NpPerlPlus.bsc"
	-@erase "$(OUTDIR)\NpPerlPlus.dll"
	-@erase "$(OUTDIR)\NpPerlPlus.exp"
	-@erase "$(OUTDIR)\NpPerlPlus.ilk"
	-@erase "$(OUTDIR)\NpPerlPlus.lib"
	-@erase "$(OUTDIR)\NpPerlPlus.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MT /W3 /Gm /GX /Zi /D "WIN32" /D "_WINDOWS"\
 /Fp"$(INTDIR)\NpPerlPlus.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\Debug/
CPP_SBRS=.

.c{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

MTL=midl.exe
MTL_PROJ=/nologo /mktyplib203 /o NUL /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\NpPerlPlus.res" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\NpPerlPlus.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\NpPerlPlus.sbr"

"$(OUTDIR)\NpPerlPlus.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /subsystem:windows /dll /incremental:yes\
 /pdb:"$(OUTDIR)\NpPerlPlus.pdb" /debug /machine:I386 /nodefaultlib:"libcmt"\
 /def:".\NpPerlPlus.def" /out:"$(OUTDIR)\NpPerlPlus.dll"\
 /implib:"$(OUTDIR)\NpPerlPlus.lib" /pdbtype:sept 
DEF_FILE= \
	".\NpPerlPlus.def"
LINK32_OBJS= \
	"$(INTDIR)\NpPerlPlus.obj" \
	"$(INTDIR)\NpPerlPlus.res" \
	"$(INTDIR)\npwin.obj"

"$(OUTDIR)\NpPerlPlus.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(CFG)" == "NpPerlPlus - Win32 Release" || "$(CFG)" ==\
 "NpPerlPlus - Win32 Debug"
SOURCE=.\NpPerlPlus.cpp

!IF  "$(CFG)" == "NpPerlPlus - Win32 Release"

DEP_CPP_NPPER=\
	".\jni.h"\
	".\jni_md.h"\
	".\jri.h"\
	".\jri_md.h"\
	".\jritypes.h"\
	".\np_perl.h"\
	".\npapi.h"\
	{$(INCLUDE)}"sys\stat.h"\
	{$(INCLUDE)}"sys\types.h"\
	
CPP_SWITCHES=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)\NpPerlPlus.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\NpPerlPlus.obj" : $(SOURCE) $(DEP_CPP_NPPER) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "NpPerlPlus - Win32 Debug"

DEP_CPP_NPPER=\
	".\jni.h"\
	".\jni_md.h"\
	".\jri.h"\
	".\jri_md.h"\
	".\jritypes.h"\
	".\np_perl.h"\
	".\npapi.h"\
	
CPP_SWITCHES=/nologo /Zp8 /MDd /W3 /Gm /GR /GX /Zi /Od /Ob2 /D "WIN32" /D\
 "_WINDOWS" /FAs /Fa"$(INTDIR)\\" /FR"$(INTDIR)\\" /Fp"$(INTDIR)\NpPerlPlus.pch"\
 /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\NpPerlPlus.obj"	"$(INTDIR)\NpPerlPlus.sbr" : $(SOURCE)\
 $(DEP_CPP_NPPER) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\NpPerlPlus.rc

"$(INTDIR)\NpPerlPlus.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


SOURCE=.\npwin.cpp

!IF  "$(CFG)" == "NpPerlPlus - Win32 Release"

DEP_CPP_NPWIN=\
	".\jni.h"\
	".\jni_md.h"\
	".\jri.h"\
	".\jri_md.h"\
	".\jritypes.h"\
	".\npapi.h"\
	".\npupp.h"\
	

"$(INTDIR)\npwin.obj" : $(SOURCE) $(DEP_CPP_NPWIN) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "NpPerlPlus - Win32 Debug"

DEP_CPP_NPWIN=\
	".\jni.h"\
	".\jni_md.h"\
	".\jri.h"\
	".\jri_md.h"\
	".\jritypes.h"\
	".\npapi.h"\
	".\npupp.h"\
	

"$(INTDIR)\npwin.obj" : $(SOURCE) $(DEP_CPP_NPWIN) "$(INTDIR)"


!ENDIF 


!ENDIF 

