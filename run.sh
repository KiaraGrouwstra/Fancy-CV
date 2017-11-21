#!/bin/bash
# cd .
# biber cv
langs=(en nl)
for lang in "${langs[@]}"
do
  xelatex -jobname=cv-tycho-$lang -output-directory=build -interaction=nonstopmode "\newif\ifen\newif\ifnl\\${lang}true \input{cv}"
done
