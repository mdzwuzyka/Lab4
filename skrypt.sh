#!/bin/bash

show_date() {
    echo "Dzisiejsza data: $(date '+%Y-%m-%d')"
}

create_logs() {
    for i in {1..100}; do
        filename="log_$i.txt"
        echo "Numer pliku: $i" > "$filename"
        echo "Nazwa skryptu: $0" >> "$filename"
        echo "Data utworzenia: $(date '+%Y-%m-%d %H:%M:%S')" >> "$filename"
    done
    echo "Utworzono 100 plików log_x.txt"
}

# Sprawdzenie przekazanych argumentów
case "$1" in
    --date)
        show_date
        ;;
    --logs)
        create_logs
        ;;
    *)
        echo "Użycie: $0 --date | --logs"
        ;;
esac
