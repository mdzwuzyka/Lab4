#!/bin/bash

show_date() {
    echo "Dzisiejsza data: $(date '+%Y-%m-%d')"
}

create_logs() {
    local num=$1
    for (( i=1; i<=$num; i++ )); do
        filename="log_$i.txt"
        echo "Numer pliku: $i" > "$filename"
        echo "Nazwa skryptu: $0" >> "$filename"
        echo "Data utworzenia: $(date '+%Y-%m-%d %H:%M:%S')" >> "$filename"
    done
    echo "Utworzono $num plików log_x.txt"
}

show_help() {
    echo "Użycie: $0 --date | --logs [liczba] | --help"
    echo "--date     : Wyświetla dzisiejszą datę."
    echo "--logs [N] : Tworzy N plików logowych, gdzie N jest liczbą całkowitą. Domyślnie N=100."
    echo "--help     : Wyświetla dostępne opcje."
}

# Sprawdzenie przekazanych argumentów
case "$1" in
    --date)
        show_date
        ;;
    --logs)
      if [ $# -eq 2 ]; then
            create_logs "$2"
        else
            create_logs 100
      fi
      ;;
    --help)
        show_help
        ;;
    *)
        echo "Użycie: $0 --date | --logs [liczba]"
        ;;
esac