/*********************************************************************************
This file may be a .c file however it's being treated like a c++ file.
This is because we are compiling/linking with g++.
So any functions we create here must be declared as "extern "C" int foo()" first.
This prevents any strange name mangleing.
*********************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <SDL2/SDL.h> 

extern "C" unsigned char BPColorR,BPColorG,BPColorB,BPColorA;
extern "C" Uint8 BPIsQuit;
extern "C" const Uint8 *BPKeys;

extern "C" int BPSetup();
extern "C" void BPClear();
extern "C" void BPRender();
extern "C" void BPEndGame();
extern "C" void BPRect(int, int, int, int);



SDL_Window *win;
SDL_Renderer *ren;
SDL_Event evt;
//SDL_Surface *bmp;
//SDL_Texture *tex;
unsigned char BPColorR,BPColorG,BPColorB,BPColorA;
Uint8 BPIsQuit;
const Uint8 *BPKeys;

int BPSetup(){
	BPKeys = SDL_GetKeyboardState(NULL);
	if (SDL_Init(SDL_INIT_VIDEO) != 0){
		printf("SDL_Init Error: ", SDL_GetError());
		return 1;
	}
	win = SDL_CreateWindow("", 100, 100, 640, 480, SDL_WINDOW_SHOWN);
	if (win == NULL){
		printf("SDL_CreateWindow Error: ", SDL_GetError());
		SDL_Quit();
		return 1;
	}
	ren = SDL_CreateRenderer(win, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC);
	SDL_SetRenderDrawBlendMode(ren, SDL_BLENDMODE_BLEND);
	if (ren == NULL){
		SDL_DestroyWindow(win);
		printf("SDL_CreateRenderer Error: ", SDL_GetError());
		SDL_Quit();
		return 1;
	}
	return 0;
}

void BPClear(){
	SDL_RenderClear(ren);
	SDL_Rect fillRect = { 0, 0, 800, 600 };
	SDL_SetRenderDrawColor( ren, 0x00, 0x00, 0x00, 0xFF );        
	SDL_RenderFillRect( ren, &fillRect );
}

void BPRender(){
	SDL_RenderPresent(ren);
	SDL_PollEvent(&evt);
	if (evt.type == SDL_QUIT) {
		BPIsQuit = 1;
	}
	SDL_Delay(1000/60);
}

void BPEndGame(){
	SDL_DestroyRenderer(ren);
	SDL_DestroyWindow(win);
	SDL_Quit();
}

void BPRect(int _x, int _y, int _w, int _h){
	SDL_Rect fillRect = { _x, _y, _w, _h };
	SDL_SetRenderDrawColor( ren, BPColorR, BPColorG, BPColorB, BPColorA);
	SDL_RenderFillRect( ren, &fillRect );
}

extern int main( int argc, char* args[] );