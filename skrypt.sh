#!/bin/bash
source plik_konfiguracyjny.conf

#skrypt
touch lock

czas=$(date)
echo $czas - "utworzenie pliku lock i rozpoczęcie działania skryptu">skrypt.log

tutaj_jestem=$(pwd)

tar -czvf kopia.tar.gz $tutaj_jestem

czas=$(date)
echo $czas - "utworzono kopie">>skrypt.log

cp kopia.tar.gz $katalog_z_kopiami

czas=$(date)
echo $czas - "wysłano utworzoną kopie do katalogu" $katalog_z_kopiami>>skrypt.log

cd $tutaj_jestem

czas=$(date)
echo $czas - "utworzenie lokalnej kopii zapasowej i wysłanie jej do katalogu" $katalog>>skrypt.log

czas=$(date)
echo $czas - "usunięcie pliku lock i zakończenie działania skryptu">>skrypt.log
rm lock
