@echo off
:: ==================================================
:: PIXEL EMERGENCY MENU + BACKUP COMPLETO
:: Versione definitiva con istruzioni e Pikachu
:: ==================================================

:: --- Pikachu ASCII di benvenuto ---
echo.
echo      (\__/)
echo      (o^-^)
echo     z(_(")(")   BENVENUTO NEL MENU DI EMERGENZA PIXEL
echo.
timeout /t 3 >nul
echo ==========================================
echo ATTENZIONE:
echo - Il telefono deve essere gia' autorizzato per ADB su questo PC.
echo - Il Debug USB deve essere attivo.
echo - Per copiare il contenuto (Download, DCIM, WhatsApp...), il telefono deve essere in soft lock, non hard lock.
echo - Per visualizzare lo schermo con scrcpy, puo' anche essere in hard lock.
echo ==========================================
echo.
timeout /t 1 >nul
cd /d ".\platform-tools"

:MENU
echo.
echo ==========================================
echo            PIXEL EMERGENCY MENU
echo ==========================================
echo Scegli un'operazione:
echo 1 - Accendi il display (wake)
echo 2 - Copia cartelle principali sul PC
echo 3 - Avvia scrcpy (controllo remoto)
echo 4 - Esci
echo.
set /p choice=Inserisci numero e premi INVIO: 

if "%choice%"=="1" goto ACCENDI_DISPLAY
if "%choice%"=="2" goto COPIA_TUTTO
if "%choice%"=="3" goto AVVIA_SCRCPY
if "%choice%"=="4" goto END
echo Scelta non valida. Riprova.
echo.
goto MENU

:ACCENDI_DISPLAY
echo ------------------------------------------
echo Accendo lo schermo del telefono...
adb shell input keyevent 26
timeout /t 1 >nul
echo Fatto! Lo schermo dovrebbe essere sveglio.
echo Nota: se il telefono era in hard lock, il display si accende ma non si sblocca automaticamente.
echo ------------------------------------------
goto MENU

:COPIA_TUTTO
echo ------------------------------------------
echo Copio tutte le cartelle principali sul PC...
set BACKUPFOLDER="%~dp0PixelBackup_%date:~6,4%%date:~3,2%%date:~0,2%"
mkdir %BACKUPFOLDER%

echo Copio Download...
adb pull "/sdcard/Download" %BACKUPFOLDER%\Download

echo Copio DCIM...
adb pull "/sdcard/DCIM" %BACKUPFOLDER%\DCIM

echo Copio Movies...
adb pull "/sdcard/Movies" %BACKUPFOLDER%\Movies

echo Copio Pictures...
adb pull "/sdcard/Pictures" %BACKUPFOLDER%\Pictures

echo Copio WhatsApp Images...
adb pull "/sdcard/Android/media/com.whatsapp/WhatsApp/Media/WhatsApp Images" %BACKUPFOLDER%\WhatsApp_Images

echo Copio WhatsApp Video...
adb pull "/sdcard/Android/media/com.whatsapp/WhatsApp/Media/WhatsApp Video" %BACKUPFOLDER%\WhatsApp_Video

echo Copio WhatsApp Lite Images...
adb pull "/sdcard/Android/media/com.whatsapp.litex/WhatsApp/Media/WhatsApp Images" %BACKUPFOLDER%\WhatsAppLite_Images

echo Copio WhatsApp Lite Video...
adb pull "/sdcard/Android/media/com.whatsapp.litex/WhatsApp/Media/WhatsApp Video" %BACKUPFOLDER%\WhatsAppLite_Video

echo ------------------------------------------
echo Tutte le cartelle principali copiate con successo!
echo I file sono stati salvati in: %BACKUPFOLDER%
echo Nota: il telefono deve essere in soft lock per copiare i dati correttamente.
echo ------------------------------------------
goto MENU

:AVVIA_SCRCPY
echo ------------------------------------------
echo Avvio scrcpy per controllo remoto del telefono...
cd /d ".\scrcpy-win64"
scrcpy.exe --stay-awake
echo ------------------------------------------
goto MENU

:END
echo ------------------------------------------
echo Uscita dallo script. Grazie per aver usato il menu di emergenza Pixel!
echo ------------------------------------------
pause
