Documentatie : Programare WEB
Student: Sescu Andrei 
IFR - Anul II

Descriere 

	Proiectul consta intr-un magazine online care iti ofer posibilitate sa vizualizezi produse si detaliile lor. Fiecare produs ofera posibilitatea de a fi cumparat, acesta este caracterizat prin detaliile: num, pret, imagini, descriere. Atasat unui produs se pot gasi review-urile care pot fi lasate si de cate utilizatori care sunt logati. Site-ul ofera posibilitatea logarii, ceea ce ofera utilizatorului capacitatea de a comanda un produs si de a lasa review-uri. 
Atunci cand utilizatorul adauga in cos produsele acesta poate manipula lista de produse intru-un modal care afiseaza detaliile si preturile produselor. Atunci cand un utilizator plaseaza o comanda ea este intordusa in istoricul de comenzi al utilizatorului. 
	Pe langa aceastea situl ofera liste si modalitati de avizualizare filtrata a lor. Printre acestea se pot gasi si paginile statice de Acasa, Livreare, Recenzii si Despre noi. 


Limbajele de programere utilizate 	
•	PHP - PHP: Hypertext Preprocessor
•	MySQL - MY Structured Query Language
•	JS - JavaScript 
•	HTML - HyperText Markup Language
•	CSS - Cascading Style Sheets

Framework-uri 	
•	Laravel - PHP
•	Bootstrap - CSS 
•	JQuery - JavaScript 

Interfata
	Interfata este sustinuta de HTML5 si CSS3 unele dintre cele mai vechi limbaje. Unul dinte marele ajutoare in a usura complxitate si dificultatile interfetei este utlizarea framworkului Boostrap care vine cu multe clase care vine cu şabloane de design HTML si CSS pentru orice, de la meniuri de navigaţie, butoane, imagini, fonturi, formulare şi alte componente de interfaţă, precum şi extensii JavaScript.
JavaScript este un limbaj de programare ușor, interpretat sau compilat in timp real, cu funcții de primă clasă.

Baza de date
	MySQL este un SGBD ce permite gestionarea mai multor baze de date, dar la un moment dat se lucrează cu o singură bază de date. Practic, fiecare bază de date reprezintă un director aflat pe hard-diskul serverului, fiecărei tabele din baza de date corespunzându-i unul sau mai multe fișiere.
	Un mare ajutor in comunicare cu Baza de Date si este Laravel care include Eloquent, un mapor relațional obiect (ORM) care face plăcută interacțiunea cu baza de date.

Server
	PHP este un limbaj de script pentru server și un instrument puternic pentru realizarea de pagini web dinamice și interactive. PHP este o alternativă larg utilizată, gratuită și eficientă la concurenți, cum ar fi ASP-ul Microsoft. PHP 7 este cea mai recentă versiune stabilă. In dezvoltare acestui proiect am folosti Laravel 8 care este un framwork PHP acesta ofera multe avantaje in dezvoltarea unui proiect usurand modul dezvoltarea proiectului prin pachete si clase care faciliteaza dezvotarea.


Instalare 
Pentru rularea sa in development se poate folosi Homeastead acesta vine preinstalat cu toate pachetele necesare si puteti gasi instructiunile aici: https://laravel.com/docs/8.x/homestead 

Pentru a folosi Laravel 8 serverul necesita urmatoarele extensii:
•	PHP >= 7.3
•	BCMath PHP Extension
•	Ctype PHP Extension
•	Fileinfo PHP Extension
•	JSON PHP Extension
•	Mbstring PHP Extension
•	OpenSSL PHP Extension
•	PDO PHP Extension
•	Tokenizer PHP Extension
•	XML PHP Extension	
Apoi trebuie facuta configuratia serverului pentru Nginx, Apache sau serviciul folosit. 
Urmatorul pas este clonarea proiectului de la sursa https://github.com/sescu10/shop-pweb.git  , urmeaza sa mergem in baza proiectului si cream o copie la fisierul .env.example, copie pe care o vom denumi .env . 
	In acest fisier .env se gasesc inforamtiile de acesare a bazei de date, ai va trebui sa fie modificate numele bazei de date cu cel creat de dumneavoastra si intoduse user-ul si parola perntru accesarea acestei baze de date. 
	Urmeaza sa rulam cateva comenzi pentru a instala pachetele necesare si a seta informatile demo.

•	composer install – aceasta comanda va instala pachetele necesare pentru Laravel
•	artisan migrate – aceasta va crea tabele si coloanele necesare pentru proiect
•	artisan db:seed – aceasta comanda va popular tabele cu informatiile demo ca site-ul sa nu fie gol. Aceasta va genera un useri, produse si recenzii.
•	npm install – Laravel foloseste npm pentru a administra pachete css si js iar aceasta va instala aceste pachete
•	npm run-watch – va lua aceste pachete si va generea fisierele css si js care pot fi interpretate de browser

De trebuie setat pe calc in hosts ip-ul pentru server si url-ul la care se va gasi site-ul. Site-ul are utilizatorul: sescu.andrei@yahoo.com si parola: 123456 dupa ce va logati puteti accesa toate functionalitatile site-ului.
