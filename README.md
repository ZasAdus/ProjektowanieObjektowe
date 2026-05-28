<h1>Zadania z przedmiotu Projektowanie Obiektowe
Jeżeli chodzi o dostarczanie zadań na czas to można sie sugerować datami uploadu filmików na yt.
<h2>Zadanie 1 Sortowanie Bąbelkowe:<h2>
✅ 3.0 Procedura do generowania 50 losowych liczb od 0 do 100 [commit](https://github.com/ZasAdus/ProjektowanieObjektowe/commit/1d535ad93da1d0b8ec53b559b59442b545094c3d) <br>
✅ 3.5 Procedura do sortowania liczb [commit](https://github.com/ZasAdus/ProjektowanieObjektowe/commit/2040d35bb2541a3e4e4077676740a057a7224ae0)<br>
✅ 4.0 Dodanie parametrów do procedury losującej określającymi zakres losowania: od, do, ile [commit](https://github.com/ZasAdus/ProjektowanieObjektowe/commit/9b4b502212091884f18c74a9256fd37dfcc0dd40) <br>
❌ 4.5 5 testów jednostkowych testujące procedury <br>
✅ 5.0 Skrypt w bashu do uruchamiania aplikacji w Pascalu via docker [commit](https://github.com/ZasAdus/ProjektowanieObjektowe/commit/ee9fa8a75d3168e6bbf7fbb93e60a3493b8fad24)<br> 

<h2>Zadanie 2 Wzorce architektury:<h2>
✅ 3.0 Należy stworzyć jeden model z kontrolerem z produktami, zgodnie z CRUD (JSON) [filmik](https://youtu.be/q3eR8H344cs)<br>
❌ 3.5 Należy stworzyć skrypty do testów endpointów via curl (JSON)<br>
❌ 4.0 Należy stworzyć dwa dodatkowe kontrolery wraz z modelami  (JSON)<br>
❌ 4.5 Należy stworzyć widoki do wszystkich kontrolerów<br>
❌ 5.0 Stworzenie panelu administracyjnego<br> 

<h2> Zadanie 3 Wzorce kreacyjne:<h2>
Spring Boot (Kotlin)

✅ 3.0 Należy stworzyć jeden kontroler wraz z danymi wyświetlanymi z listy na endpoint’cie w formacie JSON - Kotlin + Spring Boot [filmik](https://youtu.be/N8_4V9y8H8U)<br>
❌ 3.5 Należy stworzyć klasę do autoryzacji (mock) jako Singleton w formie eager <br>
❌ 4.0 Należy obsłużyć dane autoryzacji przekazywane przez użytkownika <br>
❌ 4.5 Należy wstrzyknąć singleton do głównej klasy via @Autowired lub kontruktor (constructor injection)<br>
❌ 5.0 Obok wersji Eager do wyboru powinna być wersja Singletona w wersji lazy <br>

<h2>Zadanie 4 Wzorce strukturalne:<h2>
✅ 3.0 Należy stworzyć aplikację we frameworki echo w j. Go, która będzie miała kontroler Pogody, która pozwala na pobieranie danych o pogodzie (lub akcjach giełdowych) [filmik](https://youtu.be/ey2Z1S6Nppo)<br>
❌ 3.5 Należy stworzyć model Pogoda (lub Giełda) wykorzystując gorm, a dane załadować z listy przy uruchomieniu <br>
❌ 4.0 Należy stworzyć klasę proxy, która pobierze dane z serwisu zewnętrznego podczas zapytania do naszego kontrolera <br>
❌ 4.5 Należy zapisać pobrane dane z zewnątrz do bazy danych <br>
❌ 5.0 Należy rozszerzyć endpoint na więcej niż jedną lokalizację (Pogoda), lub akcje (Giełda) zwracając JSONa <br> 

<h2>Zadanie 5 Wzorce behawioralne:<h2>

✅ 3.0 W ramach projektu należy stworzyć komponenty Produkty oraz Płatności; komponent Produkty powinien pobierać listę produktów z aplikacji serwerowej, natomiast komponent Płatności powinien wysyłać dane płatności do aplikacji serwerowej. [filmik](https://youtu.be/7RMKuKq1zYk) <br>
❌ 3.5 Należy dodać komponent Koszyk wraz z osobnym widokiem; aplikacja powinna umożliwiać przechodzenie pomiędzy widokami przy użyciu routingu. <br>
❌ 4.0 Dane pomiędzy komponentami, takimi jak Produkty, Koszyk i Płatności, powinny być przekazywane z wykorzystaniem React hooks, np. useState, useEffect lub useContext. <br>
❌ 4.5 Należy przygotować konfigurację umożliwiającą uruchomienie aplikacji klienckiej oraz serwerowej w kontenerach Docker za pomocą docker-compose. <br>
❌ 5.0 Należy wykorzystać bibliotekę axios do komunikacji z serwerem oraz skonfigurować obsługę CORS, aby frontend mógł poprawnie komunikować się z backendem. <br>

<h2>Zadanie 6 Zapaszki<h2>
✅ 3.0 Należy skonfigurować husky + lint-staged uruchamianie lintowania przed commitem. [filmik](https://youtu.be/cwgaeatEFw8) <br>
❌ 3.5 Należy wyeliminować wszystkie bugi w kodzie w Sonarze (kod aplikacji klienckiej) <br>
❌ 4.0 Przeskanować oraz naprawić dowolny projekt open source narzędziem CodeQL https://codeql.github.com/ <br>
❌ 4.5 Należy usunąć problemy typu Code Smell w kodzie w Sonarze (kotlin, go, js). Należy dodać badge z  Sonara <br>
❌ 5.0 Skonfigurować Github Actions z linterem oraz CodeQL <br>

<h2>Zadanie 7 Vapor/Fluent/Swift<h2>
✅ 3.0 Należy stworzyć kontroler wraz z modele Produktów zgodny z CRUD w ORM Fluent [filmik](https://youtu.be/N_z9VFHsguY)<br>
❌ 3.5 Należy stworzyć szablony w Leaf<br>
❌ 4.0 Należy stworzyć drugi model oraz kontroler Kategorii wraz z relacją<br>
❌ 4.5 Należy wykorzystać Redis do przechowywania danych<br>
❌ 5.0 Wrzucić aplikację na heroku <br>


<h2>Zadanie 8 Selenium<h2>
✅ 3.0 Przetestuj formularz rejestracji użytkownika pod kątem walidacji
pól obowiązkowych oraz zachowania aplikacji po wprowadzeniu
niepoprawnego formatu adresu e-mail.  [filmik](https://youtu.be/bUNPKmk3RvA) <br>
❌ 3.5 Przeprowadź testy bezpieczeństwa typu Cross-Site Scripting (XSS),
próbując wstrzyknąć złośliwy kod JavaScript w aplikacji z Reactem  <br>
❌ 4.0 Przetestuj działanie koszyka zakupowego przy jednoczesnym otwarciu
aplikacji w kilku osobnych kartach tej samej przeglądarki, sprawdzając
spójność stanów zamówienia (aplikacja z zadania z React'em)  <br>
❌ 4.5 Do zadania z React'a należy dodać formularz logowania. Następnie
przeprowadź testy podatności na ataki typu Cross-Site Request Forgery
(CSRF), próbując wymusić nieautoryzowaną zmianę ustawień konta
spreparowanym linkiem, podczas gdy użytkownik posiada aktywną sesję w
innej karcie.  <br>
❌ 5.0 Stwórz scenariusz End-to-End w Playwright (minimum 50 asercji)  <br>

<h2>Zadanie 9 Chmura<h2>
✅ 3.0 Należy stworzyć odpowiednie instancje po stronie chmury na dockerze [filmik](https://youtu.be/VaNWarjqiUs)<br>
❌ 3.5 Stworzyć odpowiedni pipeline w Github Actions do budowania aplikacji<br>
❌ 4.0 Dodać notyfikację mailową o zbudowaniu aplikacji<br>
❌ 4.5 Dodać krok z deploymentem aplikacji serwerowej oraz klienckiej na chmurę<br>
❌ 5.0 Dodać uruchomienie regresyjnych testów automatycznych (funkcjonalnych) jako krok w Actions<br><h1>
