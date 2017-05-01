@setlocal enabledelayedexpansion
@echo off

rem ******************************************************************
rem * FileRotate.bat: ���[�e�[�g���� 
rem * %1: �t�@�C���̃t�H���_ C:\work\log
rem * %2: �t�@�C���� Error.log
rem * %3: �ő�̐��㐔
rem ******************************************************************
rem echo FileRotate.bat %1 %2 %3

rem �t�@�C�����Ɛ���ԍ��̋�؂蕶��
set DOT=.

for /l %%i in (%3,-1,1) do (
    set _FILE=%~2%DOT%%%i
    if exist !_FILE! (
        if %%i equ %3 (
            rem �t�@�C���̐���ԍ����ő�̏ꍇ�A�t�@�C�����폜����
            del /Q  "%~1\!_FILE!" >nul
        ) else (
            rem �t�@�C���̐���ԍ����ő�ł͂Ȃ��ꍇ�A������A�b�v����
            set /a _NEXT_COUNT=%%i+1 
            move /Y %~1\!_FILE! %~1\%~2%DOT%!_NEXT_COUNT! >nul
        )
    )
)

rem �ŐV�̃t�@�C���͐���ԍ���1��t����
set _FILE=%~2%
move /Y "%~1\!_FILE!" "%~1\%~2%DOT%1" >nul

endlocal
exit /b