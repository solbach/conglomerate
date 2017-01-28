#!/bin/bash

echo "Extract 7z files and compress as ZIP"

for f in *; do
	filename=$(basename "${f}")
	filename="${filename%.7z}"
    echo "######### Processing File: ${filename}"
    
    echo "(1) Extract 7z"
    mkdir -p "../temp/${filename}"
    7z e "${f}" -o"../temp/${filename}"

    echo "(2) Compress ZIP"
    cd "../temp/${filename}"
    zip -r "../../ziped/${filename}.zip" ./*
    echo "(3) Clean Up" 
    cd "../../snes/"
    rm -rf "../temp/${filename}"   
done

echo ""
echo "Finished"