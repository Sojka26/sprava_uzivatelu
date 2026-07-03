#!/bin/bash

# Soubor pro ukládání uživatelů a jejich práv
SOUBOR="uzivatele.txt"

# Vytvoření souboru pokud neexistuje
touch $SOUBOR

# -----------------------------
# 1. Přidání uživatele
# -----------------------------
pridat_uzivatele() {
    echo "Zadej jméno uživatele:"
    read jmeno

    echo "Vyber práva:"
    echo "1 - základní"
    echo "2 - vyšší"
    echo "3 - nejvyšší"
    read volba

    case $volba in
        1) prava="základní" ;;
        2) prava="vyšší" ;;
        3) prava="nejvyšší" ;;
        *) 
            echo "Neplatná volba!"
            return
            ;;
    esac

    # Kontrola existence uživatele
    if grep -q "^$jmeno:" $SOUBOR; then
        echo "Uživatel již existuje."
    else
        echo "$jmeno:$prava" >> $SOUBOR
        echo "Uživatel $jmeno byl přidán s právy: $prava"
    fi
}

# -----------------------------
# 2. Změna práv uživatele
# -----------------------------
zmenit_prava() {
    echo "Zadej jméno uživatele:"
    read jmeno

    if grep -q "^$jmeno:" $SOUBOR; then
        echo "Vyber nová práva:"
        echo "1 - základní"
        echo "2 - vyšší"
        echo "3 - nejvyšší"
        read volba

        case $volba in
            1) nova_prava="základní" ;;
            2) nova_prava="vyšší" ;;
            3) nova_prava="nejvyšší" ;;
            *)
                echo "Neplatná volba!"
                return
                ;;
        esac

        sed -i "s/^$jmeno:.*/$jmeno:$nova_prava/" $SOUBOR
        echo "Práva uživatele $jmeno byla změněna na: $nova_prava"
    else
        echo "Uživatel neexistuje."
    fi
}

# -----------------------------
# 3. Zobrazení všech uživatelů
# -----------------------------
zobrazit_uzivatele() {
    echo "Seznam uživatelů a jejich práv:"
    echo "--------------------------------"

    if [ -s $SOUBOR ]; then
        while IFS=: read -r jmeno prava
        do
            echo "Uživatel: $jmeno | Práva: $prava"
        done < $SOUBOR
    else
        echo "Žádní uživatelé nejsou evidováni."
    fi
}

# -----------------------------
# 4. Smazání uživatele
# -----------------------------
smazat_uzivatele() {
    echo "Zadej jméno uživatele ke smazání:"
    read jmeno

    if grep -q "^$jmeno:" $SOUBOR; then
        sed -i "/^$jmeno:/d" $SOUBOR
        echo "Uživatel $jmeno byl odstraněn."
    else
        echo "Uživatel neexistuje."
    fi
}

# -----------------------------
# Hlavní menu
# -----------------------------
while true
do
    echo ""
    echo "===== SPRÁVA UŽIVATELŮ ====="
    echo "1 - Přidat uživatele"
    echo "2 - Změnit práva uživatele"
    echo "3 - Zobrazit všechny uživatele"
    echo "4 - Smazat uživatele"
    echo "5 - Konec"
    echo "Vyber možnost:"
    read menu

    case $menu in
        1) pridat_uzivatele ;;
        2) zmenit_prava ;;
        3) zobrazit_uzivatele ;;
        4) smazat_uzivatele ;;
        5) 
            echo "Ukončuji program."
            exit 0
            ;;
        *)
            echo "Neplatná volba!"
            ;;
    esac
done