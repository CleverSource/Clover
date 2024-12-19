REM Build script for engine
@ECHO OFF
SetLocal EnableDelayedExpansion

REM Get a list of all the .c files.
SET cFilenames=
FOR /R %%f in (*.c) do (SET cFilenames=!cFilenames! %%f)

SET assembly=tests
SET compilerFlags=-g -Wno-missing-braces
SET includeFlags=-Isrc -I../engine/src
SET linkerFlags=-L../bin/ -lengine.lib
SET defines=-D_DEBUG -DCIMPORT

ECHO "Building %assembly%"
clang %cFilenames% %compilerFlags% -o ../bin/%assembly%.exe %defines% %includeFlags% %linkerFlags%