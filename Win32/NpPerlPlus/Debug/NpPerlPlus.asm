	TITLE	.\NpPerlPlus.cpp
	.386P
include listing.inc
if @Version gt 510
.model FLAT
else
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
CONST	SEGMENT DWORD USE32 PUBLIC 'CONST'
CONST	ENDS
_BSS	SEGMENT DWORD USE32 PUBLIC 'BSS'
_BSS	ENDS
$$SYMBOLS	SEGMENT BYTE USE32 'DEBSYM'
$$SYMBOLS	ENDS
$$TYPES	SEGMENT BYTE USE32 'DEBTYP'
$$TYPES	ENDS
_TLS	SEGMENT DWORD USE32 PUBLIC 'TLS'
_TLS	ENDS
;	COMDAT _==
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
PUBLIC	?gInstanceLookupString@@3PBDB			; gInstanceLookupString
PUBLIC	?STREAMBUFSIZE@@3JA				; STREAMBUFSIZE
_DATA	SEGMENT
?gInstanceLookupString@@3PBDB DD FLAT:$SG48541		; gInstanceLookupString
?STREAMBUFSIZE@@3JA DD 0fffffffH			; STREAMBUFSIZE
$SG48541 DB	'instance->pdata', 00H
$SG48578 DB	'PluginInstance', 00H
	ORG $+1
$SG48590 DB	'$ENV{PATH}="C:\ActiveState\Perl\bin";', 00H
	ORG $+2
$SG48597 DB	'ERROR: Not enough memory for oplist', 0aH, 00H
	ORG $+3
$SG48604 DB	'Opcode::opmask_add(Opcode::invert_opset(Opcode::opset(qw'
	DB	'(:Opl_a :Opl_b :Opl_c :Opl_d :Opl_e :Opl_f :Opl_g :Opl_h :Opl'
	DB	'_i :Opl_j :Opl_k :Opl_l :Opl_m :Opl_n :Opl_o :Opl_p))));', 00H
	ORG $+2
$SG48605 DB	'Opcode::define_optag(":Opl_a",Opcode::opset(qw(:base_cor'
	DB	'e)));Opcode::define_optag(":Opl_b",Opcode::opset(qw(:base_mem'
	DB	')));Opcode::define_optag(":Opl_c",Opcode::opset(qw(:base_loop'
	DB	')));Opcode::define_optag(":Opl_d",Opcode::opset(qw(:base_io))'
	DB	');Opcode::define_optag(":Opl_e",Opcode::opset(qw(:base_orig))'
	DB	');Opcode::define_optag(":Opl_f",Opcode::opset(qw()));Opcode::'
	DB	'define_optag(":Opl_g",Opcode::opset(qw(:base_thread)));Opcode'
	DB	'::define_optag(":Opl_h",Opcode::opset(qw()));Opcode::define_o'
	DB	'ptag(":Opl_i",Opcode::opset(qw()));Opcode::define_optag(":Opl'
	DB	'_j",Opcode::opset(qw()));Opcode::define_optag(":Opl_k",Opcode'
	DB	'::opset(qw()));Opcode::define_optag(":Opl_l",Opcode::opset(qw'
	DB	'()));Opcode::define_optag(":Opl_m",Opcode::opset(qw()));Opcod'
	DB	'e::define_optag(":Opl_n",Opcode::opset(qw()));Opcode::define_'
	DB	'optag(":Opl_o",Opcode::opset(qw()));Opcode::define_optag(":Op'
	DB	'l_p",Opcode::opset(qw()));', 00H
$SG48606 DB	'use Opcode; %s %s', 0aH, 00H
	ORG $+1
$SG48608 DB	'Opcode::opmask_add(Opcode::invert_opset(Opcode::opset(qw'
	DB	'(:Opl_a :Opl_b :Opl_c :Opl_d :Opl_e :Opl_f :Opl_g :Opl_h :Opl'
	DB	'_i :Opl_j :Opl_k :Opl_l :Opl_m :Opl_n :Opl_o :Opl_p))));', 00H
	ORG $+2
$SG48609 DB	'Opcode::define_optag(":Opl_a",Opcode::opset(qw(stub scal'
	DB	'ar pushmark wantarray const defined undef rv2sv sassign rv2av'
	DB	' aassign aelem rv2hv helem each values keys exists delete pre'
	DB	'inc postinc int abs multiply divide modulo add subtract left_'
	DB	'shift right_shift bit_and bit_xor bit_or negate not lt gt le '
	DB	'ge eq ne seq sne substr stringify length index ucfirst lcfirs'
	DB	't lc quotemeta chop split lslice splice push pop shift unshif'
	DB	't warn die unstack enter leave rv2cv anoncode entersub leaves'
	DB	'ub return method leaveeval null)));Opcode::define_optag(":Opl'
	DB	'_b",Opcode::opset(qw(concat join anonlist anonhash)));Opcode:'
	DB	':define_optag(":Opl_c",Opcode::opset(qw(grepstart mapstart en'
	DB	'teriter iter leaveloop last next goto)));Opcode::define_optag'
	DB	'(":Opl_d",Opcode::opset(qw(print)));Opcode::define_optag(":Op'
	DB	'l_e",Opcode::opset(qw(gv gelem padany rv2gv refgen ref bless '
	DB	'regcreset sprintf)));Opcode::define_optag(":Opl_f",Opcode::op'
	DB	'set(qw(sin cos)));Opcode::define_optag(":Opl_g",Opcode::opset'
	DB	'(qw()));Opcode::define_optag(":Opl_h",Opcode::opset(qw(ftdir '
	DB	'ftfile)));Opcode::define_optag(":Opl_i",Opcode::opset(qw()));'
	DB	'Opcode::define_optag(":Opl_j",Opcode::opset(qw()));Opcode::de'
	DB	'fine_optag(":Opl_k",Opcode::opset(qw()));Opcode::define_optag'
	DB	'(":Opl_l",Opcode::opset(qw()));Opcode::define_optag(":Opl_m",'
	DB	'Opcode::opset(qw()));Opcode::define_optag(":Opl_n",Opcode::op'
	DB	'set(qw()));Opcode::define_optag(":Opl_o",Opcode::opset(qw(sle'
	DB	'ep sort tied entereval require caller)));Opcode::define_optag'
	DB	'(":Opl_p",Opcode::opset(qw()));', 00H
	ORG $+1
$SG48610 DB	'use Opcode; %s %s', 0aH, 00H
	ORG $+1
$SG48612 DB	'Opcode::opmask_add(Opcode::invert_opset(Opcode::opset(qw'
	DB	'(:Opl_a :Opl_b :Opl_c :Opl_d :Opl_e :Opl_f :Opl_g :Opl_h :Opl'
	DB	'_i :Opl_j :Opl_k :Opl_l :Opl_m :Opl_n :Opl_o :Opl_p))));', 00H
	ORG $+2
$SG48613 DB	'Opcode::define_optag(":Opl_a",Opcode::opset(qw(stub scal'
	DB	'ar pushmark wantarray const defined undef rv2sv sassign rv2av'
	DB	' aassign aelem rv2hv helem each values keys exists delete pre'
	DB	'inc postinc int abs multiply divide modulo add subtract left_'
	DB	'shift right_shift bit_and bit_xor bit_or negate not lt gt le '
	DB	'ge eq ne seq sne substr stringify length index ucfirst lcfirs'
	DB	't lc quotemeta chop split lslice splice push pop shift unshif'
	DB	't warn die unstack enter leave rv2cv anoncode entersub leaves'
	DB	'ub return method leaveeval null i_preinc predec i_predec   i_'
	DB	'postinc postdec i_postdec hex oct pow i_multiply i_divide i_m'
	DB	'odulo   i_add i_subtract i_subtract i_negate complement i_ne '
	DB	'ncmp i_ncmp   cond_expr flip flop andassign orassign and or x'
	DB	'or aelemfast aslice av2arylen   hslice vec study pos rindex o'
	DB	'rd chr uc trans schop chomp schomp match   qr list reverse sl'
	DB	't sgt sle scmp)));Opcode::define_optag(":Opl_b",Opcode::opset'
	DB	'(qw(concat join anonlist anonhash repeat range)));Opcode::def'
	DB	'ine_optag(":Opl_c",Opcode::opset(qw(grepstart mapstart enteri'
	DB	'ter iter leaveloop last next goto grepwhile mapwhile enterloo'
	DB	'p redo)));Opcode::define_optag(":Opl_d",Opcode::opset(qw(prin'
	DB	't readline rcatline getc read formline enterwrite leavewrite '
	DB	'sysread syswrite send recv eof tell seek sysseek readdir tell'
	DB	'dir seekdir rewinddir )));Opcode::define_optag(":Opl_e",Opcod'
	DB	'e::opset(qw(gv gelem padany rv2gv refgen ref bless regcreset '
	DB	'sprintf gvsv padsv padav padhv srefgen pushre regcmaybe regco'
	DB	'mp subst substcont prtf crypt tie untie)));Opcode::define_opt'
	DB	'ag(":Opl_f",Opcode::opset(qw(sin cos atan2 exp log sqrt rand '
	DB	'srand )));Opcode::define_optag(":Opl_g",Opcode::opset(qw()));'
	DB	'Opcode::define_optag(":Opl_h",Opcode::opset(qw(ftdir ftfile))'
	DB	');Opcode::define_optag(":Opl_i",Opcode::opset(qw()));Opcode::'
	DB	'define_optag(":Opl_j",Opcode::opset(qw()));Opcode::define_opt'
	DB	'ag(":Opl_k",Opcode::opset(qw()));Opcode::define_optag(":Opl_l'
	DB	'",Opcode::opset(qw()));Opcode::define_optag(":Opl_m",Opcode::'
	DB	'opset(qw()));Opcode::define_optag(":Opl_n",Opcode::opset(qw()'
	DB	'));Opcode::define_optag(":Opl_o",Opcode::opset(qw(sleep sort '
	DB	'tied entereval require caller)));Opcode::define_optag(":Opl_p'
	DB	'",Opcode::opset(qw()));', 00H
	ORG $+2
$SG48614 DB	'use Opcode; %s %s', 0aH, 00H
	ORG $+1
$SG48616 DB	'Opcode::opmask_add(Opcode::invert_opset(Opcode::opset(qw'
	DB	'(:Opl_a :Opl_b :Opl_c :Opl_d :Opl_e :Opl_f :Opl_g :Opl_h :Opl'
	DB	'_i :Opl_j :Opl_k :Opl_l :Opl_m :Opl_n :Opl_o :Opl_p))));', 00H
	ORG $+2
$SG48617 DB	'Opcode::define_optag(":Opl_a",Opcode::opset(qw(:base_cor'
	DB	'e)));Opcode::define_optag(":Opl_b",Opcode::opset(qw(:base_mem'
	DB	')));Opcode::define_optag(":Opl_c",Opcode::opset(qw(:base_loop'
	DB	')));Opcode::define_optag(":Opl_d",Opcode::opset(qw(:base_io))'
	DB	');Opcode::define_optag(":Opl_e",Opcode::opset(qw(:base_orig))'
	DB	');Opcode::define_optag(":Opl_f",Opcode::opset(qw(:base_math))'
	DB	');Opcode::define_optag(":Opl_g",Opcode::opset(qw(:base_thread'
	DB	')));Opcode::define_optag(":Opl_h",Opcode::opset(qw(:filesys_r'
	DB	'ead)));Opcode::define_optag(":Opl_i",Opcode::opset(qw(:sys_db'
	DB	')));Opcode::define_optag(":Opl_j",Opcode::opset(qw(:filesys_o'
	DB	'pen)));Opcode::define_optag(":Opl_k",Opcode::opset(qw(:filesy'
	DB	's_write)));Opcode::define_optag(":Opl_l",Opcode::opset(qw(:su'
	DB	'bprocess)));Opcode::define_optag(":Opl_m",Opcode::opset(qw(:o'
	DB	'wnprocess)));Opcode::define_optag(":Opl_n",Opcode::opset(qw(:'
	DB	'others)));Opcode::define_optag(":Opl_o",Opcode::opset(qw(:sti'
	DB	'll_to_be_decided lock threadsv)));Opcode::define_optag(":Opl_'
	DB	'p",Opcode::opset(qw(:dangerous)));', 00H
	ORG $+2
$SG48618 DB	'use Opcode; %s %s', 0aH, 00H
	ORG $+1
$SG48620 DB	'Opcode::opmask_add(Opcode::invert_opset(Opcode::opset(qw'
	DB	'(:Opl_a :Opl_b :Opl_c :Opl_d :Opl_e :Opl_f :Opl_g :Opl_h :Opl'
	DB	'_i :Opl_j :Opl_k :Opl_l :Opl_m :Opl_n :Opl_o :Opl_p))));', 00H
	ORG $+2
$SG48621 DB	'Opcode::define_optag(":Opl_a",Opcode::opset(qw(stub scal'
	DB	'ar pushmark wantarray const defined undef rv2sv sassign rv2av'
	DB	' aassign aelem rv2hv helem each values keys exists delete pre'
	DB	'inc postinc int abs multiply divide modulo add subtract left_'
	DB	'shift right_shift bit_and bit_xor bit_or negate not lt gt le '
	DB	'ge eq ne seq sne substr stringify length index ucfirst lcfirs'
	DB	't lc quotemeta chop split lslice splice push pop shift unshif'
	DB	't warn die unstack enter leave rv2cv anoncode entersub leaves'
	DB	'ub return method leaveeval null postdec i_postdec av2arylen r'
	DB	'everse flip flop)));Opcode::define_optag(":Opl_b",Opcode::ops'
	DB	'et(qw(concat join anonlist anonhash range)));Opcode::define_o'
	DB	'ptag(":Opl_c",Opcode::opset(qw(grepstart mapstart enteriter i'
	DB	'ter leaveloop last next goto)));Opcode::define_optag(":Opl_d"'
	DB	',Opcode::opset(qw(print)));Opcode::define_optag(":Opl_e",Opco'
	DB	'de::opset(qw(gv gelem padany rv2gv refgen ref bless regcreset'
	DB	' sprintf localtime gmtime)));Opcode::define_optag(":Opl_f",Op'
	DB	'code::opset(qw(sin cos)));Opcode::define_optag(":Opl_g",Opcod'
	DB	'e::opset(qw()));Opcode::define_optag(":Opl_h",Opcode::opset(q'
	DB	'w(ftdir ftfile)));Opcode::define_optag(":Opl_i",Opcode::opset'
	DB	'(qw()));Opcode::define_optag(":Opl_j",Opcode::opset(qw( open '
	DB	'close)));Opcode::define_optag(":Opl_k",Opcode::opset(qw()));O'
	DB	'pcode::define_optag(":Opl_l",Opcode::opset(qw()));Opcode::def'
	DB	'ine_optag(":Opl_m",Opcode::opset(qw( time)));Opcode::define_o'
	DB	'ptag(":Opl_n",Opcode::opset(qw()));Opcode::define_optag(":Opl'
	DB	'_o",Opcode::opset(qw(sleep sort tied entereval require caller'
	DB	' pack unpack)));Opcode::define_optag(":Opl_p",Opcode::opset(q'
	DB	'w()));', 00H
$SG48622 DB	'use Opcode; %s %s', 0aH, 00H
	ORG $+1
$SG48624 DB	'ERROR: security level = %d', 0aH, 00H
$SG48625 DB	'0.95', 00H
	ORG $+3
$SG48626 DB	'$Plugin::brinfo{x_min} = %d; $Plugin::brinfo{y_min} = %d'
	DB	'; $Plugin::brinfo{x_len} = %d; $Plugin::brinfo{y_len} = %d; $'
	DB	'Plugin::brinfo{version} = %s;', 00H
	ORG $+1
$SG48628 DB	'PerlPlus plugin preamble string length %d > %d.', 0aH, 00H
	ORG $+3
$SG48629 DB	'#!%s', 0aH, 0aH, '%s', 0aH, '%s', 0aH, '%s', 0aH, 00H
$SG48634 DB	'could not open %s for output', 0aH, 00H
	ORG $+2
$SG48636 DB	'Could not open %s for output', 0aH, 00H
	ORG $+2
$SG48649 DB	'ERROR: Not enough memory for copy buffer', 0aH, 00H
	ORG $+2
$SG48654 DB	'ERROR: copy write failed', 0aH, 00H
	ORG $+2
$SG48656 DB	'ZORK!', 0aH, 00H
	ORG $+1
$SG48657 DB	'ERROR: copy read failed', 0aH, 00H
	ORG $+3
$SG48659 DB	'ERROR: Attempt to execute unauthorized application faile'
	DB	'd.', 0aH, 00H
$SG48670 DB	'content-type: application/x-secure-cgi', 0aH, 'Content-l'
	DB	'ength:', 00H
	ORG $+1
$SG48672 DB	'POST string length %d > %d.', 0aH, 00H
	ORG $+3
$SG48673 DB	'content-type: application/x-secure-cgi', 0aH, 'Content-l'
	DB	'ength:', 00H
	ORG $+1
$SG48674 DB	'%s %d', 0aH, 0aH, 'URL=%s', 0aH, 00H
	ORG $+1
$SG48696 DB	'C:\activestate\perl\bin\perl', 00H
	ORG $+3
$SG48697 DB	'http://dura.dr.lucent.com:8080/perl/perlplus-secure.cgi', 00H
$SG48698 DB	'c:\temp\NPperlplusplugin-%d-%d', 00H
	ORG $+1
$SG48699 DB	'c:\temp\NPperlplustmp-%d-%d', 00H
$SG48700 DB	'%d', 0aH, 00H
$SG48709 DB	'PluginInstance', 00H
	ORG $+1
$SG48722 DB	'PluginInstance', 00H
	ORG $+1
$SG48728 DB	'PluginInstance', 00H
	ORG $+1
$SG48735 DB	'PluginInstance', 00H
	ORG $+1
$SG48747 DB	'PluginInstance', 00H
_DATA	ENDS
PUBLIC	?PluginWindowProc@@YGJPAXGGJ@Z			; PluginWindowProc
EXTRN	__imp__DefWindowProcA@16:NEAR
EXTRN	__imp__ShowWindow@8:NEAR
EXTRN	__imp__UpdateWindow@4:NEAR
EXTRN	__imp__BeginPaint@8:NEAR
EXTRN	__imp__EndPaint@8:NEAR
EXTRN	__imp__InvalidateRect@12:NEAR
EXTRN	__imp__GetPropA@8:NEAR
_TEXT	SEGMENT
_hWnd$ = 8
_Message$ = 12
_wParam$ = 16
_lParam$ = 20
_paint$ = -72
_hDC$ = -4
_This$ = -8
?PluginWindowProc@@YGJPAXGGJ@Z PROC NEAR		; PluginWindowProc

; 61   : {

	push	ebp
	mov	ebp, esp
	sub	esp, 76					; 0000004cH

; 62   : 	PAINTSTRUCT paint;
; 63   : 	HDC hDC;
; 64   : 	PluginInstance *This = (PluginInstance *)::GetProp (hWnd, PROPERTY);

	push	OFFSET FLAT:$SG48578
	mov	eax, DWORD PTR _hWnd$[ebp]
	push	eax
	call	DWORD PTR __imp__GetPropA@8
	mov	DWORD PTR _This$[ebp], eax

; 65   : 
; 66   : 	switch(Message){

	mov	ecx, DWORD PTR _Message$[ebp]
	and	ecx, 65535				; 0000ffffH
	mov	DWORD PTR -76+[ebp], ecx
	cmp	DWORD PTR -76+[ebp], 15			; 0000000fH
	je	SHORT $L48583
	jmp	SHORT $L48584
$L48583:

; 67   : 	case WM_PAINT:
; 68   : 		hDC = BeginPaint(This->fhWnd, &paint);

	lea	edx, DWORD PTR _paint$[ebp]
	push	edx
	mov	eax, DWORD PTR _This$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	call	DWORD PTR __imp__BeginPaint@8
	mov	DWORD PTR _hDC$[ebp], eax

; 69   : 		InvalidateRect( This->fhWnd, NULL, TRUE );

	push	1
	push	0
	mov	edx, DWORD PTR _This$[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	call	DWORD PTR __imp__InvalidateRect@12

; 70   : 		ShowWindow( This->fhWnd, SW_SHOWMAXIMIZED);

	push	3
	mov	ecx, DWORD PTR _This$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	call	DWORD PTR __imp__ShowWindow@8

; 71   : 		UpdateWindow( This->fhWnd );

	mov	eax, DWORD PTR _This$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	call	DWORD PTR __imp__UpdateWindow@4

; 72   : 		EndPaint (This->fhWnd, &paint);

	lea	edx, DWORD PTR _paint$[ebp]
	push	edx
	mov	eax, DWORD PTR _This$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	call	DWORD PTR __imp__EndPaint@8

; 73   : 		break;

	jmp	SHORT $L48580
$L48584:

; 74   : 	default:
; 75   : 			return DefWindowProc(hWnd, Message, wParam, lParam);

	mov	edx, DWORD PTR _lParam$[ebp]
	push	edx
	mov	eax, DWORD PTR _wParam$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	mov	ecx, DWORD PTR _Message$[ebp]
	and	ecx, 65535				; 0000ffffH
	push	ecx
	mov	edx, DWORD PTR _hWnd$[ebp]
	push	edx
	call	DWORD PTR __imp__DefWindowProcA@16
	jmp	SHORT $L48573
$L48580:

; 78   : 
; 79   :     
; 80   : 	return DefWindowProc(hWnd, Message, wParam, lParam);

	mov	eax, DWORD PTR _lParam$[ebp]
	push	eax
	mov	ecx, DWORD PTR _wParam$[ebp]
	and	ecx, 65535				; 0000ffffH
	push	ecx
	mov	edx, DWORD PTR _Message$[ebp]
	and	edx, 65535				; 0000ffffH
	push	edx
	mov	eax, DWORD PTR _hWnd$[ebp]
	push	eax
	call	DWORD PTR __imp__DefWindowProcA@16
$L48573:

; 81   : }

	mov	esp, ebp
	pop	ebp
	ret	16					; 00000010H
?PluginWindowProc@@YGJPAXGGJ@Z ENDP			; PluginWindowProc
_TEXT	ENDS
PUBLIC	?NPPerl_WriteTemp@@YAFPAU_PluginInstance@@@Z	; NPPerl_WriteTemp
EXTRN	_NPN_MemAlloc:NEAR
EXTRN	_NPN_MemFree:NEAR
EXTRN	__imp__write:NEAR
EXTRN	__imp____p__iob:NEAR
EXTRN	__imp__fprintf:NEAR
EXTRN	__imp__sprintf:NEAR
EXTRN	_strlen:NEAR
_TEXT	SEGMENT
_This$ = 8
_winparms$ = -260
_cmdpre$ = -268
_cmdpst$ = -4
_cmd$ = -3092
_l$ = -264
?NPPerl_WriteTemp@@YAFPAU_PluginInstance@@@Z PROC NEAR	; NPPerl_WriteTemp

; 90   : {

	push	ebp
	mov	ebp, esp
	sub	esp, 3096				; 00000c18H
	push	esi

; 91   : 	char winparms[PPL_WINPARM_SZ];
; 92   : 	char *cmdpre = "$ENV{PATH}=\"C:\\ActiveState\\Perl\\bin\";";

	mov	DWORD PTR _cmdpre$[ebp], OFFSET FLAT:$SG48590

; 93   : 	char *cmdpst;
; 94   : 	char cmd[PPL_MAX_CMD];
; 95   : 	int l;
; 96   : 
; 97   : 	if ((cmdpst = (char *)NPN_MemAlloc((uint32)PPL_OPLIST_SZ)) == NULL)

	push	2048					; 00000800H
	call	_NPN_MemAlloc
	add	esp, 4
	mov	DWORD PTR _cmdpst$[ebp], eax
	cmp	DWORD PTR _cmdpst$[ebp], 0
	jne	SHORT $L48596

; 99   : 		fprintf(stderr, "ERROR: Not enough memory for oplist\n");

	push	OFFSET FLAT:$SG48597
	call	DWORD PTR __imp____p__iob
	add	eax, 64					; 00000040H
	push	eax
	call	DWORD PTR __imp__fprintf
	add	esp, 8

; 100  : 		return(-1);

	or	ax, -1
	jmp	$L48587
$L48596:

; 102  : 
; 103  : 	switch (This->secure_parms[0])

	mov	eax, DWORD PTR _This$[ebp]
	movsx	ecx, BYTE PTR [eax+168]
	mov	DWORD PTR -3096+[ebp], ecx
	mov	edx, DWORD PTR -3096+[ebp]
	sub	edx, 48					; 00000030H
	mov	DWORD PTR -3096+[ebp], edx
	cmp	DWORD PTR -3096+[ebp], 5
	ja	$L48623
	mov	eax, DWORD PTR -3096+[ebp]
	jmp	DWORD PTR $L48860[eax*4]
$L48602:

; 105  : 	case '0': /* Execution not authorized */
; 106  : 		return(-1);

	or	ax, -1
	jmp	$L48587
$L48603:

; 107  : 		break;
; 108  : 	case '1': /* Opcodes 'default:', relatively secure */
; 109  : 		sprintf(cmdpst, "use Opcode; %s %s\n", SECURE_OPSETS_L1, OPM_ADD(OPSLIST));

	push	OFFSET FLAT:$SG48604
	push	OFFSET FLAT:$SG48605
	push	OFFSET FLAT:$SG48606
	mov	ecx, DWORD PTR _cmdpst$[ebp]
	push	ecx
	call	DWORD PTR __imp__sprintf
	add	esp, 16					; 00000010H

; 110  : 		break;

	jmp	$L48599
$L48607:

; 111  : 	case '2': /* Perl/Tk */
; 112  : 		sprintf(cmdpst, "use Opcode; %s %s\n", SECURE_OPSETS_L2, OPM_ADD(OPSLIST));

	push	OFFSET FLAT:$SG48608
	push	OFFSET FLAT:$SG48609
	push	OFFSET FLAT:$SG48610
	mov	edx, DWORD PTR _cmdpst$[ebp]
	push	edx
	call	DWORD PTR __imp__sprintf
	add	esp, 16					; 00000010H

; 113  : 		break;

	jmp	$L48599
$L48611:

; 114  : 	case '3': /* Perl/Tk with math, strings, files */
; 115  : 		sprintf(cmdpst, "use Opcode; %s %s\n", SECURE_OPSETS_L3, OPM_ADD(OPSLIST));

	push	OFFSET FLAT:$SG48612
	push	OFFSET FLAT:$SG48613
	push	OFFSET FLAT:$SG48614
	mov	eax, DWORD PTR _cmdpst$[ebp]
	push	eax
	call	DWORD PTR __imp__sprintf
	add	esp, 16					; 00000010H

; 116  : 		break;

	jmp	SHORT $L48599
$L48615:

; 117  : 	case '4': /* All opcodes permitted, no security via opcodes */
; 118  : 		sprintf(cmdpst, "use Opcode; %s %s\n", SECURE_OPSETS_L4, OPM_ADD(OPSLIST));

	push	OFFSET FLAT:$SG48616
	push	OFFSET FLAT:$SG48617
	push	OFFSET FLAT:$SG48618
	mov	ecx, DWORD PTR _cmdpst$[ebp]
	push	ecx
	call	DWORD PTR __imp__sprintf
	add	esp, 16					; 00000010H

; 119  : #ifdef NPP_DEBUG
; 120  : 		fprintf(This->log_fd, "%s\n", cmdpst);
; 121  : #endif
; 122  : 		break;

	jmp	SHORT $L48599
$L48619:

; 123  : 	case '5': /* use defined security level */
; 124  : 		sprintf(cmdpst, "use Opcode; %s %s\n", SECURE_OPSETS_USER, OPM_ADD(OPSLIST));

	push	OFFSET FLAT:$SG48620
	push	OFFSET FLAT:$SG48621
	push	OFFSET FLAT:$SG48622
	mov	edx, DWORD PTR _cmdpst$[ebp]
	push	edx
	call	DWORD PTR __imp__sprintf
	add	esp, 16					; 00000010H

; 125  : 		break;

	jmp	SHORT $L48599
$L48623:

; 126  : 	default: /* yes, it has happened, and will happen again! */
; 127  : 		fprintf(stderr, "ERROR: security level = %d\n", This->secure_parms[0]);

	mov	eax, DWORD PTR _This$[ebp]
	movsx	ecx, BYTE PTR [eax+168]
	push	ecx
	push	OFFSET FLAT:$SG48624
	call	DWORD PTR __imp____p__iob
	add	eax, 64					; 00000040H
	push	eax
	call	DWORD PTR __imp__fprintf
	add	esp, 12					; 0000000cH

; 128  : 		return(-1);

	or	ax, -1
	jmp	$L48587
$L48599:

; 130  : 
; 131  : 	/* Build a perl string for the %Plugin::brinfo hash to hold the window parameter for TK. */
; 132  : 
; 133  : 	/* use this for windowed plugin */
; 134  : //	sprintf(winparms, "$Plugin::brinfo{xwindow_id} = 0x%x; $Plugin::brinfo{x_min} = %d; $Plugin::brinfo{y_min} = %d; $Plugin::brinfo{x_len} = %d; $Plugin::brinfo{y_len} = %d; $Plugin::brinfo{version} = %s;",
; 135  : //		This->fhWnd, This->x, This->y, This->width, This->height, VERSION);
; 136  : 
; 137  : 	/* use this for plugin without capability to draw in Netscape*/
; 138  : 	sprintf(winparms, "$Plugin::brinfo{x_min} = %d; $Plugin::brinfo{y_min} = %d; $Plugin::brinfo{x_len} = %d; $Plugin::brinfo{y_len} = %d; $Plugin::brinfo{version} = %s;",
; 139  : 		This->x, This->y, This->width, This->height, VERSION);

	push	OFFSET FLAT:$SG48625
	mov	edx, DWORD PTR _This$[ebp]
	mov	eax, DWORD PTR [edx+28]
	push	eax
	mov	ecx, DWORD PTR _This$[ebp]
	mov	edx, DWORD PTR [ecx+24]
	push	edx
	mov	eax, DWORD PTR _This$[ebp]
	mov	ecx, DWORD PTR [eax+20]
	push	ecx
	mov	edx, DWORD PTR _This$[ebp]
	mov	eax, DWORD PTR [edx+16]
	push	eax
	push	OFFSET FLAT:$SG48626
	lea	ecx, DWORD PTR _winparms$[ebp]
	push	ecx
	call	DWORD PTR __imp__sprintf
	add	esp, 28					; 0000001cH

; 140  : 
; 141  : 	/* Try this for windowless plugin with Netscape as parent */
; 142  : //	sprintf(winparms, "$Plugin::brinfo{xwindow_id} = 0x%x; $Plugin::brinfo{x_min} = %d; $Plugin::brinfo{y_min} = %d; $Plugin::brinfo{x_len} = %d; $Plugin::brinfo{y_len} = %d; $Plugin::brinfo{version} = %s;",
; 143  : //		This->phWnd, This->x, This->y, This->width, This->height, VERSION);
; 144  : 
; 145  : 	l = strlen(This->perl_exe) + strlen(cmdpre) + strlen(winparms) + strlen(cmdpst) + 7 + 1;

	mov	edx, DWORD PTR _This$[ebp]
	add	edx, 180				; 000000b4H
	push	edx
	call	_strlen
	add	esp, 4
	mov	esi, eax
	mov	eax, DWORD PTR _cmdpre$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	add	esi, eax
	lea	ecx, DWORD PTR _winparms$[ebp]
	push	ecx
	call	_strlen
	add	esp, 4
	add	esi, eax
	mov	edx, DWORD PTR _cmdpst$[ebp]
	push	edx
	call	_strlen
	add	esp, 4
	lea	eax, DWORD PTR [esi+eax+8]
	mov	DWORD PTR _l$[ebp], eax

; 146  : 	if (l > PPL_MAX_CMD)

	cmp	DWORD PTR _l$[ebp], 2824		; 00000b08H
	jle	SHORT $L48627

; 148  : 		fprintf(stderr, "PerlPlus plugin preamble string length %d > %d.\n", l, PPL_MAX_CMD);

	push	2824					; 00000b08H
	mov	ecx, DWORD PTR _l$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG48628
	call	DWORD PTR __imp____p__iob
	add	eax, 64					; 00000040H
	push	eax
	call	DWORD PTR __imp__fprintf
	add	esp, 16					; 00000010H

; 149  : 		return(NPERR_GENERIC_ERROR);

	mov	ax, 1
	jmp	SHORT $L48587
$L48627:

; 151  : 
; 152  : 	sprintf(cmd, "#!%s\n\n%s\n%s\n%s\n", This->perl_exe, cmdpre, winparms, cmdpst);

	mov	edx, DWORD PTR _cmdpst$[ebp]
	push	edx
	lea	eax, DWORD PTR _winparms$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cmdpre$[ebp]
	push	ecx
	mov	edx, DWORD PTR _This$[ebp]
	add	edx, 180				; 000000b4H
	push	edx
	push	OFFSET FLAT:$SG48629
	lea	eax, DWORD PTR _cmd$[ebp]
	push	eax
	call	DWORD PTR __imp__sprintf
	add	esp, 24					; 00000018H

; 153  : 	write(This->prog_fd, cmd, strlen(cmd));

	lea	ecx, DWORD PTR _cmd$[ebp]
	push	ecx
	call	_strlen
	add	esp, 4
	push	eax
	lea	edx, DWORD PTR _cmd$[ebp]
	push	edx
	mov	eax, DWORD PTR _This$[ebp]
	mov	ecx, DWORD PTR [eax+36]
	push	ecx
	call	DWORD PTR __imp__write
	add	esp, 12					; 0000000cH

; 154  : 
; 155  : #ifdef NPP_DEBUG
; 156  : 	fprintf(This->log_fd, "This->fhWnd %x\n", This->fhWnd);
; 157  : 	fprintf(This->log_fd, "perl_exe length %d\n", strlen(This->perl_exe));
; 158  : 	fprintf(This->log_fd, "cmdpre   length %d\n", strlen(cmdpre));
; 159  : 	fprintf(This->log_fd, "winparms length %d\n", strlen(winparms));
; 160  : 	fprintf(This->log_fd, "cmdpst   length %d\n", strlen(cmdpst));
; 161  : 	fprintf(This->log_fd, "cmd  length %d\n", strlen(cmd));
; 162  : 	fprintf(This->log_fd, "This->secure_parms[0] = 0x%x\n", This->secure_parms[0]);
; 163  : #endif
; 164  : 
; 165  : 	NPN_MemFree(cmdpst);

	mov	edx, DWORD PTR _cmdpst$[ebp]
	push	edx
	call	_NPN_MemFree
	add	esp, 4

; 166  : 	return(1);

	mov	ax, 1
$L48587:

; 167  : }

	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
$L48860:
	DD	$L48602
	DD	$L48603
	DD	$L48607
	DD	$L48611
	DD	$L48615
	DD	$L48619
?NPPerl_WriteTemp@@YAFPAU_PluginInstance@@@Z ENDP	; NPPerl_WriteTemp
_TEXT	ENDS
PUBLIC	?NPPerl_TmpOpen@@YAFPAU_PluginInstance@@@Z	; NPPerl_TmpOpen
EXTRN	__imp__open:NEAR
_TEXT	SEGMENT
_This$ = 8
?NPPerl_TmpOpen@@YAFPAU_PluginInstance@@@Z PROC NEAR	; NPPerl_TmpOpen

; 171  : {

	push	ebp
	mov	ebp, esp

; 172  : 	if((This->prog_fd = open(This->filename, _O_WRONLY|_O_CREAT, 0700)) == -1)

	push	448					; 000001c0H
	push	257					; 00000101H
	mov	eax, DWORD PTR _This$[ebp]
	add	eax, 104				; 00000068H
	push	eax
	call	DWORD PTR __imp__open
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _This$[ebp]
	mov	DWORD PTR [ecx+36], eax
	mov	edx, DWORD PTR _This$[ebp]
	cmp	DWORD PTR [edx+36], -1
	jne	SHORT $L48633

; 174  : 		/* This code needs to be replaced, probably by CFILE methoods */
; 175  : 		fprintf(stderr, "could not open %s for output\n", This->filename);

	mov	eax, DWORD PTR _This$[ebp]
	add	eax, 104				; 00000068H
	push	eax
	push	OFFSET FLAT:$SG48634
	call	DWORD PTR __imp____p__iob
	add	eax, 64					; 00000040H
	push	eax
	call	DWORD PTR __imp__fprintf
	add	esp, 12					; 0000000cH

; 176  : 		return NPERR_GENERIC_ERROR;

	mov	ax, 1
	jmp	SHORT $L48632
$L48633:

; 178  : 	if ((This->temp_fd = open(This->tmpname, _O_RDWR|_O_CREAT, 0700)) == -1)

	push	448					; 000001c0H
	push	258					; 00000102H
	mov	ecx, DWORD PTR _This$[ebp]
	add	ecx, 40					; 00000028H
	push	ecx
	call	DWORD PTR __imp__open
	add	esp, 12					; 0000000cH
	mov	edx, DWORD PTR _This$[ebp]
	mov	DWORD PTR [edx+32], eax
	mov	eax, DWORD PTR _This$[ebp]
	cmp	DWORD PTR [eax+32], -1
	jne	SHORT $L48635

; 180  : 		fprintf (stderr, "Could not open %s for output\n", This->tmpname);

	mov	ecx, DWORD PTR _This$[ebp]
	add	ecx, 40					; 00000028H
	push	ecx
	push	OFFSET FLAT:$SG48636
	call	DWORD PTR __imp____p__iob
	add	eax, 64					; 00000040H
	push	eax
	call	DWORD PTR __imp__fprintf
	add	esp, 12					; 0000000cH

; 181  : 		return NPERR_GENERIC_ERROR;

	mov	ax, 1
	jmp	SHORT $L48632
$L48635:

; 183  : #ifdef NPP_DEBUG
; 184  : 	if ((This->log_fd = fopen(This->logname,"a+")) == NULL)
; 185  : 	{
; 186  : 		fprintf (stderr, "Could not open %s for output\n", "c:\\temp\\plugin_log");
; 187  : 		return NPERR_GENERIC_ERROR;
; 188  : 	}
; 189  : #endif
; 190  : 	return NPERR_NO_ERROR;

	xor	ax, ax
$L48632:

; 191  : }

	pop	ebp
	ret	0
?NPPerl_TmpOpen@@YAFPAU_PluginInstance@@@Z ENDP		; NPPerl_TmpOpen
_TEXT	ENDS
PUBLIC	?NPPerl_Execl@@YAFPAU_PluginInstance@@@Z	; NPPerl_Execl
EXTRN	__imp___spawnl:NEAR
EXTRN	__imp__close:NEAR
EXTRN	__imp__lseek:NEAR
EXTRN	__imp__read:NEAR
EXTRN	__imp__unlink:NEAR
EXTRN	__imp__perror:NEAR
_TEXT	SEGMENT
_This$ = 8
_perl$ = -4
_copy_buf$ = -24
_in_bytes$ = -12
_out_bytes$ = -16
_rc$ = -8
_my_ptr$ = -20
?NPPerl_Execl@@YAFPAU_PluginInstance@@@Z PROC NEAR	; NPPerl_Execl

; 201  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H

; 202  : 	int perl;
; 203  : 	char *copy_buf;
; 204  : 	int in_bytes, out_bytes;
; 205  : 	int rc;
; 206  : 	PluginInstance * my_ptr;
; 207  : 
; 208  : 	my_ptr = This;

	mov	eax, DWORD PTR _This$[ebp]
	mov	DWORD PTR _my_ptr$[ebp], eax

; 209  : 
; 210  : 	if ((rc = NPPerl_WriteTemp(This)) == 1) 

	mov	ecx, DWORD PTR _This$[ebp]
	push	ecx
	call	?NPPerl_WriteTemp@@YAFPAU_PluginInstance@@@Z ; NPPerl_WriteTemp
	add	esp, 4
	movsx	edx, ax
	mov	DWORD PTR _rc$[ebp], edx
	cmp	DWORD PTR _rc$[ebp], 1
	jne	$L48646

; 212  : 		if ((copy_buf = (char *)NPN_MemAlloc(PPL_INBUF_SZ)) == NULL)

	push	4096					; 00001000H
	call	_NPN_MemAlloc
	add	esp, 4
	mov	DWORD PTR _copy_buf$[ebp], eax
	cmp	DWORD PTR _copy_buf$[ebp], 0
	jne	SHORT $L48648

; 214  : 			fprintf(stderr, "ERROR: Not enough memory for copy buffer\n");

	push	OFFSET FLAT:$SG48649
	call	DWORD PTR __imp____p__iob
	add	eax, 64					; 00000040H
	push	eax
	call	DWORD PTR __imp__fprintf
	add	esp, 8

; 215  : 			return(NPERR_GENERIC_ERROR);

	mov	ax, 1
	jmp	$L48639
$L48648:

; 217  : 		lseek(This->temp_fd, 0L, 0);

	push	0
	push	0
	mov	eax, DWORD PTR _This$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	push	ecx
	call	DWORD PTR __imp__lseek
	add	esp, 12					; 0000000cH
$L48651:

; 218  : 
; 219  : 		while ((in_bytes = read(This->temp_fd, copy_buf, PPL_INBUF_SZ)) > 0)

	push	4096					; 00001000H
	mov	edx, DWORD PTR _copy_buf$[ebp]
	push	edx
	mov	eax, DWORD PTR _This$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	push	ecx
	call	DWORD PTR __imp__read
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _in_bytes$[ebp], eax
	cmp	DWORD PTR _in_bytes$[ebp], 0
	jle	SHORT $L48652

; 221  : 			out_bytes = write(This->prog_fd, copy_buf, in_bytes);

	mov	edx, DWORD PTR _in_bytes$[ebp]
	push	edx
	mov	eax, DWORD PTR _copy_buf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _This$[ebp]
	mov	edx, DWORD PTR [ecx+36]
	push	edx
	call	DWORD PTR __imp__write
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _out_bytes$[ebp], eax

; 222  : 			if (out_bytes != in_bytes)

	mov	eax, DWORD PTR _out_bytes$[ebp]
	cmp	eax, DWORD PTR _in_bytes$[ebp]
	je	SHORT $L48653

; 224  : 				fprintf(stderr, "ERROR: copy write failed\n");

	push	OFFSET FLAT:$SG48654
	call	DWORD PTR __imp____p__iob
	add	eax, 64					; 00000040H
	push	eax
	call	DWORD PTR __imp__fprintf
	add	esp, 8

; 225  : 				return(NPERR_GENERIC_ERROR);

	mov	ax, 1
	jmp	$L48639
$L48653:

; 227  : 		}

	jmp	SHORT $L48651
$L48652:

; 228  : 		if (in_bytes == -1)

	cmp	DWORD PTR _in_bytes$[ebp], -1
	jne	SHORT $L48655

; 230  : 			perror("ZORK!\n");

	push	OFFSET FLAT:$SG48656
	call	DWORD PTR __imp__perror
	add	esp, 4

; 231  : 			fprintf(stderr, "ERROR: copy read failed\n");

	push	OFFSET FLAT:$SG48657
	call	DWORD PTR __imp____p__iob
	add	eax, 64					; 00000040H
	push	eax
	call	DWORD PTR __imp__fprintf
	add	esp, 8

; 232  : 			return(NPERR_GENERIC_ERROR);

	mov	ax, 1
	jmp	$L48639
$L48655:

; 234  : 		NPN_MemFree(copy_buf);

	mov	ecx, DWORD PTR _copy_buf$[ebp]
	push	ecx
	call	_NPN_MemFree
	add	esp, 4

; 235  : 
; 236  : 		close(This->prog_fd);

	mov	edx, DWORD PTR _This$[ebp]
	mov	eax, DWORD PTR [edx+36]
	push	eax
	call	DWORD PTR __imp__close
	add	esp, 4

; 237  : 		close(This->temp_fd);

	mov	ecx, DWORD PTR _This$[ebp]
	mov	edx, DWORD PTR [ecx+32]
	push	edx
	call	DWORD PTR __imp__close
	add	esp, 4

; 238  : 	} else {

	jmp	SHORT $L48658
$L48646:

; 239  : 		fprintf(stderr, "ERROR: Attempt to execute unauthorized application failed.\n");

	push	OFFSET FLAT:$SG48659
	call	DWORD PTR __imp____p__iob
	add	eax, 64					; 00000040H
	push	eax
	call	DWORD PTR __imp__fprintf
	add	esp, 8

; 240  : 		close(This->prog_fd);

	mov	eax, DWORD PTR _This$[ebp]
	mov	ecx, DWORD PTR [eax+36]
	push	ecx
	call	DWORD PTR __imp__close
	add	esp, 4

; 241  : 		close(This->temp_fd);

	mov	edx, DWORD PTR _This$[ebp]
	mov	eax, DWORD PTR [edx+32]
	push	eax
	call	DWORD PTR __imp__close
	add	esp, 4

; 242  : 		unlink(This->filename);

	mov	ecx, DWORD PTR _This$[ebp]
	add	ecx, 104				; 00000068H
	push	ecx
	call	DWORD PTR __imp__unlink
	add	esp, 4

; 243  : 		unlink(This->tmpname);

	mov	edx, DWORD PTR _This$[ebp]
	add	edx, 40					; 00000028H
	push	edx
	call	DWORD PTR __imp__unlink
	add	esp, 4

; 244  : #ifdef NPP_DEBUG
; 245  : 		unlink(This->logname);
; 246  : #endif
; 247  : 		return NPERR_GENERIC_ERROR;

	mov	ax, 1
	jmp	SHORT $L48639
$L48658:

; 249  : 
; 250  : 	if (( perl = _spawnl(_P_NOWAIT, This->perl_exe, This->perl_exe, This->filename, NULL)) == -1)

	push	0
	mov	eax, DWORD PTR _This$[ebp]
	add	eax, 104				; 00000068H
	push	eax
	mov	ecx, DWORD PTR _This$[ebp]
	add	ecx, 180				; 000000b4H
	push	ecx
	mov	edx, DWORD PTR _This$[ebp]
	add	edx, 180				; 000000b4H
	push	edx
	push	1
	call	DWORD PTR __imp___spawnl
	add	esp, 20					; 00000014H
	mov	DWORD PTR _perl$[ebp], eax
	cmp	DWORD PTR _perl$[ebp], -1
	jne	SHORT $L48660

; 252  : 		return NPERR_GENERIC_ERROR;

	mov	ax, 1
	jmp	SHORT $L48639
$L48660:

; 254  : 	return(NPERR_NO_ERROR);

	xor	ax, ax
$L48639:

; 255  : }

	mov	esp, ebp
	pop	ebp
	ret	0
?NPPerl_Execl@@YAFPAU_PluginInstance@@@Z ENDP		; NPPerl_Execl
_TEXT	ENDS
PUBLIC	?NPPerl_CheckAuth@@YAHPAU_NPP@@PAU_NPStream@@@Z	; NPPerl_CheckAuth
EXTRN	_NPN_PostURLNotify:NEAR
_TEXT	SEGMENT
_instance$ = 8
_stream$ = 12
_buffer$ = -260
_l$ = -264
_This$ = -4
?NPPerl_CheckAuth@@YAHPAU_NPP@@PAU_NPStream@@@Z PROC NEAR ; NPPerl_CheckAuth

; 261  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 264				; 00000108H
	push	esi

; 262  : 	char buffer[PPL_MAX_STRING_LENGTH];
; 263  : 	int l;
; 264  : 
; 265  : 	PluginInstance *This;
; 266  : 	if (instance != NULL)

	cmp	DWORD PTR _instance$[ebp], 0
	je	SHORT $L48668

; 267  : 		This = (PluginInstance *)instance->pdata;

	mov	eax, DWORD PTR _instance$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _This$[ebp], ecx
$L48668:

; 268  : 
; 269  : 	l = strlen(CGI_TYPE) + strlen(stream->url) + 4 + 1;

	push	OFFSET FLAT:$SG48670
	call	_strlen
	add	esp, 4
	mov	esi, eax
	mov	edx, DWORD PTR _stream$[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	call	_strlen
	add	esp, 4
	lea	ecx, DWORD PTR [esi+eax+5]
	mov	DWORD PTR _l$[ebp], ecx

; 270  : 	if (l > PPL_MAX_STRING_LENGTH)

	cmp	DWORD PTR _l$[ebp], 256			; 00000100H
	jle	SHORT $L48671

; 272  : 		fprintf(stderr, "POST string length %d > %d.\n", l , PPL_MAX_STRING_LENGTH);

	push	256					; 00000100H
	mov	edx, DWORD PTR _l$[ebp]
	push	edx
	push	OFFSET FLAT:$SG48672
	call	DWORD PTR __imp____p__iob
	add	eax, 64					; 00000040H
	push	eax
	call	DWORD PTR __imp__fprintf
	add	esp, 16					; 00000010H

; 273  : 		return(NPERR_GENERIC_ERROR);

	mov	eax, 1
	jmp	SHORT $L48664
$L48671:

; 275  : 	sprintf(buffer, "%s %d\n\nURL=%s\n", CGI_TYPE, strlen(stream->url)+4, stream->url);

	mov	eax, DWORD PTR _stream$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	mov	edx, DWORD PTR _stream$[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	call	_strlen
	add	esp, 4
	add	eax, 4
	push	eax
	push	OFFSET FLAT:$SG48673
	push	OFFSET FLAT:$SG48674
	lea	ecx, DWORD PTR _buffer$[ebp]
	push	ecx
	call	DWORD PTR __imp__sprintf
	add	esp, 20					; 00000014H

; 276  : 
; 277  : #ifdef NPP_DEBUG
; 278  : 	fprintf(This->log_fd, "POST buffer length %d\n", strlen(buffer));
; 279  : #endif
; 280  : 	/*
; 281  : 	 * Send the URL to the CGI program for authorization checking.
; 282  : 	 */
; 283  : 
; 284  : 	NPN_PostURLNotify(instance,
; 285  : 						This->secure_cgi, NULL,
; 286  : 						strlen(buffer),
; 287  : 						(const char *)buffer,
; 288  : 						FALSE, NULL);

	push	0
	push	0
	lea	edx, DWORD PTR _buffer$[ebp]
	push	edx
	lea	eax, DWORD PTR _buffer$[ebp]
	push	eax
	call	_strlen
	add	esp, 4
	push	eax
	push	0
	mov	ecx, DWORD PTR _This$[ebp]
	add	ecx, 436				; 000001b4H
	push	ecx
	mov	edx, DWORD PTR _instance$[ebp]
	push	edx
	call	_NPN_PostURLNotify
	add	esp, 28					; 0000001cH

; 289  : 
; 290  : 	return(NPERR_NO_ERROR);

	xor	eax, eax
$L48664:

; 291  : }

	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
?NPPerl_CheckAuth@@YAHPAU_NPP@@PAU_NPStream@@@Z ENDP	; NPPerl_CheckAuth
_TEXT	ENDS
PUBLIC	_NPP_Initialize
_BSS	SEGMENT
_ppl_instance$S48542 DD 01H DUP (?)
_BSS	ENDS
_TEXT	SEGMENT
_NPP_Initialize PROC NEAR

; 307  : {

	push	ebp
	mov	ebp, esp

; 308  : 	ppl_instance = 0; // added for PerlPlusPlugin

	mov	DWORD PTR _ppl_instance$S48542, 0

; 309  :     return NPERR_NO_ERROR;

	xor	ax, ax

; 310  : }

	pop	ebp
	ret	0
_NPP_Initialize ENDP
_TEXT	ENDS
PUBLIC	_NPP_GetJavaClass
_TEXT	SEGMENT
_NPP_GetJavaClass PROC NEAR

; 325  : {

	push	ebp
	mov	ebp, esp

; 326  : 	return NULL;

	xor	eax, eax

; 327  : }

	pop	ebp
	ret	0
_NPP_GetJavaClass ENDP
_TEXT	ENDS
PUBLIC	_NPP_Shutdown
_TEXT	SEGMENT
_NPP_Shutdown PROC NEAR

; 341  : {

	push	ebp
	mov	ebp, esp

; 342  : 	return;
; 343  : }

	pop	ebp
	ret	0
_NPP_Shutdown ENDP
_TEXT	ENDS
PUBLIC	_NPP_New
EXTRN	__imp___getpid:NEAR
EXTRN	__imp__strncpy:NEAR
_TEXT	SEGMENT
_instance$ = 12
_mode$ = 16
_result$ = -4
_This$ = -8
_NPP_New PROC NEAR

; 363  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 364  : 	NPError result = NPERR_NO_ERROR;

	mov	WORD PTR _result$[ebp], 0

; 365  : 	PluginInstance* This;
; 366  : 	
; 367  : 	if (instance == NULL) {

	cmp	DWORD PTR _instance$[ebp], 0
	jne	SHORT $L48692

; 368  : 		return NPERR_INVALID_INSTANCE_ERROR;

	mov	ax, 2
	jmp	$L48689
$L48692:

; 370  : 	instance->pdata = NPN_MemAlloc(sizeof(PluginInstance));

	push	692					; 000002b4H
	call	_NPN_MemAlloc
	add	esp, 4
	mov	ecx, DWORD PTR _instance$[ebp]
	mov	DWORD PTR [ecx], eax

; 371  : 	This = (PluginInstance*) instance->pdata;

	mov	edx, DWORD PTR _instance$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _This$[ebp], eax

; 372  : 	if (This == NULL) {

	cmp	DWORD PTR _This$[ebp], 0
	jne	SHORT $L48695

; 373  : 	    return NPERR_OUT_OF_MEMORY_ERROR;

	mov	ax, 5
	jmp	$L48689
$L48695:

; 375  : 	/* mode is NP_EMBED, NP_FULL, or NP_BACKGROUND (see npapi.h) */
; 376  : 	This->fWindow = NULL;

	mov	ecx, DWORD PTR _This$[ebp]
	mov	DWORD PTR [ecx], 0

; 377  : 	This->fMode = mode;

	mov	edx, DWORD PTR _This$[ebp]
	mov	ax, WORD PTR _mode$[ebp]
	mov	WORD PTR [edx+4], ax

; 378  : 	
; 379  : 	This->fhWnd = NULL;

	mov	ecx, DWORD PTR _This$[ebp]
	mov	DWORD PTR [ecx+8], 0

; 380  : 	This->fDefaultWindowProc = NULL;

	mov	edx, DWORD PTR _This$[ebp]
	mov	DWORD PTR [edx+12], 0

; 381  : 
; 382  : 		/* PLUGIN DEVELOPERS:
; 383  : 		 *	Initialize fields of your plugin
; 384  : 		 *	instance data here.  If the NPSavedData is non-
; 385  : 		 *	NULL, you can use that data (returned by you from
; 386  : 		 *	NPP_Destroy to set up the new plugin instance).
; 387  : 		 */
; 388  : 
; 389  : 	// Added for NpPerlPlus
; 390  : 
; 391  : 	strncpy(This->perl_exe, PERL_EXE_PATH, PPL_MAX_STRING_LENGTH);

	push	256					; 00000100H
	push	OFFSET FLAT:$SG48696
	mov	eax, DWORD PTR _This$[ebp]
	add	eax, 180				; 000000b4H
	push	eax
	call	DWORD PTR __imp__strncpy
	add	esp, 12					; 0000000cH

; 392  : 	This->perl_exe[PPL_MAX_STRING_LENGTH] ='\0';

	mov	ecx, DWORD PTR _This$[ebp]
	mov	BYTE PTR [ecx+436], 0

; 393  : 	strncpy(This->secure_cgi, SECURE_CGI, PPL_MAX_STRING_LENGTH);

	push	256					; 00000100H
	push	OFFSET FLAT:$SG48697
	mov	edx, DWORD PTR _This$[ebp]
	add	edx, 436				; 000001b4H
	push	edx
	call	DWORD PTR __imp__strncpy
	add	esp, 12					; 0000000cH

; 394  : 	This->secure_cgi[PPL_MAX_STRING_LENGTH] = '\0';

	mov	eax, DWORD PTR _This$[ebp]
	mov	BYTE PTR [eax+692], 0

; 395  : 
; 396  : #if ALLOW_ENV_CONFIG
; 397  : 	env = getenv("PPL_PERL_EXE");
; 398  : 	if (env) {
; 399  : 		strncpy(This->perl_exe, env, PPL_MAX_STRING_LENGTH);
; 400  : 		This->perl_exe[PPL_MAX_STRING_LENGTH] ='\0';
; 401  : 	}
; 402  : 	env = getenv("PPL_SECURE_CGI");
; 403  : 	if (env) {
; 404  : 	strncpy(This->secure_cgi, PERL_EXE_PATH, PPL_MAX_STRING_LENGTH);
; 405  : 	This->secure_cgi[PPL_MAX_STRING_LENGTH] = '\0';
; 406  : 	}
; 407  : #endif
; 408  : 	/*
; 409  : 	 * In order to allow multiple instances of the plugin, say in an embedded
; 410  : 	 * mode, the temp files have to have uniuqe names.  We use both the pid of
; 411  : 	 * the browser and an instance number. 0, 1, ...
; 412  : 	 */
; 413  : 	sprintf (This->filename, "c:\\temp\\NPperlplusplugin-%d-%d", ppl_instance, _getpid());

	call	DWORD PTR __imp___getpid
	push	eax
	mov	ecx, DWORD PTR _ppl_instance$S48542
	push	ecx
	push	OFFSET FLAT:$SG48698
	mov	edx, DWORD PTR _This$[ebp]
	add	edx, 104				; 00000068H
	push	edx
	call	DWORD PTR __imp__sprintf
	add	esp, 16					; 00000010H

; 414  : 	sprintf (This->tmpname, "c:\\temp\\NPperlplustmp-%d-%d", ppl_instance, _getpid());

	call	DWORD PTR __imp___getpid
	push	eax
	mov	eax, DWORD PTR _ppl_instance$S48542
	push	eax
	push	OFFSET FLAT:$SG48699
	mov	ecx, DWORD PTR _This$[ebp]
	add	ecx, 40					; 00000028H
	push	ecx
	call	DWORD PTR __imp__sprintf
	add	esp, 16					; 00000010H

; 415  : #ifdef NPP_DEBUG
; 416  : 	sprintf (This->logname, "c:\\temp\\NPperlpluslog-%d-%d", ppl_instance, _getpid());
; 417  : #endif
; 418  : 
; 419  : 
; 420  : 
; 421  : 	NPPerl_TmpOpen(This);

	mov	edx, DWORD PTR _This$[ebp]
	push	edx
	call	?NPPerl_TmpOpen@@YAFPAU_PluginInstance@@@Z ; NPPerl_TmpOpen
	add	esp, 4

; 422  : 	ppl_instance++; /* count this ppl instance */

	mov	eax, DWORD PTR _ppl_instance$S48542
	add	eax, 1
	mov	DWORD PTR _ppl_instance$S48542, eax

; 423  : 
; 424  : 	sprintf(This->secure_parms, "%d\n", 0);

	push	0
	push	OFFSET FLAT:$SG48700
	mov	ecx, DWORD PTR _This$[ebp]
	add	ecx, 168				; 000000a8H
	push	ecx
	call	DWORD PTR __imp__sprintf
	add	esp, 12					; 0000000cH

; 425  : 	This->from =0;

	mov	edx, DWORD PTR _This$[ebp]
	mov	DWORD PTR [edx+172], 0

; 426  : 	This->write_cgi = 0;

	mov	eax, DWORD PTR _This$[ebp]
	mov	DWORD PTR [eax+176], 0

; 427  : 	return result;

	mov	ax, WORD PTR _result$[ebp]
$L48689:

; 428  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_NPP_New ENDP
_TEXT	ENDS
PUBLIC	_NPP_Destroy
EXTRN	__imp__SetWindowLongA@12:NEAR
EXTRN	__imp__RemovePropA@8:NEAR
_TEXT	SEGMENT
_instance$ = 8
_This$ = -4
_NPP_Destroy PROC NEAR

; 446  : {

	push	ebp
	mov	ebp, esp
	push	ecx

; 447  : 	PluginInstance* This;
; 448  : 
; 449  : 	if (instance == NULL)

	cmp	DWORD PTR _instance$[ebp], 0
	jne	SHORT $L48705

; 450  : 		return NPERR_INVALID_INSTANCE_ERROR;

	mov	ax, 2
	jmp	$L48703
$L48705:

; 451  : 
; 452  : 	This = (PluginInstance*) instance->pdata;

	mov	eax, DWORD PTR _instance$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _This$[ebp], ecx

; 453  : 	if( This->fWindow != NULL ) { /* If we have a window, clean

	mov	edx, DWORD PTR _This$[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $L48707

; 454  : 								 * it up. */
; 455  : 		SetWindowLong( This->fhWnd, GWL_WNDPROC, (LONG)This->fDefaultWindowProc);

	mov	eax, DWORD PTR _This$[ebp]
	mov	ecx, DWORD PTR [eax+12]
	push	ecx
	push	-4					; fffffffcH
	mov	edx, DWORD PTR _This$[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	call	DWORD PTR __imp__SetWindowLongA@12

; 456  : 		RemoveProp(This->fhWnd, PROPERTY);

	push	OFFSET FLAT:$SG48709
	mov	ecx, DWORD PTR _This$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	call	DWORD PTR __imp__RemovePropA@8

; 457  : 		RemoveProp(This->fhWnd, gInstanceLookupString);

	mov	eax, DWORD PTR ?gInstanceLookupString@@3PBDB ; gInstanceLookupString
	push	eax
	mov	ecx, DWORD PTR _This$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	call	DWORD PTR __imp__RemovePropA@8

; 458  : 		This->fDefaultWindowProc = NULL;

	mov	eax, DWORD PTR _This$[ebp]
	mov	DWORD PTR [eax+12], 0

; 459  : 		This->fhWnd = NULL;

	mov	ecx, DWORD PTR _This$[ebp]
	mov	DWORD PTR [ecx+8], 0

; 460  : 
; 461  : 		unlink(This->filename);

	mov	edx, DWORD PTR _This$[ebp]
	add	edx, 104				; 00000068H
	push	edx
	call	DWORD PTR __imp__unlink
	add	esp, 4

; 462  : 		unlink(This->tmpname);

	mov	eax, DWORD PTR _This$[ebp]
	add	eax, 40					; 00000028H
	push	eax
	call	DWORD PTR __imp__unlink
	add	esp, 4
$L48707:

; 467  : 
; 468  : 
; 469  : 	/* PLUGIN DEVELOPERS:
; 470  : 	 *	If desired, call NP_MemAlloc to create a
; 471  : 	 *	NPSavedDate structure containing any state information
; 472  : 	 *	that you want restored if this plugin instance is later
; 473  : 	 *	recreated.
; 474  : 	 */
; 475  : 
; 476  : 	if (This != NULL) {

	cmp	DWORD PTR _This$[ebp], 0
	je	SHORT $L48710

; 477  : 		NPN_MemFree(instance->pdata);

	mov	ecx, DWORD PTR _instance$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_NPN_MemFree
	add	esp, 4

; 478  : 		instance->pdata = NULL;

	mov	eax, DWORD PTR _instance$[ebp]
	mov	DWORD PTR [eax], 0
$L48710:

; 480  : 
; 481  : 	return NPERR_NO_ERROR;

	xor	ax, ax
$L48703:

; 482  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_NPP_Destroy ENDP
_TEXT	ENDS
PUBLIC	_NPP_SetWindow
EXTRN	__imp__SetPropA@12:NEAR
_TEXT	SEGMENT
_instance$ = 8
_window$ = 12
_result$ = -4
_This$ = -8
_NPP_SetWindow PROC NEAR

; 502  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 503  : 	NPError result = NPERR_NO_ERROR;

	mov	WORD PTR _result$[ebp], 0

; 504  : 	PluginInstance* This;
; 505  : 
; 506  : 
; 507  : 
; 508  : #ifdef NPP_DEBUG
; 509  : 	LONG parent_hwnd;
; 510  : 	LONG  id;
; 511  : 	LONG style;
; 512  : 	LONG hinstance;
; 513  : 	unsigned long class_name;
; 514  : 	char class_nameA[256];
; 515  : 	WNDCLASSEX class_struct;
; 516  : 	WNDCLASSEX * class_ptr;
; 517  : #endif
; 518  : 
; 519  : 	if (instance == NULL)

	cmp	DWORD PTR _instance$[ebp], 0
	jne	SHORT $L48716

; 520  : 		return NPERR_INVALID_INSTANCE_ERROR;

	mov	ax, 2
	jmp	$L48713
$L48716:

; 521  : 
; 522  : 	This = (PluginInstance*) instance->pdata;

	mov	eax, DWORD PTR _instance$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _This$[ebp], ecx

; 523  : 
; 524  : 	/*
; 525  : 	 * PLUGIN DEVELOPERS:
; 526  : 	 *	Before setting window to point to the
; 527  : 	 *	new window, you may wish to compare the new window
; 528  : 	 *	info to the previous window (if any) to note window
; 529  : 	 *	size changes, etc.
; 530  : 	 */
; 531  : 	if( This->fWindow != NULL ) /* If we already have a window, clean

	mov	edx, DWORD PTR _This$[ebp]
	cmp	DWORD PTR [edx], 0
	je	$L48718

; 535  : 		if( (window == NULL) || ( window->window == NULL ) ) {

	cmp	DWORD PTR _window$[ebp], 0
	je	SHORT $L48720
	mov	eax, DWORD PTR _window$[ebp]
	cmp	DWORD PTR [eax], 0
	jne	SHORT $L48719
$L48720:

; 536  : 			/* There is now no window to use. get rid of the old
; 537  : 			 * one and exit. */
; 538  : 			SetWindowLong( This->fhWnd, GWL_WNDPROC, (LONG)This->fDefaultWindowProc);

	mov	ecx, DWORD PTR _This$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	push	edx
	push	-4					; fffffffcH
	mov	eax, DWORD PTR _This$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	call	DWORD PTR __imp__SetWindowLongA@12

; 539  : 			This->fDefaultWindowProc = NULL;

	mov	edx, DWORD PTR _This$[ebp]
	mov	DWORD PTR [edx+12], 0

; 540  : 			This->fhWnd = NULL;

	mov	eax, DWORD PTR _This$[ebp]
	mov	DWORD PTR [eax+8], 0

; 541  : 			This->fWindow=window;

	mov	ecx, DWORD PTR _This$[ebp]
	mov	edx, DWORD PTR _window$[ebp]
	mov	DWORD PTR [ecx], edx

; 542  : 			RemoveProp(This->fhWnd, PROPERTY);

	push	OFFSET FLAT:$SG48722
	mov	eax, DWORD PTR _This$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	call	DWORD PTR __imp__RemovePropA@8

; 543  : 			RemoveProp(This->fhWnd, gInstanceLookupString);

	mov	edx, DWORD PTR ?gInstanceLookupString@@3PBDB ; gInstanceLookupString
	push	edx
	mov	eax, DWORD PTR _This$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	call	DWORD PTR __imp__RemovePropA@8

; 544  : 			return NPERR_NO_ERROR;

	xor	ax, ax
	jmp	$L48713
$L48719:

; 546  : 
; 547  : 		else if ( This->fhWnd == (HWND) window->window ) {

	mov	edx, DWORD PTR _This$[ebp]
	mov	eax, DWORD PTR _window$[ebp]
	mov	ecx, DWORD PTR [edx+8]
	cmp	ecx, DWORD PTR [eax]
	jne	SHORT $L48725

; 548  : 			/* The new window is the same as the old one. Redraw and get out. */
; 549  : 			InvalidateRect( This->fhWnd, NULL, TRUE );

	push	1
	push	0
	mov	edx, DWORD PTR _This$[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	call	DWORD PTR __imp__InvalidateRect@12

; 550  : 			UpdateWindow( This->fhWnd );

	mov	ecx, DWORD PTR _This$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	call	DWORD PTR __imp__UpdateWindow@4

; 551  : 			This->fWindow=window;

	mov	eax, DWORD PTR _This$[ebp]
	mov	ecx, DWORD PTR _window$[ebp]
	mov	DWORD PTR [eax], ecx

; 552  : 			return NPERR_NO_ERROR;

	xor	ax, ax
	jmp	$L48713
$L48725:

; 555  : 			/* We've been given a new window, so clean up the old window, so that we can 
; 556  : 			   subclass the new one later. */
; 557  : 			SetWindowLong( This->fhWnd, GWL_WNDPROC, (LONG)This->fDefaultWindowProc);

	mov	edx, DWORD PTR _This$[ebp]
	mov	eax, DWORD PTR [edx+12]
	push	eax
	push	-4					; fffffffcH
	mov	ecx, DWORD PTR _This$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	call	DWORD PTR __imp__SetWindowLongA@12

; 558  : 			RemoveProp(This->fhWnd, PROPERTY);

	push	OFFSET FLAT:$SG48728
	mov	eax, DWORD PTR _This$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	call	DWORD PTR __imp__RemovePropA@8

; 559  : 			RemoveProp(This->fhWnd, gInstanceLookupString);

	mov	edx, DWORD PTR ?gInstanceLookupString@@3PBDB ; gInstanceLookupString
	push	edx
	mov	eax, DWORD PTR _This$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	call	DWORD PTR __imp__RemovePropA@8

; 560  : 			This->fDefaultWindowProc = NULL;

	mov	edx, DWORD PTR _This$[ebp]
	mov	DWORD PTR [edx+12], 0

; 561  : 			This->fhWnd = NULL;

	mov	eax, DWORD PTR _This$[ebp]
	mov	DWORD PTR [eax+8], 0

; 562  : 
; 563  : 			/*
; 564  : 			 * Added for NpPerlPlus
; 565  : 			 * Don't wait, subclass the new window now and restart
; 566  : 			 * the perl program with it.
; 567  : 			 */
; 568  : 			This->fDefaultWindowProc = (WNDPROC)SetWindowLong( (HWND)window->window, GWL_WNDPROC, (LONG)PluginWindowProc);

	push	OFFSET FLAT:?PluginWindowProc@@YGJPAXGGJ@Z ; PluginWindowProc
	push	-4					; fffffffcH
	mov	ecx, DWORD PTR _window$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	DWORD PTR __imp__SetWindowLongA@12
	mov	ecx, DWORD PTR _This$[ebp]
	mov	DWORD PTR [ecx+12], eax

; 569  : 			This->fhWnd = (HWND) window->window;

	mov	edx, DWORD PTR _This$[ebp]
	mov	eax, DWORD PTR _window$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR [edx+8], ecx

; 570  : 			SetProp( This->fhWnd, gInstanceLookupString, (HANDLE)This);

	mov	edx, DWORD PTR _This$[ebp]
	push	edx
	mov	eax, DWORD PTR ?gInstanceLookupString@@3PBDB ; gInstanceLookupString
	push	eax
	mov	ecx, DWORD PTR _This$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	call	DWORD PTR __imp__SetPropA@12

; 571  : 			SetProp(This->fhWnd, PROPERTY, (HANDLE)This);

	mov	eax, DWORD PTR _This$[ebp]
	push	eax
	push	OFFSET FLAT:$SG48735
	mov	ecx, DWORD PTR _This$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	call	DWORD PTR __imp__SetPropA@12

; 572  : 
; 573  : 			InvalidateRect( This->fhWnd, NULL, TRUE );

	push	1
	push	0
	mov	eax, DWORD PTR _This$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	call	DWORD PTR __imp__InvalidateRect@12

; 574  : 			UpdateWindow( This->fhWnd );

	mov	edx, DWORD PTR _This$[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	call	DWORD PTR __imp__UpdateWindow@4

; 575  : 	
; 576  : 			This->fWindow = window;			

	mov	ecx, DWORD PTR _This$[ebp]
	mov	edx, DWORD PTR _window$[ebp]
	mov	DWORD PTR [ecx], edx

; 577  : 			This->x = window->x;

	mov	eax, DWORD PTR _This$[ebp]
	mov	ecx, DWORD PTR _window$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR [eax+16], edx

; 578  : 			This->y = window->y;

	mov	eax, DWORD PTR _This$[ebp]
	mov	ecx, DWORD PTR _window$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	DWORD PTR [eax+20], edx

; 579  : 			This->width = window->width;

	mov	eax, DWORD PTR _This$[ebp]
	mov	ecx, DWORD PTR _window$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [eax+24], edx

; 580  : 			This->height = window->height;

	mov	eax, DWORD PTR _This$[ebp]
	mov	ecx, DWORD PTR _window$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	mov	DWORD PTR [eax+28], edx

; 581  : 
; 582  : 
; 583  : 			if ((result = NPPerl_TmpOpen(This)) == 0) {

	mov	eax, DWORD PTR _This$[ebp]
	push	eax
	call	?NPPerl_TmpOpen@@YAFPAU_PluginInstance@@@Z ; NPPerl_TmpOpen
	add	esp, 4
	mov	WORD PTR _result$[ebp], ax
	movsx	ecx, WORD PTR _result$[ebp]
	test	ecx, ecx
	jne	SHORT $L48736

; 584  : 				return(NPPerl_Execl(This)); /* Restart the perl program in the new window */

	mov	edx, DWORD PTR _This$[ebp]
	push	edx
	call	?NPPerl_Execl@@YAFPAU_PluginInstance@@@Z ; NPPerl_Execl
	add	esp, 4
	jmp	$L48713
$L48736:

; 586  : 				return result;

	mov	ax, WORD PTR _result$[ebp]
	jmp	$L48713
$L48718:

; 590  : 	else if( (window == NULL) || ( window->window == NULL ) ) {

	cmp	DWORD PTR _window$[ebp], 0
	je	SHORT $L48740
	mov	eax, DWORD PTR _window$[ebp]
	cmp	DWORD PTR [eax], 0
	jne	SHORT $L48739
$L48740:

; 591  : 		/* We can just get out of here if there is no current
; 592  : 		 * window and there is no new window to use. */
; 593  : 		This->fWindow=window;

	mov	ecx, DWORD PTR _This$[ebp]
	mov	edx, DWORD PTR _window$[ebp]
	mov	DWORD PTR [ecx], edx

; 594  : 		return NPERR_NO_ERROR;

	xor	ax, ax
	jmp	$L48713
$L48739:

; 596  : 
; 597  : 	/* At this point, we will subclass
; 598  : 	 * window->window so that we can begin drawing and
; 599  : 	 * receiving window messages. */
; 600  : 	This->fDefaultWindowProc = (WNDPROC)SetWindowLong( (HWND)window->window, GWL_WNDPROC, (LONG)PluginWindowProc);

	push	OFFSET FLAT:?PluginWindowProc@@YGJPAXGGJ@Z ; PluginWindowProc
	push	-4					; fffffffcH
	mov	eax, DWORD PTR _window$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	DWORD PTR __imp__SetWindowLongA@12
	mov	edx, DWORD PTR _This$[ebp]
	mov	DWORD PTR [edx+12], eax

; 601  : 	This->fhWnd = (HWND) window->window;

	mov	eax, DWORD PTR _This$[ebp]
	mov	ecx, DWORD PTR _window$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR [eax+8], edx

; 602  : 	SetProp( This->fhWnd, gInstanceLookupString, (HANDLE)This);

	mov	eax, DWORD PTR _This$[ebp]
	push	eax
	mov	ecx, DWORD PTR ?gInstanceLookupString@@3PBDB ; gInstanceLookupString
	push	ecx
	mov	edx, DWORD PTR _This$[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	call	DWORD PTR __imp__SetPropA@12

; 603  : 	SetProp(This->fhWnd, PROPERTY, (HANDLE)This);

	mov	ecx, DWORD PTR _This$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG48747
	mov	edx, DWORD PTR _This$[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	call	DWORD PTR __imp__SetPropA@12

; 604  : 
; 605  : 	InvalidateRect( This->fhWnd, NULL, TRUE );

	push	1
	push	0
	mov	ecx, DWORD PTR _This$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	call	DWORD PTR __imp__InvalidateRect@12

; 606  : 	ShowWindow( This->fhWnd, SW_SHOWMAXIMIZED);

	push	3
	mov	eax, DWORD PTR _This$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	call	DWORD PTR __imp__ShowWindow@8

; 607  : 	UpdateWindow( This->fhWnd );

	mov	edx, DWORD PTR _This$[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	call	DWORD PTR __imp__UpdateWindow@4

; 608  : 	This->fWindow = window;

	mov	ecx, DWORD PTR _This$[ebp]
	mov	edx, DWORD PTR _window$[ebp]
	mov	DWORD PTR [ecx], edx

; 609  : 	This->x = window->x;

	mov	eax, DWORD PTR _This$[ebp]
	mov	ecx, DWORD PTR _window$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR [eax+16], edx

; 610  : 	This->y = window->y;

	mov	eax, DWORD PTR _This$[ebp]
	mov	ecx, DWORD PTR _window$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	DWORD PTR [eax+20], edx

; 611  : 	This->width = window->width;

	mov	eax, DWORD PTR _This$[ebp]
	mov	ecx, DWORD PTR _window$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR [eax+24], edx

; 612  : 	This->height = window->height;

	mov	eax, DWORD PTR _This$[ebp]
	mov	ecx, DWORD PTR _window$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	mov	DWORD PTR [eax+28], edx

; 613  : 
; 614  : #ifdef NPP_DEBUG
; 615  : 	style = GetWindowLong(This->fhWnd, GWL_STYLE);
; 616  : 	id = GetWindowLong(This->fhWnd, GWL_ID);
; 617  : 	parent_hwnd = GetWindowLong(This->fhWnd, GWL_HWNDPARENT);
; 618  : 	class_name = GetClassLong(This->fhWnd, GCW_ATOM);
; 619  : 	hinstance = GetWindowLong(This->fhWnd, GWL_HINSTANCE);
; 620  : 	class_ptr = &class_struct;
; 621  : 	GlobalGetAtomName((ATOM)class_struct.lpszClassName, class_nameA, 256);
; 622  : 	GetClassInfoEx( (HINSTANCE)hinstance, (const char *)class_name, class_ptr);
; 623  : 
; 624  : 	fprintf(This->log_fd, "\nMy Hwnd = 0x%x, \nMy id = 0x%x, \nMy parent = 0x%x, \nMy Style = 0x%x, \nMy Class = 0x%x\n", This->fhWnd,  id, parent_hwnd, style, class_name);
; 625  :     fprintf(This->log_fd, "\nClass style = 0x%x, Class name = %s\n", class_struct.style, class_nameA);
; 626  : #endif
; 627  : 
; 628  : 	return result;

	mov	ax, WORD PTR _result$[ebp]
$L48713:

; 629  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_NPP_SetWindow ENDP
_TEXT	ENDS
PUBLIC	_NPP_NewStream
EXTRN	_strcmp:NEAR
_TEXT	SEGMENT
_instance$ = 8
_stream$ = 16
_This$ = -4
_NPP_NewStream PROC NEAR

; 646  : {

	push	ebp
	mov	ebp, esp
	push	ecx

; 647  : 	PluginInstance* This;
; 648  : 
; 649  : 	if (instance == NULL)

	cmp	DWORD PTR _instance$[ebp], 0
	jne	SHORT $L48755

; 650  : 		return NPERR_INVALID_INSTANCE_ERROR;

	mov	ax, 2
	jmp	SHORT $L48753
$L48755:

; 651  : 
; 652  : 	This = (PluginInstance*) instance->pdata;

	mov	eax, DWORD PTR _instance$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _This$[ebp], ecx

; 653  : 
; 654  : 	if(This->from == FROM_CGI) /* Why does cgi give me back two streams? */

	mov	edx, DWORD PTR _This$[ebp]
	cmp	DWORD PTR [edx+172], 2
	jne	SHORT $L48757

; 655  : 		return NPERR_NO_ERROR;

	xor	ax, ax
	jmp	SHORT $L48753
$L48757:

; 656  : 
; 657  : 	if((strcmp(This->secure_cgi, stream->url)) == 0) {

	mov	eax, DWORD PTR _stream$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	mov	edx, DWORD PTR _This$[ebp]
	add	edx, 436				; 000001b4H
	push	edx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L48758

; 658  : 			This->from = FROM_CGI;

	mov	eax, DWORD PTR _This$[ebp]
	mov	DWORD PTR [eax+172], 2

; 659  : 	} else {

	jmp	SHORT $L48759
$L48758:

; 660  : 		This->from = FROM_APPLICATION;

	mov	ecx, DWORD PTR _This$[ebp]
	mov	DWORD PTR [ecx+172], 1
$L48759:

; 662  : 	return NPERR_NO_ERROR;

	xor	ax, ax
$L48753:

; 663  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_NPP_NewStream ENDP
_TEXT	ENDS
PUBLIC	_NPP_WriteReady
_TEXT	SEGMENT
_instance$ = 8
_This$ = -4
_NPP_WriteReady PROC NEAR

; 694  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 695  : 	PluginInstance* This;
; 696  : 	if (instance != NULL)

	cmp	DWORD PTR _instance$[ebp], 0
	je	SHORT $L48765

; 697  : 		This = (PluginInstance*) instance->pdata;

	mov	eax, DWORD PTR _instance$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _This$[ebp], ecx
$L48765:

; 698  : 
; 699  : 	/* added for NpPerlPlus Plug-in */
; 700  : 
; 701  : 	/* Number of bytes ready to accept in NPP_Write() */
; 702  : 	switch(This->from){

	mov	edx, DWORD PTR _This$[ebp]
	mov	eax, DWORD PTR [edx+172]
	mov	DWORD PTR -8+[ebp], eax
	cmp	DWORD PTR -8+[ebp], 1
	je	SHORT $L48771
	cmp	DWORD PTR -8+[ebp], 2
	je	SHORT $L48772
	jmp	SHORT $L48768
$L48771:

; 703  : 	case FROM_APPLICATION:
; 704  : 		/* Number of bytes ready to accept from application */
; 705  : 		return STREAMBUFSIZE;

	mov	eax, DWORD PTR ?STREAMBUFSIZE@@3JA	; STREAMBUFSIZE
	jmp	SHORT $L48763
$L48772:

; 706  : 		break;
; 707  : 	case FROM_CGI:
; 708  : 		/* Number of bytes ready to accept from CGI */
; 709  : 		return CGISIZE;

	mov	eax, 1
	jmp	SHORT $L48763
$L48768:

; 712  : 	return STREAMBUFSIZE;

	mov	eax, DWORD PTR ?STREAMBUFSIZE@@3JA	; STREAMBUFSIZE
$L48763:

; 713  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_NPP_WriteReady ENDP
_TEXT	ENDS
PUBLIC	_NPP_Write
_TEXT	SEGMENT
_instance$ = 8
_len$ = 20
_buffer$ = 24
_This$48780 = -4
_NPP_Write PROC NEAR

; 738  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 8

; 739  : 	if (instance != NULL) {

	cmp	DWORD PTR _instance$[ebp], 0
	je	SHORT $L48779

; 740  : 		PluginInstance* This = (PluginInstance*) instance->pdata;

	mov	eax, DWORD PTR _instance$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _This$48780[ebp], ecx

; 741  : 	
; 742  : 	/* added for NpPerlPlus Plug-in */
; 743  : 	/* 
; 744  : 	 * Write the incomming stream to our temporary file.  Note that this method
; 745  : 	 * may get called multiple times by the browser, depending on  network
; 746  : 	 * latency and other confounding events.   That's why we save it 
; 747  : 	 * to a temp file.
; 748  : 	 */
; 749  : 
; 750  : 		switch(This->from) {

	mov	edx, DWORD PTR _This$48780[ebp]
	mov	eax, DWORD PTR [edx+172]
	mov	DWORD PTR -8+[ebp], eax
	cmp	DWORD PTR -8+[ebp], 1
	je	SHORT $L48786
	cmp	DWORD PTR -8+[ebp], 2
	je	SHORT $L48787
	jmp	SHORT $L48783
$L48786:

; 751  : 		case FROM_APPLICATION:
; 752  : 			len = write(This->temp_fd, buffer, len);

	mov	ecx, DWORD PTR _len$[ebp]
	push	ecx
	mov	edx, DWORD PTR _buffer$[ebp]
	push	edx
	mov	eax, DWORD PTR _This$48780[ebp]
	mov	ecx, DWORD PTR [eax+32]
	push	ecx
	call	DWORD PTR __imp__write
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _len$[ebp], eax

; 753  : 			break;

	jmp	SHORT $L48783
$L48787:

; 754  : 		case FROM_CGI:
; 755  : #ifdef NPP_DEBUG
; 756  : 		fprintf(This->log_fd, "buffer = %s\n", buffer);
; 757  : #endif
; 758  : 			if(This->write_cgi == 0 ) {

	mov	edx, DWORD PTR _This$48780[ebp]
	cmp	DWORD PTR [edx+176], 0
	jne	SHORT $L48788

; 759  : 				strncpy(This->secure_parms, (char *)buffer, CGISIZE);

	push	1
	mov	eax, DWORD PTR _buffer$[ebp]
	push	eax
	mov	ecx, DWORD PTR _This$48780[ebp]
	add	ecx, 168				; 000000a8H
	push	ecx
	call	DWORD PTR __imp__strncpy
	add	esp, 12					; 0000000cH

; 760  : 				This->secure_parms[CGISIZE] = '\0';

	mov	edx, DWORD PTR _This$48780[ebp]
	mov	BYTE PTR [edx+169], 0

; 761  : 				This->write_cgi = 1;

	mov	eax, DWORD PTR _This$48780[ebp]
	mov	DWORD PTR [eax+176], 1
$L48788:
$L48783:
$L48779:

; 769  : 		return len;		/* The number of bytes accepted */

	mov	eax, DWORD PTR _len$[ebp]

; 770  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_NPP_Write ENDP
_TEXT	ENDS
PUBLIC	_NPP_DestroyStream
_TEXT	SEGMENT
_instance$ = 8
_stream$ = 12
_This$ = -8
_rc$ = -4
_NPP_DestroyStream PROC NEAR

; 782  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH

; 783  : 	PluginInstance* This;
; 784  : 	int rc;
; 785  : 
; 786  : 	if (instance == NULL)

	cmp	DWORD PTR _instance$[ebp], 0
	jne	SHORT $L48796

; 787  : 		return NPERR_INVALID_INSTANCE_ERROR;

	mov	ax, 2
	jmp	SHORT $L48793
$L48796:

; 788  : 	This = (PluginInstance*) instance->pdata;

	mov	eax, DWORD PTR _instance$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _This$[ebp], ecx

; 789  : 
; 790  : 	/* Added for NpPerlPlus Plug-in */
; 791  : 	/*
; 792  : 	 * If this stream came from the CGI, then we check the parameters it returned
; 793  : 	 * and if everything is ok, we fork/exec the application.  If the stream came
; 794  : 	 * from the application, then we have to run an authorization check before
; 795  : 	 * running the application.
; 796  : 	 */
; 797  : 
; 798  : 		switch(This->from){

	mov	edx, DWORD PTR _This$[ebp]
	mov	eax, DWORD PTR [edx+172]
	mov	DWORD PTR -12+[ebp], eax
	cmp	DWORD PTR -12+[ebp], 1
	je	SHORT $L48802
	cmp	DWORD PTR -12+[ebp], 2
	je	SHORT $L48803
	jmp	SHORT $L48799
$L48802:

; 799  : 		case FROM_APPLICATION:
; 800  : 			/* POST to the secureity CGI here */
; 801  : 			NPPerl_CheckAuth(instance, stream);

	mov	ecx, DWORD PTR _stream$[ebp]
	push	ecx
	mov	edx, DWORD PTR _instance$[ebp]
	push	edx
	call	?NPPerl_CheckAuth@@YAHPAU_NPP@@PAU_NPStream@@@Z ; NPPerl_CheckAuth
	add	esp, 8

; 802  : 			break;

	jmp	SHORT $L48799
$L48803:

; 803  : 		case FROM_CGI:
; 804  : 			return(rc = NPPerl_Execl(This));

	mov	eax, DWORD PTR _This$[ebp]
	push	eax
	call	?NPPerl_Execl@@YAFPAU_PluginInstance@@@Z ; NPPerl_Execl
	add	esp, 4
	movsx	ecx, ax
	mov	DWORD PTR _rc$[ebp], ecx
	mov	ax, WORD PTR _rc$[ebp]
	jmp	SHORT $L48793
$L48799:

; 806  : 	return NPERR_NO_ERROR;

	xor	ax, ax
$L48793:

; 807  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_NPP_DestroyStream ENDP
_TEXT	ENDS
PUBLIC	_NPP_StreamAsFile
_TEXT	SEGMENT
_instance$ = 8
_This$ = -4
_NPP_StreamAsFile PROC NEAR

; 821  : {

	push	ebp
	mov	ebp, esp
	push	ecx

; 822  : 	PluginInstance* This;
; 823  : 	if (instance != NULL)

	cmp	DWORD PTR _instance$[ebp], 0
	je	SHORT $L48809

; 824  : 		This = (PluginInstance*) instance->pdata;

	mov	eax, DWORD PTR _instance$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _This$[ebp], ecx
$L48809:

; 825  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_NPP_StreamAsFile ENDP
_TEXT	ENDS
PUBLIC	_NPP_Print
_TEXT	SEGMENT
_instance$ = 8
_printInfo$ = 12
_This$48816 = -4
_platformPrint$48819 = -12
_printOne$48821 = -8
_printWindow$48823 = -16
_platformPrint$48825 = -20
_NPP_Print PROC NEAR

; 832  : {

	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H

; 833  : 	if(printInfo == NULL)

	cmp	DWORD PTR _printInfo$[ebp], 0
	jne	SHORT $L48814

; 834  : 		return;

	jmp	SHORT $L48813
$L48814:

; 835  : 
; 836  : 	if (instance != NULL) {

	cmp	DWORD PTR _instance$[ebp], 0
	je	SHORT $L48815

; 837  : 		PluginInstance* This = (PluginInstance*) instance->pdata;

	mov	eax, DWORD PTR _instance$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _This$48816[ebp], ecx

; 838  : 	
; 839  : 		if (printInfo->mode == NP_FULL) {

	mov	edx, DWORD PTR _printInfo$[ebp]
	xor	eax, eax
	mov	ax, WORD PTR [edx]
	cmp	eax, 2
	jne	SHORT $L48818

; 840  : 		    /*
; 841  : 		     * PLUGIN DEVELOPERS:
; 842  : 		     *	If your plugin would like to take over
; 843  : 		     *	printing completely when it is in full-screen mode,
; 844  : 		     *	set printInfo->pluginPrinted to TRUE and print your
; 845  : 		     *	plugin as you see fit.  If your plugin wants Netscape
; 846  : 		     *	to handle printing in this case, set
; 847  : 		     *	printInfo->pluginPrinted to FALSE (the default) and
; 848  : 		     *	do nothing.  If you do want to handle printing
; 849  : 		     *	yourself, printOne is true if the print button
; 850  : 		     *	(as opposed to the print menu) was clicked.
; 851  : 		     *	On the Macintosh, platformPrint is a THPrint; on
; 852  : 		     *	Windows, platformPrint is a structure
; 853  : 		     *	(defined in npapi.h) containing the printer name, port,
; 854  : 		     *	etc.
; 855  : 		     */
; 856  : 
; 857  : 			void* platformPrint =
; 858  : 				printInfo->print.fullPrint.platformPrint;

	mov	ecx, DWORD PTR _printInfo$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	DWORD PTR _platformPrint$48819[ebp], edx

; 859  : 			NPBool printOne =
; 860  : 				printInfo->print.fullPrint.printOne;

	mov	eax, DWORD PTR _printInfo$[ebp]
	mov	cl, BYTE PTR [eax+5]
	mov	BYTE PTR _printOne$48821[ebp], cl

; 861  : 			
; 862  : 			/* Do the default*/
; 863  : 			printInfo->print.fullPrint.pluginPrinted = FALSE;

	mov	edx, DWORD PTR _printInfo$[ebp]
	mov	BYTE PTR [edx+4], 0

; 865  : 		else {	/* If not fullscreen, we must be embedded */

	jmp	SHORT $L48822
$L48818:

; 866  : 		    /*
; 867  : 		     * PLUGIN DEVELOPERS:
; 868  : 		     *	If your plugin is embedded, or is full-screen
; 869  : 		     *	but you returned false in pluginPrinted above, NPP_Print
; 870  : 		     *	will be called with mode == NP_EMBED.  The NPWindow
; 871  : 		     *	in the printInfo gives the location and dimensions of
; 872  : 		     *	the embedded plugin on the printed page.  On the
; 873  : 		     *	Macintosh, platformPrint is the printer port; on
; 874  : 		     *	Windows, platformPrint is the handle to the printing
; 875  : 		     *	device context.
; 876  : 		     */
; 877  : 
; 878  : 			NPWindow* printWindow =
; 879  : 				&(printInfo->print.embedPrint.window);

	mov	eax, DWORD PTR _printInfo$[ebp]
	add	eax, 4
	mov	DWORD PTR _printWindow$48823[ebp], eax

; 880  : 			void* platformPrint =
; 881  : 				printInfo->print.embedPrint.platformPrint;

	mov	ecx, DWORD PTR _printInfo$[ebp]
	mov	edx, DWORD PTR [ecx+36]
	mov	DWORD PTR _platformPrint$48825[ebp], edx
$L48822:
$L48815:
$L48813:

; 884  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_NPP_Print ENDP
_TEXT	ENDS
PUBLIC	_NPP_URLNotify
_TEXT	SEGMENT
_NPP_URLNotify PROC NEAR

; 906  : {

	push	ebp
	mov	ebp, esp

; 907  : 	return;
; 908  : }

	pop	ebp
	ret	0
_NPP_URLNotify ENDP
_TEXT	ENDS
PUBLIC	_NPP_HandleEvent
_TEXT	SEGMENT
_NPP_HandleEvent PROC NEAR

; 921  : {

	push	ebp
	mov	ebp, esp

; 922  : 	return 0;

	xor	ax, ax

; 923  : }

	pop	ebp
	ret	0
_NPP_HandleEvent ENDP
_TEXT	ENDS
END
