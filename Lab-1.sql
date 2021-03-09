/* Lab 1 */

-- ĆW.1.1
-- Napisz polecenie select, za pomocą którego uzyskasz tytuł i
-- numer książki

-- USE library
-- SELECT title AS "Tytuł", title_no AS "Numer tytułu"
-- FROM title 

-- ĆW.1.2
-- Napisz polecenie, które wybiera tytuł o numerze 10

-- USE library
-- SELECT title 
-- FROM title
-- WHERE title_no = 10

-- ĆW.1.3
-- Napisz polecenie, które wybiera numer czytelnika i karę dla tych
-- czytelników, którzy mają kary między $8.00 a $9.00 (z tablicy
-- loanhist)

-- USE library
-- SELECT member_no AS "Numer czytelnika z karą między 8 a 9$", fine_assessed AS "Kary"
-- FROM loanhist
-- WHERE fine_assessed BETWEEN 8 AND 9

-- ĆW.1.4
-- Napisz polecenie select, za pomocą którego uzyskasz numer
-- książki i autora z tablicy title dla wszystkich książek, których
-- autorem jest Charles Dickens lub Jane Austen

-- USE library
-- SELECT title_no, author
-- FROM title
-- WHERE author = 'Charles Dickens' OR author = 'Jane Austen'

-- ćw. 1.5
-- Napisz polecenie, które wybiera numer tytułu i tytuł dla
-- wszystkich rekordów zawierających string „adventures” gdzieś
-- w tytule.

-- USE library
-- SELECT title_no, title
-- FROM title
-- WHERE title LIKE '%adventures%'

-- ćw. 1.6
-- Napisz polecenie, które wybiera numer czytelnika, oraz
-- zapłaconą karę

-- USE library
-- SELECT member_no, fine_paid
-- FROM loanhist
-- WHERE fine_paid IS NOT NULL

-- ćw. 1.7
-- Napisz polecenie, które wybiera wszystkie unikalne pary miast i
-- stanów z tablicy adult.

-- USE library
-- SELECT DISTINCT city, state
-- FROM adult

-- Ćw. 2.1
-- Napisz polecenie, które wybiera wszystkie tytuły z tablicy title i
-- wyświetla je w porządku alfabetycznym.

-- USE library
-- SELECT title
-- FROM title
-- ORDER BY title

-- Ćw. 2.2
-- Napisz polecenie, które:
--  wybiera numer członka biblioteki (member_no), isbn książki
-- (isbn) i watrość naliczonej kary (fine_assessed) z tablicy
-- loanhist dla wszystkich wypożyczeń dla których naliczono
-- karę (wartość nie NULL w kolumnie fine_assessed)
--  stwórz kolumnę wyliczeniową zawierającą podwojoną
-- wartość kolumny fine_assessed
--  stwórz alias ‘double fine’ dla tej kolumny 

-- USE library
-- SELECT DISTINCT member_no "Numer użytkownika", isbn "ISBN", fine_assessed "Naliczona kara", fine_assessed * 2  "Double fine"
-- FROM loanhist
-- WHERE fine_assessed IS NOT NULL

-- Ćw. 2.3
-- Napisz polecenie, które
--  generuje pojedynczą kolumnę, która zawiera kolumny:
-- firstname (imię członka biblioteki), middleinitial (inicjał
-- drugiego imienia) i lastname (nazwisko) z tablicy member dla
-- wszystkich członków biblioteki, którzy nazywają się
-- Anderson
--  nazwij tak powstałą kolumnę email_name (użyj aliasu
-- email_name dla kolumny)
--  zmodyfikuj polecenie, tak by zwróciło „listę proponowanych
-- loginów e-mail” utworzonych przez połączenie imienia
-- członka biblioteki, z inicjałem drugiego imienia i pierwszymi
-- dwoma literami nazwiska (wszystko małymi małymi literami).
--  Wykorzystaj funkcję SUBSTRING do uzyskania części kolumny
-- znakowej oraz LOWER do zwrócenia wyniku małymi literami.
-- Wykorzystaj operator (+) do połączenia stringów.

-- USE library
-- SELECT REPLACE(LOWER(firstname + middleinitial + SUBSTRING(lastname, 1, 2)), ' ', '') "email_name"
-- FROM member
-- WHERE lastname = 'Anderson'

-- Ćw. 2.4.
-- Napisz polecenie, które wybiera title i title_no z tablicy title.
--  Wynikiem powinna być pojedyncza kolumna o formacie jak w
-- przykładzie poniżej:
-- The title is: Poems, title number 7
--  Czyli zapytanie powinno zwracać pojedynczą kolumnę w
-- oparciu o wyrażenie, które łączy 4 elementy:
-- stała znakowa ‘The title is:’
-- wartość kolumny title
-- stała znakowa ‘title number’
-- wartość kolumny title_no

-- USE library
-- SELECT CONCAT('The title is: ', title, ', title number ', title_no)
-- FROM title
