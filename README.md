# IT-service-databases

Projekt dotyczy stworzenia systemu do obsługi awarii informatycznych dla sieci sklepów spożywczych działających na zasadzie franczyzy. System ma na celu usprawnienie zgłaszania, zarządzania oraz rozwiązywania problemów technicznych, które mogą pojawiać się w poszczególnych placówkach. Baza danych ma stanowić centralne repozytorium informacji o zgłoszeniach awarii, ich bieżącym statusie oraz kluczowych szczegółach związanych z procesem ich obsługi.

Użyta technologia:
- SQL
- Oracle SQL Developer
- Oracle Database 23 AI

<h2>Diagram związków encji</h2>

![Diagram związków encji](diagram_zwiazkow_encji.png)

<h2>Diagram encji</h2>

![Diagram encji](serwis-it.png)

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
