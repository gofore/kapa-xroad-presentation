#! /bin/bash

if [ -z "$1" ]
  then
    echo "No argument supplied"
    exit 1
fi

mkdir koulutukset/$1
cd koulutukset/$1
cp ../index.html ./
cp ../presentation.css ./
touch presentation.md
