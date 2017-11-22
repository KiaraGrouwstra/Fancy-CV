#!/bin/bash
# cd .
# biber cv
branch=`git rev-parse --abbrev-ref HEAD`
outdir="build/$branch"
langs=(en nl)
for lang in "${langs[@]}"
do
  mkdir $outdir
  xelatex -jobname=cv-tycho-$lang -output-directory=$outdir -interaction=nonstopmode "\newif\ifen\newif\ifnl\\${lang}true \input{cv}"
done
