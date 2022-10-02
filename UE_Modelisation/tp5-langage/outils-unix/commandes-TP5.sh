#!/bin/sh
echo "Affichage des lignes contenant des nombres entiers naturels :"
egrep -e " (0|[1-9][0-9]*)$" exemple.txt
echo "Affichage des lignes contenant des nombres entiers relatifs :"
egrep -e " [+-](0|[1-9][0-9]*)$" exemple.txt
echo "Affichage des lignes contenant des nombres décimaux :"
egrep -e " -?(0|[1-9][0-9]*)[.]([0-9]+)" exemple.txt
echo "Affichage des lignes contenant des nombres rationnels :"
egrep -e " -?([1-9]+)[/]([1-9]+)$" exemple.txt
echo "Affichage des lignes contenant des nombres complexes rationnels :"
egrep -e " (-?([1-9]+)[/]([1-9]+)[+-]([1-9]+)[/]([1-9]+)[i])|(-?([1-9]+)[/]([1-9]+)[i])$" exemple.txt

