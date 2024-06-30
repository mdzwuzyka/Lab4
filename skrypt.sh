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
    *)
        echo "Użycie: $0 --date | --logs [liczba]"
        ;;
esac