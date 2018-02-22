@echo off

set PC_PATH="/cygdrive/c/users/dell/desktop"
set BACKUP_PATH="/cygdrive/d/research_source/Backup"
set USB_FOLDER=work
::USB_FOLDER without "/cygdrive/"
::USB_FOLDER store in the root of the USB Memory
::DO NOT ADD "" to USB_FOLDER

set PC_PATH_win="c:\users\dell\desktop"
set BACKUP_PATH_win="d:\research_source\Backup"

echo Select Mode
echo Mode 1 PC to USB Memory
echo Mode 2 USB Memory to PC
echo Mode 3 Backup
echo Mode 4 restore
set /p MODE=

if %MODE% EQU 3 (
	rsync -vaz --delete %PC_PATH%/%USB_FOLDER% %BACKUP_PATH%
	echo Backup %DATE% %TIME% >> %PC_PATH_win%\%USB_FOLDER%\log.txt
	echo Backup %DATE% %TIME% >> %BACKUP_PATH_win%\%USB_FOLDER%\log.txt
) else (
	if %MODE% EQU 4 (
	rsync -vaz --delete %BACKUP_PATH%/%USB_FOLDER%  %PC_PATH%
	echo Restore %DATE% %TIME% >> %PC_PATH_win%\%USB_FOLDER%\log.txt
	echo Restore %DATE% %TIME% >> %BACKUP_PATH_win%\%USB_FOLDER%\log.txt
	) else (
	echo The Label of USB Memory
	set /p DRIVE=

	if %MODE% EQU 1 (
		rsync -vaz --delete %PC_PATH%/%USB_FOLDER% /cygdrive/%DRIVE%
	echo PC to USB Memory %DATE% %TIME% >> %PC_PATH_win%\%USB_FOLDER%\log.txt
	echo PC to USB Memory %DATE% %TIME% >> %BACKUP_PATH_win%\%USB_FOLDER%\log.txt
	echo PC to USB Memory %DATE% %TIME% >> %DRIVE%:\%USB_FOLDER%\log.txt
	)

	if %MODE% EQU 2 (
		rsync -vaz --delete /cygdrive/%DRIVE%/%USB_FOLDER% %PC_PATH%
	echo USB Memory to PC %DATE% %TIME% >> %PC_PATH_win%\%USB_FOLDER%\log.txt
	echo USB Memory to PC %DATE% %TIME% >> %BACKUP_PATH_win%\%USB_FOLDER%\log.txt
	echo USB Memory to PC %DATE% %TIME% >> %DRIVE%:\%USB_FOLDER%\log.txt
	)
	)
)
