@echo off
setlocal

set "source_folder=D:\dataFile"
set "destination_folder=F:\dataFile"

call :syncFolders "%source_folder%" "%destination_folder%"

set "source_folder=F:\dataFile"
set "destination_folder=D:\dataFile"

call :syncFolders "%source_folder%" "%destination_folder%"

echo Sinkronisasi selesai.

endlocal
exit /b

:syncFolders
robocopy %1 %2 /E /ZB /COPY:DAT /XO /XD node_modules /MT:12
exit /b
