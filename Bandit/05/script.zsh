#!/bin/bash

for dir in */; do
    
    [ -d "$dir" ] || continue
    
    echo "========================================"
    echo "Dir: $dir"
    echo "========================================"

    cd "$dir"

    for archivo in *; do
        
        [ -f "$archivo" ] || continue
        
        echo " -> File found: $archivo"
        cat $archivo
	du -sh $archivo
    done

    cd ..

done
