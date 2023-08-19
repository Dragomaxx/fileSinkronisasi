@echo off
set "source_folder=D:\dataFile"
set "destination_folder=F:\dataFile"

echo Menjalankan sinkronisasi eksternal...
xcopy "%source_folder%" "%destination_folder%" /s /e /d /i

echo Menjalankan sinkronisasi internal...
set "source_folder=F:\dataFile"
set "destination_folder=D:\dataFile"

xcopy "%source_folder%" "%destination_folder%" /s /e /d /i

echo Sinkronisasi selesai.
