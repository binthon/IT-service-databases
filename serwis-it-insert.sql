
INSERT INTO RodzajeRealizacji (typ, metoda, nazwa_kuriera, numer_listu_przewozowego) VALUES 
('Awaria', 'W', 'DHL', '12345-ABCDE'),
('Awaria', 'B', NULL, NULL),
('Przegląd serwisowy', 'B', NULL, NULL),
('Wysyłka nowego kabla', 'W', 'FedEx', '98765-ZYXWV'),
('Dostawa części', 'W', 'UPS', 'PARTS-12345'),
('Wymiana komponentów', 'B', NULL, NULL);


INSERT INTO Priorytety (waga_naprawy, czas_na_wykonanie) VALUES 
('Krytyczny', INTERVAL '06:00:00' HOUR TO SECOND), 
('Wysoki', INTERVAL '12:00:00' HOUR TO SECOND), 
('Średni', INTERVAL '24:00:00' HOUR TO SECOND), 
('Niski', INTERVAL '72:00:00' HOUR TO SECOND); 

INSERT INTO Franczyzobiorcy (pesel, imię, nazwisko, telefon, email) VALUES 
('12345678901', 'Jan', 'Kowalski', '123456789', 'jan.kowalski@example.com'),
('23456789012', 'Anna', 'Nowak', '987654321', 'anna.nowak@example.com'),
('34567890123', 'Piotr', 'Wiśniewski', '567891234', 'piotr.wisniewski@example.com'),
('45678901234', 'Katarzyna', 'Zielińska', '345678901', 'katarzyna.zielinska@example.com'),
('56789012345', 'Tomasz', 'Adamski', '456789012', 'tomasz.adamski@example.com');

INSERT INTO Sklepy (id_sklepu, miasto, kod_pocztowy, adres, pesel_franczyzobiorcy) VALUES 
(1, 'Warszawa', '00-001', 'ul. Krótka 1', '12345678901'), 
(2, 'Kraków', '30-002', 'ul. Długa 10', '23456789012'), 
(3, 'Gdańsk', '80-003', 'ul. Zielona 5', '34567890123'),
(4, 'Poznań', '60-001', 'ul. Jasna 12', '45678901234'),
(5, 'Łódź', '90-002', 'ul. Szeroka 8', '56789012345');

INSERT INTO Serwisanci (pesel, imię, nazwisko, telefon, email) VALUES 
('45678901234', 'Marek', 'Lewandowski', '432156789', 'marek.lewandowski@example.com'), 
('56789012345', 'Ewa', 'Kowalczyk', '678901234', 'ewa.kowalczyk@example.com'), 
('67890123456', 'Tomasz', 'Nowicki', '789012345', 'tomasz.nowicki@example.com'),
('78901234567', 'Michał', 'Wiśniewski', '567890123', 'michal.wisniewski@example.com'),
('89012345678', 'Karolina', 'Kowalczyk', '678901254', 'karolina.kowalczyk@example.com');

INSERT INTO Sprzęt_IT (nr_seryjny, nazwa_urządzenia, dysk, przeznaczenie, ilość_ramu, rozdzielczość, czy_dotyk, rodzaj, id_sklepu) VALUES
('SN12345', 'Komputer', 'SSD 512GB', 'Biuro', 16, NULL, NULL, NULL, 1), 
('SN67890', 'Monitor', NULL, NULL, NULL, '1920x1080', 'T', NULL, 2), 
('SN11111', 'Drukarka', NULL, NULL, NULL, NULL, NULL, 'fiskalna', 3),
('SN22222', 'Komputer', 'HDD 1TB', 'zapleczowy', 32, NULL, NULL, NULL, 1),
('SN33333', 'Komputer', 'SSD 256GB', 'kasowy', 8, NULL, NULL, NULL, 2),
('SN44444', 'Komputer', 'HDD 500GB', 'zapleczowy', 16, NULL, NULL, NULL, 3),
('SN55555', 'Monitor', NULL, NULL, NULL, '2560x1440', 'N', NULL, 1),
('SN66666', 'Monitor', NULL, NULL, NULL, '3840x2160', 'T', NULL, 2),
('SN77777', 'Drukarka', NULL, NULL, NULL, NULL, NULL, 'zapleczowa', 3),
('SN88888', 'Drukarka', NULL, NULL, NULL, NULL, NULL, 'fiskalna', 1),
('SN99999', 'Skaner', NULL, NULL, NULL, NULL, NULL, NULL, 1),
('SN00000', 'Skaner', NULL, NULL, NULL, NULL, NULL, NULL, 2),
('SN12121', 'Komputer', 'SSD 1TB', 'kasowy', 64, NULL, NULL, NULL, 3),
('SN34343', 'Monitor', NULL, NULL, NULL, '1280x1024', 'N', NULL, 2),
('SN56565', 'Drukarka', NULL, NULL, NULL, NULL, NULL, 'zapleczowa', 1),
('SN78787', 'Skaner', NULL, NULL, NULL, NULL, NULL, NULL, 3),
('SN44445', 'Komputer', 'SSD 1TB', 'Praca zdalna', 16, NULL, NULL, NULL, 4),
('SN55556', 'Monitor', NULL, NULL, NULL, '1920x1080', 'N', NULL, 5),
('SN66667', 'Drukarka', NULL, NULL, NULL, NULL, NULL, 'zapleczowa', 4),
('SN77778', 'Skaner', NULL, NULL, NULL, NULL, NULL, NULL, 5);


INSERT INTO Zgłoszenia (data_zgłoszenia, kategoria, opis_zgłoszenia, id_sklepu, id_rodzaju, priorytet, id_sprzętu) VALUES 
(SYSDATE, 'Komputer się nie uruchamiania', 'Od wczoraj nie działa komputer zapleczowy, czarny ekran', 1, 1, 'Krytyczny', 'SN12345'), 
(SYSDATE, 'Problem z matrycą monitora', 'Na ekranie widoczne są kolorowe pionowe paski', 2, 2, 'Wysoki', 'SN67890'), 
(SYSDATE, 'Drukarka przestała drukować', 'Drukarka wydaje niepokojące dźwięki', 3, 3, 'Średni', 'SN11111'),
(SYSDATE, 'Komputer zapleczowy jest głośny', 'Wiatrak przy procesorze głośno chodzi', 4, 1, 'Krytyczny', 'SN44445'),
(SYSDATE, 'Problem z ekranem', 'Monitor nie reaguje na włączenie', 5, 2, 'Krytyczny', 'SN55556'),
(SYSDATE, 'Skaner nie działa', 'Nie jest widoczna wiązka skanera', 5, 3, 'Średni', 'SN77778');


INSERT INTO Historie_zgłoszenia (status, data_aktualizacji, id_zgłoszenia, pesel_serwisanta) VALUES 
('Do zrobienia', SYSDATE, 1, NULL), 
('Przypisane', SYSDATE, 1, '45678901234'),
('Do zrobienia', SYSDATE, 2, NULL), 
('Przypisane', SYSDATE, 2, '56789012345'),
('Do zrobienia', SYSDATE, 3, NULL), 
('Przypisane', SYSDATE, 3, '67890123456'),
('Do zrobienia', SYSDATE, 4, NULL),
('Przypisane', SYSDATE, 4, '78901234567'),
('W trakcie realizacji', SYSDATE, 4, '78901234567'),
('Zakończone', SYSDATE, 4, '78901234567'),
('Do zrobienia', SYSDATE, 5, NULL),
('Przypisane', SYSDATE, 5, '89012345678'),
('W trakcie realizacji', SYSDATE, 5, '89012345678'),
('Do zrobienia', SYSDATE, 6, NULL),
('Przypisane', SYSDATE, 6, '89012345678'),
('Anulowane', SYSDATE, 6, NULL);
