set BUILD_JAVA=build_java
set BUILD_C=build_c
set SRC_JAVA=src\java
set SRC_C=src\c
set JAVA_NAME=File
set HEADER_NAME="File.java Main.java"
set DLL_NAME=File
set HEADERS_FROM_JAVA_DIR="C:\Program Files\Java\jdk1.8.0_171\include"

:: clear %BUILD_JAVA% directory
rd /s /q %BUILD_JAVA%
if exist %BUILD_JAVA% rd /s /q %BUILD_JAVA%

:: make %BUILD_JAVA% and %GENERATED_DIR% directories
mkdir %BUILD_JAVA%

:: clear %BUILD_C% directory
rd /s /q %BUILD_C%
if exist %BUILD_C% rd /s /q %BUILD_C%

::make %BUILD_C% and %GENERATED_DIR% directories
mkdir %BUILD_C%

:: compilation and generate header
javac -d %BUILD_JAVA% %SRC_JAVA%\com\amos\file\manager\%HEADER_NAME%
:: generate header
javah -d %SRC_C% -cp %BUILD_JAVA% com.amos.file.manager.%JAVA_NAME%

:: create MathExpressions.dll
::g++ -shared -o %BUILD_C%\File.dll %SRC_C%\File.cpp

:: create JNIProject.dll lib which java application works with
g++ -Wl,--add-stdcall-alias -I%HEADERS_FROM_JAVA_DIR% -I%HEADERS_FROM_JAVA_DIR%\win32 -shared -o %BUILD_C%\%DLL_NAME%.dll %SRC_C%\File.cpp
:: pause
:: copy headers to %BUILD_C% directory
copy %SRC_C%\com_amos_file_manager_File.h %BUILD_C%
pause
::copy %SRC_C%\com_task_JNIProject.h %BUILD_C%

:: run java program
java -Djava.library.path=%BUILD_C% -cp %BUILD_JAVA% com.amos.file.manager.File

