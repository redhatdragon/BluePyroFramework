%ifidn __OUTPUT_FORMAT__, win32
    %define WIN
    %define WIN32
%elifidn __OUTPUT_FORMAT__, win64
    %define WIN
    %define WIN64
%elifidn __OUTPUT_FORMAT__, elf32
    %define LINUX
    %define LINUX32
%elifidn __OUTPUT_FORMAT__, elf64
    %define LINUX
    %define LINUX64
%endif

%include "BluePyroFramework\graphics.asm"
%include "BluePyroFramework\keyboard.asm"

%macro BP_SETUP_INIT 0
init:
%endmacro
%macro BP_SETUP_END 0
ret
%endmacro
%macro BP_GAME_LOOP_INIT 0
%ifndef WIN
main:
%else
_main:
%endif
call BPSetup
call init
gameLoop:
pushad
call BPClear
popad
%endmacro
%macro BP_GAME_LOOP_END 0
pushad
call BPRender
popad
cmp byte[BPIsQuit], 1
je end
jmp gameLoop
end:
call BPEndGame
xor eax,eax
ret
%endmacro

%ifndef WIN
extern BPSetup
extern BPClear
extern BPRender
extern BPEndGame
extern BPIsQuit
%else
extern _BPSetup
extern _BPClear
extern _BPRender
extern _BPEndGame
extern _BPIsQuit
%define BPSetup _BPSetup
%define BPClear _BPClear
%define BPRender _BPRender
%define BPEndGame _BPEndGame
%define BPIsQuit _BPIsQuit
%endif