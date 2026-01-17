@echo off

:: sprawdzenie uprawnien, Jesli brak to uruchom ponownie jako admin.
net session >nul 2>&1
if %errorLevel% == 0 (
	goto :gotAdmin
) else (
	echo Prosze czekac, uzyskiwanie uprawnien admina...
	powershell -Command "Start-Process '%~0' -Verb RunAs"
	exit
)
:gotAdmin

echo Przywracam INTERNET...

:: 1. Wlaczam Wi-Fi
netsh interface set interface "Wi-Fi" admin = enable

:: 2. Ustawienie IP na automatyczne na kablu(DHCP)
netsh interface ip set address "Ethernet" dhcp

:: 3. WLACZENIE zapory sieciowej dla sieci publicznych 
netsh advfirewall set publicprofile state on

echo Gotowe! Wi-Fi dziala, kabel ustawiony na automat.
echo Zapora sieciowa Firewall zostala wlaczona dla sieci publicznych.
pause
