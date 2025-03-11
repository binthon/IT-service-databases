# IT-service-databases

Projekt dotyczy stworzenia systemu do obsługi awarii informatycznych dla sieci sklepów spożywczych działających na zasadzie franczyzy. System ma na celu usprawnienie zgłaszania, zarządzania oraz rozwiązywania problemów technicznych, które mogą pojawiać się w poszczególnych placówkach. Baza danych ma stanowić centralne repozytorium informacji o zgłoszeniach awarii, ich bieżącym statusie oraz kluczowych szczegółach związanych z procesem ich obsługi.

Użyta technologia:
- SQL
- Oracle SQL Developer
- Oracle Database 23 AI

<h2>Diagram związków encji</h2>

![Diagram związków encji](diagram_ERD.png)

<h2>Diagram encji</h2>

![Diagram encji](diagram_encji.png)

<h3>Opisz poszczególnych encji</h3>

1. Zgloszenia - przechowuje informacje o awariach zgłaszanych przez sklepy:
- id_zgloszenia – unikalny identyfikator zgłoszenia
- data_zgloszenia – data zgłoszenia problemu
- kategoria – rodzaj awarii 
- opis_zgloszenia – szczegółowy opis awarii
- id_sklepu – powiązany sklep
- id_rodzaju – rodzaj realizacji naprawy
- priorytet – priorytet zgłoszenia
- id_sprzetu – identyfikator uszkodzonego sprzętu


2. Historie_zgloszenia - przechowuje historię statusów zgłoszeń:
- status – aktualny status zgłoszenia
- data_aktualizacji – data zmiany statusu
- id_zgloszenia – powiązane zgłoszenie
- pesel_sewisanta – serwisant przypisany do zgłoszenia

3. Serwisanci - lista osób zajmujących się naprawami:
- pesel – unikalny identyfikator serwisanta
- imie, nazwisko – dane personalne
- telefon, email – kontakt do danego serwisanta

4. RodzajeRealizacji - sposób naprawy zgłoszonej awarii:
- id_rodzaju – unikalny identyfikator
- typ – sposób realizacji 
- metoda – metoda naprawy
- nazwa_kuriera – indetyfikator kuriera
- numer_listu_przewozowego – numer przesyłki kurierskiej

5. Priorytety - określa czas na wykonanie naprawy:
- waga_naprawy – poziom priorytetu zgłoszenia
- czas_na_wykonanie – maksymalny czas na naprawę

6. Sklepy - reprezentuje sklepy franczyzowe, które mogą zgłaszać awarie:
- id_sklepu – unikalny identyfikator sklepu
- miasto, adres, kod_pocztowy – dane adresowe
- pesel_franczyzobiorcy – właściciel sklepu (franczyzobiorca)

7.  Franczyzobiorcy - przechowuje dane właścicieli sklepów:
- pesel – unikalny identyfikator właściciela
- imie, nazwisko – dane personalne
- telefon, email – kontakt

8. Sprzęt IT - baza sprzętu komputerowego w sklepach:
- nr_seryjny – unikalny numer seryjny
- nazwa_urzadzenia – nazwa sprzętu 
- dysk, ilosc_ramu – parametry techniczne sprzętu
- czy_dotyk – czy sprzęt posiada ekran dotykowy 
- id_sklepu – sklep, w którym znajduje się sprzęt

<h3>Wdrożenie systemu</h3>

1. Pobranie silnika bazodanowego oraz SQL Developera
-  ```https://www.oracle.com/database/technologies/oracle-database-software-downloads.html#db_free```
-  ```https://www.oracle.com/database/sqldeveloper/technologies/download/``` - wybrano Windows 64-bit with JDK 17 included

2. Po wpakowaniau z zipa plików, wykorzystujemy plik ```setup```. Podczas instalacji konfigurje się hasło.
3. Urchomienie SQL Developera -> New Database Connection
4. Prawdopodobnie  podczas konfiguracji połączeń pojawią się błędy nasłuchu:
   - zmiana w pliku ```C:\app\{user}\product\23ai\dbhomeFree\network\admin\listener.ora```
Dodanie localhost:
```# Generated by Oracle configuration tools.

DEFAULT_SERVICE_LISTENER = FREE

LISTENER =
  (DESCRIPTION_LIST =
    (DESCRIPTION =
      (ADDRESS = (PROTOCOL = TCP)(HOST = 10.5.0.2)(PORT = 1521))
      (ADDRESS = (PROTOCOL = TCP)(HOST = localhost)(PORT = 1521))
      (ADDRESS = (PROTOCOL = IPC)(KEY = EXTPROC1521))
    )
  )

```
5. Po zmianie należy restartować usługi związane z Oracle Database:
   - ```OracleOraDB23Home1TNSListener```
   - ```OracleServiceFREE```
6. Następnie komendą ```lsnrctl status``` sprawdzić nasłuch na adresach z pliku listener.ora
7. Przyznanie uprawnień do FREEPDB1 dla usera SYSTEM
   - w cmd wpisz ```sqlplus system@localhost:1521/FREEPDB1```
   - następnie dodaj uprawnienia do ```FREEPDB1```
   Dodanie uprawinień:
   ```GRANT DBA TO SYSTEM;```
   ```GRANT CONNECT, RESOURCE TO SYSTEM;```

9. Połączenie:
   ![Połączenie](połączenie.png)
 Troubleshooting:
1. Brak możliwości zalogowania przez cmd do SYSTEM
   - ```sqlplus / as sysdba```
   - ```SELECT username, account_status FROM dba_users WHERE username = 'SYSTEM';``` jak LOCKED to: ```ALTER USER SYSTEM ACCOUNT UNLOCK;```




