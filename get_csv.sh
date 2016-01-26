#!/bin/bash

cd ./in/
wget http://www.rossvyaz.ru/docs/articles/Kody_ABC-3kh.csv -O - | iconv -f cp1251 -t utf8 -o Kody_ABC-3kh.csv
wget http://www.rossvyaz.ru/docs/articles/Kody_ABC-4kh.csv -O - | iconv -f cp1251 -t utf8 -o Kody_ABC-4kh.csv
wget http://www.rossvyaz.ru/docs/articles/Kody_ABC-8kh.csv -O - | iconv -f cp1251 -t utf8 -o Kody_ABC-8kh.csv
wget http://www.rossvyaz.ru/docs/articles/Kody_DEF-9kh.csv -O - | iconv -f cp1251 -t utf8 -o Kody_DEF-9kh.csv