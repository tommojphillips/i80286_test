@echo off
setlocal enabledelayedexpansion

if "%~1"=="/?" (
    goto :help
)

if "%~1"=="-?" (
    goto :help
)

if "%~1"=="?" (
    goto :help
)

rem Path to exe
set EXE=%~1

if "%EXE%"=="" (
    goto :help
)

rem Path to JSON tests
set TEST=%~2

if "%TEST%"=="" (
    goto :help
)

rem Starting file (if provided as argument)
set STARTFILE=%~3
set STARTED=0

echo EXE: %EXE%
echo TESTS PATH: %TEST%
echo STARTFILE: %STARTFILE%

if not "!STARTFILE!"=="" (
    echo Starting at !STARTFILE!
)

rem Loop through all JSON files in the current directory
for %%F in (%TEST%*.json) do (

    if "!STARTFILE!"=="" (
        set STARTED=1
    ) else (
        if /i "%%~nxF"=="%STARTFILE%" (
            set STARTED=1
        ) else (
            if !STARTED! == 0 (
                echo Skipping %%~nxF
            )
        )
    )

    if !STARTED! == 1 (
        echo Running  %%~nxF...
        %EXE% "%%F" %~4 %~5 %~6 %~7 %~8
        set "ERR=!ERRORLEVEL!"
        if not "!ERR!"=="0" (
            echo.
            echo ERROR: Test %%~nxF failed
            exit /b !ERR!
        )
    )
)

if not "!STARTFILE!"=="" (
    if !STARTED! == 0 (
        echo File not found: !STARTFILE!
    ) else (
        echo All tests passed. from !STARTFILE!
    )
) else (
    echo All tests passed.
)
endlocal            
exit /b 0

:help
    echo run_tests.bat ^<exe^> ^<test_dir^> ^[starting_test^]
    endlocal
    exit /b 0
