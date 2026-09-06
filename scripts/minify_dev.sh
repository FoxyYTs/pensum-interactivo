#!/bin/bash


npx terser js/init.js ./js/malla.js ./js/ramo.js  ./js/homologatedRamo.js ./js/mallaHomologated.js ./js/mallaManager.js -c -m -o ./js/min1.js
echo ./js/min1.js
npx terser js/init.js ./js/malla.js ./js/ramo.js ./js/selectableRamo.js ./js/semesterManager.js ./js/priorix.js ./js/mallaEditor.js -c -m -o ./js/min2.js
echo ./js/min2.js
npx terser js/init.js ./js/malla.js ./js/ramo.js ./js/selectableRamo.js ./js/semesterManager.js ./js/generator.js ./js/mallaEditor.js -c -m -o ./js/min3.js
echo ./js/min3.js
npx terser js/init.js ./js/malla.js ./js/ramo.js ./js/customMalla.js -c -m -o ./js/min4.js
echo ./js/min4.js



# Archivo con la fecha del build, en milisegundos desde epoch (usado para
# mostrar "Última actualización" en el footer). Se lee como contenido de
# texto, no como header HTTP, para no depender de que el hosting preserve
# Last-Modified.
date +"%s000" | tee date.txt

# moves assets to root
cp ./assets/* ./