Správa uživatelů – Bash skript


Tento Bash skript slouží k jednoduché správě uživatelů a jejich přístupových práv. Data jsou ukládána do textového souboru uzivatele.txt.

Funkce
Přidání nového uživatele
Změna práv existujícího uživatele
Zobrazení všech uživatelů
Smazání uživatele
Ukládání dat do souboru uzivatele.txt
Požadavky
Linux nebo jiný systém s Bash
Nainstalované nástroje grep a sed
Spuštění
Ulož skript, například jako sprava_uzivatelu.sh.
Nastav právo ke spuštění:
chmod +x sprava_uzivatelu.sh
Spusť skript:
chmod +x sprava_uzivatelu.sh
./sprava_uzivatelu.sh
Struktura dat

Soubor uzivatele.txt obsahuje záznamy ve formátu:

jmeno:prava

Příklad:

Jan:základní
Petr:vyšší
Eva:nejvyšší
Nabídka programu
===== SPRÁVA UŽIVATELŮ =====
1 - Přidat uživatele
2 - Změnit práva uživatele
3 - Zobrazit všechny uživatele
4 - Smazat uživatele
5 - Konec
Přístupová práva

Program podporuje tři úrovně oprávnění:

základní
vyšší
nejvyšší
