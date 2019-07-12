set wifi_1="scanner-"
set wifi_2="scanner-"


netsh wlan show interfaces | find /i %wifi_1%
if errorlevel 1 (
   echo "yes"
   netsh wlan connect name=%wifi_1%

   timeout /T 2
   netsh wlan show interfaces
   netsh wlan show interfaces | find /i %wifi_1%
   if errorlevel 1 (
    cscript MessageBox.vbs "Wlan konnte nicht gewechselt werden"
   )
) else (
   echo "false"
   netsh wlan connect name=%wifi_2%

   timeout /T 2
   netsh wlan show interfaces
   netsh wlan show interfaces | find /i %wifi_2%
   if errorlevel 1 (
    cscript MessageBox.vbs "Wlan konnte nicht gewechselt werden"
   )
)
