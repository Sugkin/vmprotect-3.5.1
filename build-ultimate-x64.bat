echo build-ultimate.bat: generating VMProtect Ultimate x64

SET ROOT_DIR=%~dp0
IF "%ROOT_DIR:~-1%"=="\" SET "ROOT_DIR=%ROOT_DIR:~0,-1%"

if exist "%ROOT_DIR%\bin" rmdir /q /s "%ROOT_DIR%\bin"
if exist "%ROOT_DIR%\tmp" rmdir /q /s "%ROOT_DIR%\tmp"

msbuild "%ROOT_DIR%\vmprotect.sln" /p:Configuration=Ultimate /p:Platform=Win32 /t:VMProtectSDK
msbuild "%ROOT_DIR%\vmprotect.sln" /p:Configuration=Ultimate /p:Platform=x64 /t:VMProtectSDK
msbuild "%ROOT_DIR%\vmprotect.sln" /p:Configuration=Ultimate /p:Platform=x64 /t:VMProtectCon
msbuild "%ROOT_DIR%\vmprotect.sln" /p:Configuration=Ultimate /p:Platform=x64 /t:VMProtect

windeployqt "%ROOT_DIR%\bin\64\Ultimate\VMProtect.exe"

copy "%ROOT_DIR%\bin\32\Release\*" "%ROOT_DIR%\bin\64\Ultimate"
copy "%ROOT_DIR%\bin\64\Release\*" "%ROOT_DIR%\bin\64\Ultimate"
