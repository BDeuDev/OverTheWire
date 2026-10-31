#!/bin/bash

for dir in */; do
    
    [ -d "$dir" ] || continue
    
    echo "========================================"
    echo "Entrando al directorio: $dir"
    echo "========================================"

    cd "$dir"

    for archivo in *; do
        
        [ -f "$archivo" ] || continue
        
        echo " -> Archivo encontrado: $archivo"
        cat $archivo
	du -sh $archivo
    done

    cd ..

done
