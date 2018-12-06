@setlocal
@echo off

call "%~dp0\test-config.bat"

rem �e�X�g�Ώ�
set TEST_TARGET_PATH="%TEST_BAT_DIR%\Logger.bat"
set TEST_DATA_DIR=%TEST_HOME_DIR%\Logger

set LOGGER_LEVEL=
set LOGGER_HANDLER=
set LOGGER_FILE_OUTPUT=
set LOGGER_FILE_ROTATE=
set LOGGER_FILE_ROTATE_MAXSIZE=

rem ���O�o�͐�R���\�[��
rem 1 ���O���x��TRACE
setlocal
set TESTNO=1
set LOGGER_LEVEL=traCe
set LOGGER_HANDLER=console
echo %TESTNO% Expected: trace debug info warn error fatal
call %TEST_TARGET_PATH% trace "%TESTNO%-1 OK trace"
call %TEST_TARGET_PATH% Debug "%TESTNO%-2 OK debug"
call %TEST_TARGET_PATH% INFO "%TESTNO%-3 OK info"
call %TEST_TARGET_PATH% WARn "%TESTNO%-4 OK warn"
call %TEST_TARGET_PATH% error "%TESTNO%-5 OK error"
call %TEST_TARGET_PATH% fatal "%TESTNO%-6 OK fatal"
call %TEST_TARGET_PATH% hoge "%TESTNO%-7 NG hoge"
endlocal

rem 2 ���O���x��DEBUG
setlocal
set TESTNO=2
set LOGGER_LEVEL=DeBUG
set LOGGER_HANDLER=Console
echo %TESTNO% Expected: debug info warn error fatal
call %TEST_TARGET_PATH% trace "%TESTNO%-1 NG trace"
call %TEST_TARGET_PATH% Debug "%TESTNO%-2 OK debug"
call %TEST_TARGET_PATH% INFO "%TESTNO%-3 OK info"
call %TEST_TARGET_PATH% WARn "%TESTNO%-4 OK warn"
call %TEST_TARGET_PATH% error "%TESTNO%-5 OK error"
call %TEST_TARGET_PATH% fatal "%TESTNO%-6 OK fatal"
call %TEST_TARGET_PATH% hoge "%TESTNO%-7 NG hoge"
endlocal

rem 3 ���O���x��INFO
setlocal
set TESTNO=3
set LOGGER_LEVEL=INFO
set LOGGER_HANDLER=CONSOLE
echo %TESTNO% Expected: info warn error fatal
call %TEST_TARGET_PATH% trace "%TESTNO%-1 NG trace"
call %TEST_TARGET_PATH% Debug "%TESTNO%-2 NG debug"
call %TEST_TARGET_PATH% INFO "%TESTNO%-3 OK info"
call %TEST_TARGET_PATH% WARn "%TESTNO%-4 OK warn"
call %TEST_TARGET_PATH% error "%TESTNO%-5 OK error"
call %TEST_TARGET_PATH% fatal "%TESTNO%-6 OK fatal"
call %TEST_TARGET_PATH% hoge "%TESTNO%-7 NG hoge"
endlocal

rem 4 ���O���x��WARN
setlocal
set TESTNO=4
set LOGGER_LEVEL=WARN
set LOGGER_HANDLER=CONSOLE
echo %TESTNO% Expected: warn error fatal
call %TEST_TARGET_PATH% trace "%TESTNO%-1 NG trace"
call %TEST_TARGET_PATH% Debug "%TESTNO%-2 NG debug"
call %TEST_TARGET_PATH% INFO "%TESTNO%-3 NG info"
call %TEST_TARGET_PATH% WARn "%TESTNO%-4 OK warn"
call %TEST_TARGET_PATH% error "%TESTNO%-5 OK error"
call %TEST_TARGET_PATH% fatal "%TESTNO%-6 OK fatal"
call %TEST_TARGET_PATH% hoge "%TESTNO%-7 NG hoge"
endlocal

rem 5 ���O���x��ERROR
setlocal
set TESTNO=5
set LOGGER_LEVEL=ERROR
set LOGGER_HANDLER=CONSOLE
echo %TESTNO% Expected: error fatal
call %TEST_TARGET_PATH% trace "%TESTNO%-1 NG trace"
call %TEST_TARGET_PATH% Debug "%TESTNO%-2 NG debug"
call %TEST_TARGET_PATH% INFO "%TESTNO%-3 NG info"
call %TEST_TARGET_PATH% WARn "%TESTNO%-4 NG warn"
call %TEST_TARGET_PATH% error "%TESTNO%-5 OK error"
call %TEST_TARGET_PATH% fatal "%TESTNO%-6 OK fatal"
call %TEST_TARGET_PATH% hoge "%TESTNO%-7 NG hoge"
endlocal

rem 6 ���O���x��FATAL
setlocal
set TESTNO=6
set LOGGER_LEVEL=FATAL
set LOGGER_HANDLER=CONSOLE
echo %TESTNO% Expected: fatal
call %TEST_TARGET_PATH% trace "%TESTNO%-1 NG trace"
call %TEST_TARGET_PATH% Debug "%TESTNO%-2 NG debug"
call %TEST_TARGET_PATH% INFO "%TESTNO%-3 NG info"
call %TEST_TARGET_PATH% WARn "%TESTNO%-4 NG warn"
call %TEST_TARGET_PATH% error "%TESTNO%-5 NG error"
call %TEST_TARGET_PATH% fatal "%TESTNO%-6 OK fatal"
call %TEST_TARGET_PATH% hoge "%TESTNO%-7 NG hoge"
endlocal

rem 7 ���O���x���s��
setlocal
set TESTNO=7
set LOGGER_LEVEL=hoge
set LOGGER_HANDLER=CONSOLE
echo %TESTNO% Expected: No log
call %TEST_TARGET_PATH% trace "%TESTNO%-1 NG trace"
call %TEST_TARGET_PATH% Debug "%TESTNO%-2 NG debug"
call %TEST_TARGET_PATH% INFO "%TESTNO%-3 NG info"
call %TEST_TARGET_PATH% WARn "%TESTNO%-4 NG warn"
call %TEST_TARGET_PATH% error "%TESTNO%-5 NG error"
call %TEST_TARGET_PATH% fatal "%TESTNO%-6 NG fatal"
call %TEST_TARGET_PATH% hoge "%TESTNO%-7 NG hoge"
endlocal

rem 8 �������O���x�����w��
setlocal
set TESTNO=8
set LOGGER_LEVEL=INFO
set LOGGER_HANDLER=CONSOLE
echo %TESTNO% Expected: No log
set LEVEL=
call %TEST_TARGET_PATH%
call "%TEST_ASSERT_EQUALS%" "%TESTNO%" 1 %ERRORLEVEL%
endlocal

rem 9 �������b�Z�[�W���w��
setlocal
set TESTNO=9
set LOGGER_LEVEL=INFO
set LOGGER_HANDLER=CONSOLE
echo %TESTNO% Expected: No log
call %TEST_TARGET_PATH% error
call "%TEST_ASSERT_EQUALS%" "%TESTNO%" 1 %ERRORLEVEL%
endlocal

rem 10 ���O���x�������w��
setlocal
set TESTNO=10
set LOGGER_LEVEL=
set LOGGER_HANDLER=CONSOLE
echo %TESTNO% Expected: No log
call %TEST_TARGET_PATH% error "%TESTNO%-5 NG error"
call "%TEST_ASSERT_EQUALS%" "%TESTNO%" 1 %ERRORLEVEL%
endlocal

rem 11 �o�͐悪���w��
setlocal
set TESTNO=11
set LOGGER_LEVEL=INFO
set LOGGER_HANDLER=
echo %TESTNO% Expected: No log
call %TEST_TARGET_PATH% error "%TESTNO%-5 NG error"
call "%TEST_ASSERT_EQUALS%" "%TESTNO%" 1 %ERRORLEVEL%
endlocal

rem 12 �o�͐悪�s��
setlocal
set TESTNO=12
set LOGGER_LEVEL=INFO
set LOGGER_HANDLER=HOGE
echo %TESTNO% Expected: No log
call %TEST_TARGET_PATH% error "%TESTNO%-5 NG error"
call "%TEST_ASSERT_EQUALS%" "%TESTNO%" 1 %ERRORLEVEL%
endlocal

rem ���O�o�͐�t�@�C��
rem �e���|����
set time2=%time: =0%
set TEST_TEMP_DIR_2=%TEST_TEMP_DIR%\Logger_Test%date:~0,4%%date:~5,2%%date:~8,2%%time2:~0,2%%time2:~3,2%%time2:~6,2%%time2:~9,2%
mkdir "%TEST_TEMP_DIR_2%"

rem 100 ���[�e�[�g�Ȃ� �t�@�C������
setlocal
set TESTNO=100
set LOGGER_LEVEL=INFO
set LOGGER_HANDLER=FILE
set LOGGER_FILE_OUTPUT="%TEST_TEMP_DIR_2%\%TESTNO%.log"
set LOGGER_FILE_ROTATE=SIZE
set LOGGER_FILE_ROTATE_MAXNUMBER=100
set LOGGER_FILE_ROTATE_MAXSIZE=10
echo %TESTNO% Expected: info warn error fatal
call %TEST_TARGET_PATH% trace "%TESTNO%-1 NG trace ���{��"
call %TEST_TARGET_PATH% Debug "%TESTNO%-2 NG debug ���{��"
call %TEST_TARGET_PATH% INFO "%TESTNO%-3 OK info ���{��"
call %TEST_TARGET_PATH% WARn "%TESTNO%-4 OK warn ���{��"
call %TEST_TARGET_PATH% error "%TESTNO%-5 OK error ���{��"
call %TEST_TARGET_PATH% fatal "%TESTNO%-6 OK fatal ���{��"
call %TEST_TARGET_PATH% hoge "%TESTNO%-7 NG hoge ���{��"
call %TEST_ASSERT_FILE_EXISTS% "%TESTNO%" "%TEST_TEMP_DIR_2%\%TESTNO%.log"
endlocal

rem 101 ���[�e�[�g�Ȃ� �t�@�C������
setlocal
set TESTNO=101
set LOGGER_LEVEL=INFO
set LOGGER_HANDLER=FILE
set LOGGER_FILE_OUTPUT="%TEST_TEMP_DIR_2%\%TESTNO%.log"
set LOGGER_FILE_ROTATE=SIZE
set LOGGER_FILE_ROTATE_MAXNUMBER=100
set LOGGER_FILE_ROTATE_MAXSIZE=20
echo %TESTNO% Expected: info warn error fatal
copy "%TEST_DATA_DIR%\10kb.log" "%TEST_TEMP_DIR_2%\%TESTNO%.log"
call %TEST_TARGET_PATH% trace "%TESTNO%-1 NG trace ���{��"
call %TEST_TARGET_PATH% Debug "%TESTNO%-2 NG debug ���{��"
call %TEST_TARGET_PATH% INFO "%TESTNO%-3 OK info ���{��"
call %TEST_TARGET_PATH% WARn "%TESTNO%-4 OK warn ���{��"
call %TEST_TARGET_PATH% error "%TESTNO%-5 OK error ���{��"
call %TEST_TARGET_PATH% fatal "%TESTNO%-6 OK fatal ���{��"
call %TEST_TARGET_PATH% hoge "%TESTNO%-7 NG hoge ���{��"
call %TEST_ASSERT_FILE_FIRST_LINE_EQUALS% "%TESTNO%" "xx34567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890" "%TEST_TEMP_DIR_2%\%TESTNO%.log"
call %TEST_ASSERT_FILE_NOT_EXISTS% "%TESTNO%" "%TEST_TEMP_DIR_2%\%TESTNO%.log.1"
endlocal

rem 102 ���[�e�[�g����
setlocal
set TESTNO=102
set LOGGER_LEVEL=INFO
set LOGGER_HANDLER=FILE
set LOGGER_FILE_OUTPUT="%TEST_TEMP_DIR_2%\%TESTNO%.log"
set LOGGER_FILE_ROTATE=SIZE
set LOGGER_FILE_ROTATE_MAXNUMBER=100
set LOGGER_FILE_ROTATE_MAXSIZE=10
echo %TESTNO% Expected: info warn error fatal
copy "%TEST_DATA_DIR%\10kb.log" "%TEST_TEMP_DIR_2%\%TESTNO%.log"
call %TEST_TARGET_PATH% trace "%TESTNO%-1 NG trace ���{��"
call %TEST_TARGET_PATH% Debug "%TESTNO%-2 NG debug ���{��"
call %TEST_TARGET_PATH% INFO "%TESTNO%-3 OK info ���{��"
call %TEST_TARGET_PATH% WARn "%TESTNO%-4 OK warn ���{��"
call %TEST_TARGET_PATH% error "%TESTNO%-5 OK error ���{��"
call %TEST_TARGET_PATH% fatal "%TESTNO%-6 OK fatal ���{��"
call %TEST_TARGET_PATH% hoge "%TESTNO%-7 NG hoge ���{��"
call %TEST_ASSERT_FILE_EXISTS% "%TESTNO%" "%TEST_TEMP_DIR_2%\%TESTNO%.log"
call %TEST_ASSERT_FILE_FIRST_LINE_EQUALS% "%TESTNO%" "xx34567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890" "%TEST_TEMP_DIR_2%\%TESTNO%.log.1"
endlocal

rem 103 ���[�e�[�g���s
setlocal
set TESTNO=103
set LOGGER_LEVEL=INFO
set LOGGER_HANDLER=FILE
set LOGGER_FILE_OUTPUT="%TEST_TEMP_DIR_2%\%TESTNO%.log"
set LOGGER_FILE_ROTATE=SIZE
set LOGGER_FILE_ROTATE_MAXNUMBER=100
set LOGGER_FILE_ROTATE_MAXSIZE=10
echo %TESTNO% Expected: info warn error fatal
copy "%TEST_DATA_DIR%\10kb.log" "%TEST_TEMP_DIR_2%\%TESTNO%.log"
rem pause
call %TEST_TARGET_PATH% INFO "%TESTNO% OK info ���{��"
rem call %TEST_ASSERT_EQUALS% "%TESTNO%" 2 %ERRORLEVEL%
rem call %TEST_ASSERT_FILE_FIRST_LINE_EQUALS% "%TESTNO%" "xx34567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890" "%TEST_TEMP_DIR_2%\%TESTNO%.log"
rem call %TEST_ASSERT_FILE_NOT_EXISTS% "%TESTNO%" "%TEST_TEMP_DIR_2%\%TESTNO%.log.1"
endlocal

rem 104 �T�C�Y����w��Ȃ�
setlocal
set TESTNO=104
set LOGGER_LEVEL=INFO
set LOGGER_HANDLER=FILE
set LOGGER_FILE_OUTPUT="%TEST_TEMP_DIR_2%\%TESTNO%.log"
set LOGGER_FILE_ROTATE=SIZE
set LOGGER_FILE_ROTATE_MAXNUMBER=100
set LOGGER_FILE_ROTATE_MAXSIZE=
echo %TESTNO% Expected: info warn error fatal
copy "%TEST_DATA_DIR%\10kb.log" "%TEST_TEMP_DIR_2%\%TESTNO%.log"
call %TEST_TARGET_PATH% INFO "%TESTNO% OK info ���{��"
call %TEST_ASSERT_EQUALS% "%TESTNO%" 1 %ERRORLEVEL%
call %TEST_ASSERT_FILE_FIRST_LINE_EQUALS% "%TESTNO%" "xx34567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890" "%TEST_TEMP_DIR_2%\%TESTNO%.log"
call %TEST_ASSERT_FILE_NOT_EXISTS% "%TESTNO%" "%TEST_TEMP_DIR_2%\%TESTNO%.log.1"
endlocal

rem 105 �T�C�Y�����0
setlocal
set TESTNO=105
set LOGGER_LEVEL=INFO
set LOGGER_HANDLER=FILE
set LOGGER_FILE_OUTPUT="%TEST_TEMP_DIR_2%\%TESTNO%.log"
set LOGGER_FILE_ROTATE=SIZE
set LOGGER_FILE_ROTATE_MAXNUMBER=100
set LOGGER_FILE_ROTATE_MAXSIZE=0
echo %TESTNO% Expected: info warn error fatal
copy "%TEST_DATA_DIR%\10kb.log" "%TEST_TEMP_DIR_2%\%TESTNO%.log"
call %TEST_TARGET_PATH% INFO "%TESTNO% OK info ���{��"
call %TEST_ASSERT_EQUALS% "%TESTNO%" 1 %ERRORLEVEL%
call %TEST_ASSERT_FILE_FIRST_LINE_EQUALS% "%TESTNO%" "xx34567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890" "%TEST_TEMP_DIR_2%\%TESTNO%.log"
call %TEST_ASSERT_FILE_NOT_EXISTS% "%TESTNO%" "%TEST_TEMP_DIR_2%\%TESTNO%.log.1"
endlocal

rem 106 �T�C�Y�����1
setlocal
set TESTNO=106
set LOGGER_LEVEL=INFO
set LOGGER_HANDLER=FILE
set LOGGER_FILE_OUTPUT="%TEST_TEMP_DIR_2%\%TESTNO%.log"
set LOGGER_FILE_ROTATE=SIZE
set LOGGER_FILE_ROTATE_MAXNUMBER=100
set LOGGER_FILE_ROTATE_MAXSIZE=1
echo %TESTNO% Expected: info warn error fatal
copy "%TEST_DATA_DIR%\10kb.log" "%TEST_TEMP_DIR_2%\%TESTNO%.log"
call %TEST_TARGET_PATH% INFO "%TESTNO% OK info ���{��"
call %TEST_ASSERT_EQUALS% "%TESTNO%" 0 %ERRORLEVEL%
call %TEST_ASSERT_FILE_EXISTS% "%TESTNO%" "%TEST_TEMP_DIR_2%\%TESTNO%.log"
call %TEST_ASSERT_FILE_FIRST_LINE_EQUALS% "%TESTNO%" "xx34567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890" "%TEST_TEMP_DIR_2%\%TESTNO%.log.1"
endlocal

rem 107 �T�C�Y�����-1
setlocal
set TESTNO=107
set LOGGER_LEVEL=INFO
set LOGGER_HANDLER=FILE
set LOGGER_FILE_OUTPUT="%TEST_TEMP_DIR_2%\%TESTNO%.log"
set LOGGER_FILE_ROTATE=SIZE
set LOGGER_FILE_ROTATE_MAXNUMBER=100
set LOGGER_FILE_ROTATE_MAXSIZE=-1
echo %TESTNO% Expected: info warn error fatal
copy "%TEST_DATA_DIR%\10kb.log" "%TEST_TEMP_DIR_2%\%TESTNO%.log"
call %TEST_TARGET_PATH% INFO "%TESTNO% OK info ���{��"
call %TEST_ASSERT_EQUALS% "%TESTNO%" 1 %ERRORLEVEL%
call %TEST_ASSERT_FILE_FIRST_LINE_EQUALS% "%TESTNO%" "xx34567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890" "%TEST_TEMP_DIR_2%\%TESTNO%.log"
call %TEST_ASSERT_FILE_NOT_EXISTS% "%TESTNO%" "%TEST_TEMP_DIR_2%\%TESTNO%.log.1"
endlocal

rem 108 �o�b�N�A�b�v��������w��Ȃ�
setlocal
set TESTNO=108
set LOGGER_LEVEL=INFO
set LOGGER_HANDLER=FILE
set LOGGER_FILE_OUTPUT="%TEST_TEMP_DIR_2%\%TESTNO%.log"
set LOGGER_FILE_ROTATE=SIZE
set LOGGER_FILE_ROTATE_MAXNUMBER=
set LOGGER_FILE_ROTATE_MAXSIZE=10
echo %TESTNO% Expected: info warn error fatal
copy "%TEST_DATA_DIR%\10kb.log" "%TEST_TEMP_DIR_2%\%TESTNO%.log"
call %TEST_TARGET_PATH% INFO "%TESTNO% OK info ���{��"
call %TEST_ASSERT_EQUALS% "%TESTNO%" 1 %ERRORLEVEL%
call %TEST_ASSERT_FILE_FIRST_LINE_EQUALS% "%TESTNO%" "xx34567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890" "%TEST_TEMP_DIR_2%\%TESTNO%.log"
call %TEST_ASSERT_FILE_NOT_EXISTS% "%TESTNO%" "%TEST_TEMP_DIR_2%\%TESTNO%.log.1"
endlocal

rem 109 �o�b�N�A�b�v�������0
setlocal
set TESTNO=109
set LOGGER_LEVEL=INFO
set LOGGER_HANDLER=FILE
set LOGGER_FILE_OUTPUT="%TEST_TEMP_DIR_2%\%TESTNO%.log"
set LOGGER_FILE_ROTATE=SIZE
set LOGGER_FILE_ROTATE_MAXNUMBER=0
set LOGGER_FILE_ROTATE_MAXSIZE=10
echo %TESTNO% Expected: info warn error fatal
copy "%TEST_DATA_DIR%\10kb.log" "%TEST_TEMP_DIR_2%\%TESTNO%.log"
call %TEST_TARGET_PATH% INFO "%TESTNO% OK info ���{��"
call %TEST_ASSERT_EQUALS% "%TESTNO%" 1 %ERRORLEVEL%
call %TEST_ASSERT_FILE_FIRST_LINE_EQUALS% "%TESTNO%" "xx34567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890" "%TEST_TEMP_DIR_2%\%TESTNO%.log"
call %TEST_ASSERT_FILE_NOT_EXISTS% "%TESTNO%" "%TEST_TEMP_DIR_2%\%TESTNO%.log.1"
endlocal

rem 110 �o�b�N�A�b�v�������1
setlocal
set TESTNO=110
set LOGGER_LEVEL=INFO
set LOGGER_HANDLER=FILE
set LOGGER_FILE_OUTPUT="%TEST_TEMP_DIR_2%\%TESTNO%.log"
set LOGGER_FILE_ROTATE=SIZE
set LOGGER_FILE_ROTATE_MAXNUMBER=1
set LOGGER_FILE_ROTATE_MAXSIZE=10
echo %TESTNO% Expected: info warn error fatal
copy "%TEST_DATA_DIR%\10kb.log" "%TEST_TEMP_DIR_2%\%TESTNO%.log"
echo hoge>> "%TEST_TEMP_DIR_2%\%TESTNO%.log.1"
call %TEST_TARGET_PATH% INFO "%TESTNO% OK info ���{��"
call %TEST_ASSERT_EQUALS% "%TESTNO%" 0 %ERRORLEVEL%
call %TEST_ASSERT_FILE_EXISTS% "%TESTNO%" "%TEST_TEMP_DIR_2%\%TESTNO%.log"
call %TEST_ASSERT_FILE_FIRST_LINE_EQUALS% "%TESTNO%" "xx34567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890" "%TEST_TEMP_DIR_2%\%TESTNO%.log.1"
call %TEST_ASSERT_FILE_NOT_EXISTS% "%TESTNO%" "%TEST_TEMP_DIR_2%\%TESTNO%.log.2"
endlocal

rem 111 �o�b�N�A�b�v�������-1
setlocal
set TESTNO=111
set LOGGER_LEVEL=INFO
set LOGGER_HANDLER=FILE
set LOGGER_FILE_OUTPUT="%TEST_TEMP_DIR_2%\%TESTNO%.log"
set LOGGER_FILE_ROTATE=SIZE
set LOGGER_FILE_ROTATE_MAXNUMBER=-1
set LOGGER_FILE_ROTATE_MAXSIZE=10
echo %TESTNO% Expected: info warn error fatal
copy "%TEST_DATA_DIR%\10kb.log" "%TEST_TEMP_DIR_2%\%TESTNO%.log"
call %TEST_TARGET_PATH% INFO "%TESTNO% OK info ���{��"
call %TEST_ASSERT_EQUALS% "%TESTNO%" 1 %ERRORLEVEL%
call %TEST_ASSERT_FILE_FIRST_LINE_EQUALS% "%TESTNO%" "xx34567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890" "%TEST_TEMP_DIR_2%\%TESTNO%.log"
call %TEST_ASSERT_FILE_NOT_EXISTS% "%TESTNO%" "%TEST_TEMP_DIR_2%\%TESTNO%.log.1"
endlocal

rem 112 ���[�e�[�g���������w��
setlocal
set TESTNO=112
set LOGGER_LEVEL=INFO
set LOGGER_HANDLER=FILE
set LOGGER_FILE_OUTPUT="%TEST_TEMP_DIR_2%\%TESTNO%.log"
set LOGGER_FILE_ROTATE=
set LOGGER_FILE_ROTATE_MAXNUMBER=
set LOGGER_FILE_ROTATE_MAXSIZE=
echo %TESTNO% Expected: info warn error fatal
copy "%TEST_DATA_DIR%\10kb.log" "%TEST_TEMP_DIR_2%\%TESTNO%.log"
call %TEST_TARGET_PATH% trace "%TESTNO%-1 NG trace ���{��"
call %TEST_TARGET_PATH% Debug "%TESTNO%-2 NG debug ���{��"
call %TEST_TARGET_PATH% INFO "%TESTNO%-3 OK info ���{��"
call %TEST_TARGET_PATH% WARn "%TESTNO%-4 OK warn ���{��"
call %TEST_TARGET_PATH% error "%TESTNO%-5 OK error ���{��"
call %TEST_TARGET_PATH% fatal "%TESTNO%-6 OK fatal ���{��"
call %TEST_TARGET_PATH% hoge "%TESTNO%-7 NG hoge ���{��"
call %TEST_ASSERT_FILE_FIRST_LINE_EQUALS% "%TESTNO%" "xx34567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890" "%TEST_TEMP_DIR_2%\%TESTNO%.log"
call %TEST_ASSERT_FILE_NOT_EXISTS% "%TESTNO%" "%TEST_TEMP_DIR_2%\%TESTNO%.log.1"
endlocal

rd /s /q %TEST_TEMP_DIR_2%

endlocal
pause

exit /b