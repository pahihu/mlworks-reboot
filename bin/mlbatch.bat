@echo off
@rem collect the arguments
@rem if DOS wasn't so poor we wouldn't have to do this
set MYARGS=
:startmyargs
if "%1"=="" goto endmyargs
set MYARGS=%MYARGS% %1
shift
goto startmyargs
:endmyargs
 "C:\Programs\MLWorks\bin\main-windows" -load %1 -pass aaaa -pervasive-dir "C:\Programs\MLWorks\pervasive" aaaa
