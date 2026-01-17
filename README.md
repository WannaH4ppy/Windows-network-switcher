⚠️ Windows Network Lab Switcher

Proste i skuteczne narzędzie (skrypty `.bat`) do szybkiego przełączania konfiguracji sieciowej w systemie Windows. 

Projekt powstał w celu automatyzacji pracy w środowisku laboratoryjnym, gdzie konieczne jest częste przełączanie się między siecią domową (Wi-Fi + DHCP) a izolowaną siecią lokalną na kablu (Static IP + Switch), która wymaga specyficznych ustawień zapory.

----------------------------------------------------------------------------------

⚠️ Funkcjonalności

Narzędzie składa się z dwóch skryptów realizujących przeciwstawne zadania:

1. Tryb Laboratoryjny (`LAB_START.bat`)
Ten skrypt przygotowuje komputer do pracy w izolowanej sieci (np. spiętej switchem bez routera):
**Wymusza uprawnienia Administratora** (automatyczne zapytanie UAC).
**Wyłącza kartę Wi-Fi**, aby uniknąć konfliktów routingu i "dwóch bram".
**Ustawia statyczny adres IP** na karcie Ethernet (domyślnie `192.168.1.10` lub `192.168.1.11`).
**Wyłącza Zaporę Windows (Firewall)** dla profilu sieci publicznej.
**Cel: Umożliwienie działania polecenia `PING` i komunikacji w sieci, którą Windows domyślnie blokuje jako "Niezidentyfikowaną/Publiczną".

2. Tryb Internet/Dom (`NORMALNY_NET.bat`)
Ten skrypt przywraca ustawienia do codziennego użytku:
**Włącza kartę Wi-Fi**.
**Przywraca pobieranie adresu IP z DHCP** na karcie Ethernet (automatycznie).
**Włącza z powrotem Zaporę Windows** dla sieci publicznych (dla bezpieczeństwa).

----------------------------------------------------------------------------------

⚠️ Konfiguracja i Edycja

Przed pierwszym użyciem należy dostosować skrypty do swojego sprzętu.

Jak edytować?
1. Kliknij na plik `.bat` prawym przyciskiem myszy.
2. Wybierz opcję **Edytuj** (lub "Otwórz za pomocą" -> Notatnik).

Co należy zmienić?

W obu plikach znajdź linijki odpowiedzialne za nazwę interfejsu oraz adres IP.

1. Nazwa Karty Sieciowej
Windows różnie nazywa karty (np. "Ethernet", "Ethernet 2", "Połączenie lokalne"). Sprawdź swoją nazwę w `Panel sterowania -> Połączenia sieciowe` i podmień ją w skrypcie:

```batch
:: Przykład zmiany nazwy z "Ethernet" na "Ethernet 2"
netsh interface ip set address name="Ethernet 2" ...


----------------------------------------------------------------------------------
⚠️ Ostrzeżenie

Skrypt LAB_START.bat wyłącza zaporę sieciową (Firewall) dla profilu publicznego.
Używaj tego trybu tylko w zaufanej sieci lokalnej (np. własny switch w domu).
Pamiętaj, aby zawsze użyć LAB_OFF.bat po zakończeniu pracy, aby przywrócić ochronę przed podłączeniem się do publicznego Wi-Fi (np. w kawiarni).

----------------------------------------------------------------------------------
⚠️ Wymagania

System operacyjny: Windows 10 / 11
Uprawnienia Administratora (skrypt sam o nie poprosi).

