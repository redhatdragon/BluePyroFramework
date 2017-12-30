global _main
%include "BluePyroFramework\BPFramework.asm"

section .text
BP_SETUP_INIT

BP_SETUP_END

BP_GAME_LOOP_INIT
	BP_FILL 255,0,0,255 ;all new shapes will be red.
	BP_DRAW_RECT 50,20,60,30 ;draw shape at 50,20 with domensions 60,30
BP_GAME_LOOP_END