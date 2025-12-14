#!/bin/bash
source plik_konfiguracyjny.conf
if [[ -e okres.conf ]]; then
source okres.conf
fi

#skrypt
tutaj_jestem=$(pwd)

if [[ $aktywacja == nie ]]; then
touch lock
else
if [[ -e lock ]]; then
rm lock
fi
fi


if [[ -f $tutaj_jestem/lock ]]; then
echo $czas - "istnieje już plik lock zaniechanie działania skryptu">skrypt.log
else
touch lock

czas=$(date)
echo $czas - "utworzenie pliku lock i rozpoczęcie działania skryptu">skrypt.log

if [[ -e okres.conf ]]; then
if [[ $okres_typ = "D" ]]; then
data=`date +%j`
elif [[ $okres_typ = "T" ]]; then
data=`date +%V`
elif [[ $okres_typ = "M" ]]; then
data=`date +%m`
fi

if [[ $data -ge $koniec_okres ]]; then
cd $katalog_z_kopiami/kopie_zdalne
tar -czvf okres$numer_okresu-$start_okres$okres_typ-$koniec_okres$okres_typ.tgz $katalog_z_kopiami/kopie_zdalne/
cp okres$numer_okresu-$start_okres$okres_typ-$koniec_okres$okres_typ.tgz $magazyn
rm -r -f okres$numer_okresu-$start_okres$okres_typ-$koniec_okres$okres_typ
rm okres$numer_okresu-$start_okres$okres_typ-$koniec_okres$okres_typ.tgz 
cd $jestem_tutaj



if [[ $okres_typ = "D" ]]; then
liczba2=$(($numer_okresu + 1))
echo numer_okresu="$liczba2">okres.conf
echo start_okres="`date +%j`">>okres.conf
liczba=$(($(date +%j) +$okres))
echo koniec_okres="$liczba">>okres.conf

elif [[ $okres_typ = "T" ]]; then
liczba2=$(($numer_okresu + 1))
echo numer_okresu="$liczba2">okres.conf
echo start_okres="`date +%V`">>okres.conf
liczba=$(($(date +%V) +$okres))
echo koniec_okres="$liczba">>okres.conf

elif [[ $okres_typ = "M" ]]; then
liczba2=$(($numer_okresu + 1))
echo numer_okresu="$liczba2">okres.conf
echo start_okres="`date +%m`">>okres.conf
liczba=$(($(date +%m) +$okres))
echo koniec_okres="$liczba">>okres.conf
fi
fi

else
touch okres.conf
if [[ $okres_typ = "D" ]]; then
liczba2=1
echo numer_okresu="$liczba2">okres.conf
echo start_okres="`date +%j`">>okres.conf
liczba=$(($(date +%j) +$okres))
echo koniec_okres="$liczba">>okres.conf

elif [[ $okres_typ = "T" ]]; then
liczba2=1
echo numer_okresu="$liczba2">okres.conf
echo start_okres="`date +%V`">>okres.conf
liczba=$(($(date +%V) +$okres))
echo koniec_okres="$liczba">>okres.conf

elif [[ $okres_typ = "M" ]]; then
liczba2=1
echo numer_okresu="$liczba2">okres.conf
echo start_okres="`date +%m`">>okres.conf
liczba=$(($(date +%m) +$okres))
echo koniec_okres="$liczba">>okres.conf
fi
fi

source okres.conf
katalog=`date +%d-%B-%Y`

if [[ -x $katalog_z_kopiami/kopie_zdalne/okres$numer_okresu-$start_okres$okres_typ-$koniec_okres$okres_typ/$katalog ]]; then
cp -r $cel $katalog_z_kopiami/kopie_zdalne/okres$numer_okresu-$start_okres$okres_typ-$koniec_okres$okres_typ/$katalog
czas=$(date)
echo $czas - "1">>skrypt.log
elif [[ -x $katalog_z_kopiami/kopie_zdalne/okres$numer_okresu-$start_okres$okres_typ-$koniec_okres$okres_typ ]]; then
cd $katalog_z_kopiami/kopie_zdalne/okres$numer_okresu-$start_okres$okres_typ-$koniec_okres$okres_typ
mkdir `date +%d-%B-%Y`
cd $tutaj_jestem
cp -r $cel $katalog_z_kopiami/kopie_zdalne/okres$numer_okresu-$start_okres$okres_typ-$koniec_okres$okres_typ/$katalog
czas=$(date)
echo $czas - "1">>skrypt.log
elif [[ -x $katalog_z_kopiami/kopie_zdalne ]]; then
cd $katalog_z_kopiami/kopie_zdalne
mkdir okres$numer_okresu-$start_okres$okres_typ-$koniec_okres$okres_typ
cd  $katalog_z_kopiami/kopie_zdalne/okres$numer_okresu-$start_okres$okres_typ-$koniec_okres$okres_typ
mkdir `date +%d-%B-%Y`
cd $tutaj_jestem
cp -r $cel $katalog_z_kopiami/kopie_zdalne/okres$numer_okresu-$start_okres$okres_typ-$koniec_okres$okres_typ/$katalog
czas=$(date)
echo $czas - "3">>skrypt.log
else
cd $katalog_z_kopiami
mkdir kopie_zdalne
cd $katalog_z_kopiami/kopie_zdalne
mkdir okres$numer_okresu-$start_okres$okres_typ-$koniec_okres$okres_typ
cd $katalog_z_kopiami/kopie_zdalne/okres$numer_okresu-$start_okres$okres_typ-$koniec_okres$okres_typ
mkdir `date +%d-%B-%Y`
cd $tutaj_jestem
cp -r $cel $katalog_z_kopiami/kopie_zdalne/okres$numer_okresu-$start_okres$okres_typ-$koniec_okres$okres_typ/$katalog
czas=$(date)
echo $czas - "4">>skrypt.log
fi


cd $tutaj_jestem



czas=$(date)
echo $czas - "usunięcie pliku lock i zakończenie działania skryptu">>skrypt.log
rm lock
fi
