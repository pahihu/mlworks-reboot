@echo off
@rem collect the arguments
@rem if DOS wasn't so poor we wouldn't have to do this
if "%1"=="" goto bad_args
if not "%2" == "" goto bad_args
@rem the next line is replaced during installation
 "C:\Programs\MLWorks\bin\main-windows" -load %1 -pass aaaa -pervasive-dir "C:\Programs\MLWorks\pervasive" aaaa
goto end
:bad_args
@echo Bad arguments to mlimage-windows
:end
