echo off
echo.

echo compiling...
g++ main.c -c -lmingw32 -mwindows -mconsole^
 -L lib -lSDL2main -lSDL2
echo.

echo compiling asm...
nasm main.asm -f win32 -o mainAsm.o -I BluePyroGraphics
echo.

echo linking...
g++ main.c mainAsm.o -o binWIN32\a.exe^
 -lmingw32 -mwindows -mconsole^
 -L lib -lSDL2main -lSDL2
echo.


echo done
echo.
pause
exit