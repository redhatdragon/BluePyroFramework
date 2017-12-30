%ifndef WIN
extern BPRect
extern BPColorR
extern BPColorG
extern BPColorB
extern BPColorA
%else
extern _BPRect
extern _BPColorR
extern _BPColorG
extern _BPColorB
extern _BPColorA
%define BPRect _BPRect
%define BPColorR _BPColorR
%define BPColorG _BPColorG
%define BPColorB _BPColorB
%define BPColorA _BPColorA
%endif



%macro BP_DRAW_RECT 4
	pushad
	push %4
	push %3
	push %2
	push %1
	call BPRect
	add esp, 16
	popad
%endmacro

%macro BP_FILL 4
	mov byte[BPColorR], %1
	mov byte[BPColorG], %2
	mov byte[BPColorB], %3
	mov byte[BPColorA], %4
%endmacro