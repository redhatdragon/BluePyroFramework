;----------------------------------------------;
;KEYBOARD IO
;
;BP_KEYPRESSED_JUMP_TRUE  ;Jumps if true
;Input:     1 = keyCode; 2 = label to jump to;
;Regs mod:  NONE
;
;BP_KEYPRESSED_JUMP_FALSE  ;Jumps if false
;Input:     1 = keyCode; 2 = label to jump to;
;Regs mod:  NONE
;
;BP_IS_KEYPRESSED
;Input:     1 = keyCode;
;Regs mod:  al(return bool)
;----------------------------------------------;

%ifndef WIN
extern BPKeys
%else
extern _BPKeys
%define BPKeys _BPKeys
%endif

%macro BP_KEYPRESSED_JUMP_TRUE 2
	push ebx
	mov ebx, [BPKeys]
	mov bl, [ebx+%1-93]
	test bl, bl
	pop ebx
	jnz %2
%endmacro
%macro BP_KEYPRESSED_JUMP_FALSE 2
	push ebx
	mov ebx, [BPKeys]
	mov bl, [ebx+%1-93]
	test bl, bl
	pop ebx
	jz %2
%endmacro
%macro BP_IS_KEYPRESSED 1
	mov eax, [BPKeys]
	mov al, [eax+%1-93]
%endmacro