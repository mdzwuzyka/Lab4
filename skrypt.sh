#!/bin/bash

# Sprawdzenie, czy argument '--date' został przekazany
if [ "$1" == "--date" ]; then
    # Wyświetlenie dzisiejszej daty
    echo "Dzisiejsza data: $(date '+%Y-%m-%d')"
fi
