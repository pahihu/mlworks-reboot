@echo off
@rem collect the arguments
@rem if DOS wasn't so poor we wouldn't have to do this
if "%1"=="" goto bad_args
set IMAGE=%1
shift
set MYARGS=
:startmyargs
if "%1"=="" goto endmyargs
set MYARGS=%MYARGS% %1
shift
goto startmyargs
:endmyargs
@rem The following line is replaced during installation 
 "C:\Programs\MLWorks\bin\main" -load %IMAGE% -pass aaaa %MYARGS% aaaa
goto end
:bad_args
@echo Bad arguments to mlimage-console
:end
