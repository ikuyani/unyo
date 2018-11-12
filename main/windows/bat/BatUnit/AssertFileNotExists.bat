@setlocal
@echo off

rem ******************************************************************
rem * AssertFileNotExists.bat: ファイルもしくはフォルダが存在しないか検証する
rem *
rem * [説明]
rem *   存在しない場合、Successfulをコンソールに出力し、0を返す。
rem *   存在する場合、Failedをコンソールに出力し、1を返す。
rem *   エラーの場合、Errorをコンソールに出力し、9を返す。
rem * 
rem * [引数]
rem *   %1: テスト名
rem *   %2: ファイルパス
rem * 
rem * [バージョン]
rem *   1.0.0
rem ******************************************************************
rem echo AssertFileNotExists.bat %1 %2

set TEST_NAME=%~1
set FILE_PATH=%2

rem NULL
 if not defined FILE_PATH (
    echo Error %TEST_NAME%, File-path is NULL.
    endlocal
    exit /b 9
)

rem 存在する
if exist %FILE_PATH% (
    echo Failed %TEST_NAME%, File[%FILE_PATH%] exists.
    endlocal
    exit /b 1
)

echo Successful %TEST_NAME%.

endlocal
exit /b 0
