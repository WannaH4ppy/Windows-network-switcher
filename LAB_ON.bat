@echo off

:: sprawdzenie uprawnien, Jesli brak to uruchom ponownie jako admin.
net session >nul 2>&1
if %errorLevel% == 0 (
	goto :gotAdmin
) else (
	echo Prosze czekac, uzyskiwanie uprawnien admina...
	powershell -Command "Start-Process '%~0' -Verb RunAs"
)
:gotAdmin

echo Przelaczam na tryb LABORATORYJNY...

:: 1. Wylaczenie Wi-Fi (zeby nie robilo konfliktow)
netsh interface set interface "Wi-Fi" admin = disable

:: 2. Ustawienie stałego IP na kablu (dla PC koncowka .10, laptop .11)
netsh interface ip set address name="Ethernet" source=static addr=192.168.1.10 mask=255.255.255.0

:: 3. WYLACZENIE zapory sieciowej dla sieci publicznej (ping inaczej nie dziala)
netsh advfirewall set publicprofile state off

echo Gotowe! Wi-Fi wylaczone, IP na kablu ustawione na sztywno.
echo Zapora sieciowa Firewall zostala wylaczona dla sieci publicznych.
pause