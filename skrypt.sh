#!/bin/bash
czas="`date +%d-%m-%Y` `date +%T`"
if [[ -e skrypt.log ]]; then
echo $czas "rozpoczęcie działania skryptu">skrypt.log
tutaj_jestem=$(pwd)
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "sprawdzanie lokacji skryptu">>skrypt.log
else
touch skrypt.log
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "utowrzenie pliku skrypt.log gdzie są logowane działania skryptu">>skrypt.log
echo $czas "rozpoczęcie działania skryptu">skrypt.log
tutaj_jestem=$(pwd)
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "sprawdzanie lokacji skryptu">>skrypt.log
fi

source plik_konfiguracyjny.conf
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "połączenie z plikiem konfiguracyjnym">>skrypt.log

czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "sprawdzanie czy skrypt powinien się aktywować">>skrypt.log
if [[ $aktywacja == nie ]]; then
touch lock
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "utworzenie pliku lock aby zablokować skrypt od działania">>skrypt.log
else
if [[ -e lock ]]; then
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "usunięcie pliku lock i kontynuowanie skryptu">>skrypt.log
rm lock
fi
fi

czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "sprawdzenie czy plik konfiguracyjny okresu istnieje">>skrypt.log
if [[ -e okres.conf ]]; then
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "połączenie z plikiem konfiguracyjnym okresu">>skrypt.log
source okres.conf
else
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "plik konfiguracyjny okresu nie istnieje">>skrypt.log
fi



if [[ -f $tutaj_jestem/lock ]]; then
echo $czas "wykryto plik lock zatrzymanie skryptu">>skrypt.log
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "koniec działania skryptu">>skrypt.log
else
touch lock
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "utworzenie pliku lock aby skrypt nie nachodził na siebie i rozpoczęcie aktywacja skryptu">>skrypt.log

if [[ -e okres.conf ]]; then
if [[ $okres_typ = "D" ]]; then
data=$(date +%j)

elif [[ $okres_typ = "T" ]]; then
data=$(date +%j)

elif [[ $okres_typ = "M" ]]; then
data=$(date +%j)
fi
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "wykrycie typu czasu okresu i sprawdzenie bieżącej daty">>skrypt.log


if [[ -z $(ls -A $magazyn) ]]; then 
cd $tutaj_jestem
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "brak zaległych zarchiwizowanych kopii ontynuowanie skryptu">>skrypt.log
else
cd $tutaj_jestem
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "próba wysłania zaległej zarchiwizowanej kopii na serwer">>skrypt.log

ping $ipdom


if [ $? -eq 0 ]; then

cd $magazyn
scp $magazyn* "$host_docelowy@$ipdom:$katalog_docelowy"

if [ $? -eq 0 ]; then

rm -f * 

cd $tutaj_jestem
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "przesłanie archiwizowanej kopii do wybranego katalogu na serwerze">>skrypt.log
else
cd $tutaj_jestem
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "nieudało się przesłać zarchiwizowanych kopii przetrzymanie kopii do następnej próby">>skrypt.log
fi
else
cd $tutaj_jestem
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "nieudało się połączyć z serwerem zaprzestanie próby wysłania zarchiwizowanych kopii na serwer">>skrypt.log
fi
fi





if [[ $data -ge $koniec_okresl ]]; then
if [[ $rokp < $rokk  ]]; then
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "określony okres jeszcze nie minoł kontynuacja skryptu">>skrypt.log
else
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "określony okres minoł rozpoczynanie archiwizacji kopii i wysłanie ich na serwer">>skrypt.log

if [[ -x $katalog_z_kopiami/kopie_zdalne/okres$numer_okresu-$start_okres-$koniec_okres ]]; then

cd $katalog_z_kopiami/kopie_zdalne
tar -czvf okres$numer_okresu-$start_okres-$koniec_okres.tgz $katalog_z_kopiami/kopie_zdalne
kopia="okres$numer_okresu-$start_okres-$koniec_okres"
rm -r -f $kopia

cd $tutaj_jestem
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "zarchiwizowanie kopi $kopia">>skrypt.log

cd $katalog_z_kopiami/kopie_zdalne
cp okres$numer_okresu-$start_okres-$koniec_okres.tgz $magazyn
rm -f okres$numer_okresu-$start_okres-$koniec_okres.tgz

cd $tutaj_jestem
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "wysłanie archiwizowanej kopii do tymczasowego katalogu dla kopi archiwalnych">>skrypt.log

ping $ipdom


if [ $? -eq 0 ]; then

cd $magazyn
scp $magazyn* "$host_docelowy@$ipdom:$katalog_docelowy"

if [ $? -eq 0 ]; then

rm -f * 

cd $tutaj_jestem
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "przesłanie archiwizowanej kopii do wybranego katalogu na serwerze">>skrypt.log
else
cd $tutaj_jestem
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "nieudało się przesłać zarchiwizowanych kopii przetrzymanie kopii do następnej próby">>skrypt.log
fi
else
cd $tutaj_jestem
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "nieudało się połączyć z serwerem zaprzestanie próby wysłania zarchiwizowanych kopii na serwer">>skrypt.log
fi
else
cd $tutaj_jestem
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "nie ma kopi z żadnego okresu zatrzymanie archiwizacji i kontynuacja skryptu">>skrypt.log
fi





cd $tutaj_jestem
if [[ $okres_typ = "D" ]]; then
echo "#plik konfiguracyjny okresu jest potrzebny do poprawnego działania skryptu nie usuwaj i edytuj na własną odpowiedzialność">okres.conf
liczba2=$(($numer_okresu + 1))
echo numer_okresu="$liczba2">>okres.conf
echo start_okres=$(date +%Y-%m-%d)>>okres.conf
echo start_okresl="`date +%j`">>okres.conf
echo rokp="`date +%Y`">>okres.conf
echo rokk="`date +%Y`">>okres.conf
liczba=$(($(date +%j) + $okres))
echo koniec_okresl="$liczba">>okres.conf
dni=$(( $okres * 1 ))
echo koniec_okres=$(date -d "$start_okresl + $dni days" +'%Y-%m-%d')>>okres.conf

if [[ $liczba > 365 ]]; then
echo "#plik konfiguracyjny okresu jest potrzebny do poprawnego działania skryptu nie usuwaj i edytuj na własną odpowiedzialność">okres.conf
echo numer_okresu="$liczba2">>okres.conf
echo start_okres=$(date +%Y-%m-%d)>>okres.conf
echo start_okresl="`date +%j`">>okres.conf
echo rokp="`date +%Y`">>okres.conf
echo rokk=$(($(date +%Y) + 1))>>okres.conf
liczba3=$(((365 - $liczba) * -1))
echo koniec_okresl="$liczba3">>okres.conf
dni=$(( $okres * 1 ))
echo koniec_okres=$(date -d "$start_okresl + $dni days" +'%Y-%m-%d')>>okres.conf
fi

czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "zmienienie numeru okresu oraz ustawienie początku i końca nowego okresu">>skrypt.log

elif [[ $okres_typ = "T" ]]; then
echo "#plik konfiguracyjny okresu jest potrzebny do poprawnego działania skryptu nie usuwaj i edytuj na własną odpowiedzialność">okres.conf
liczba2=$(($numer_okresu + 1))
echo numer_okresu="$liczba2">>okres.conf
echo start_okres=$(date +%Y-%m-%d)>>okres.conf
echo start_okresl=`date +%j`>>okres.conf
echo rokp="`date +%Y`">>okres.conf
echo rokk="`date +%Y`">>okres.conf
liczba=$(($(date +%j) + $okres * 7))
echo "koniec_okresl=$liczba">>okres.conf
dni=$(( $okres * 7 ))
echo koniec_okres=$(date -d "$start_okresl + $dni days" +'%Y-%m-%d')>>okres.conf

if [[ $liczba > 365 ]]; then
echo "#plik konfiguracyjny okresu jest potrzebny do poprawnego działania skryptu nie usuwaj i edytuj na własną odpowiedzialność">okres.conf
echo numer_okresu="$liczba2">>okres.conf
echo start_okres=$(date +%Y-%m-%d)>>okres.conf
echo start_okresl="`date +%j`">>okres.conf
echo rokp="`date +%Y`">>okres.conf
echo rokk=$(($(date +%Y) + 1))>>okres.conf
liczba3=$(((365 - $liczba) * -1))
echo koniec_okresl="$liczba3">>okres.conf
dni=$(( $okres * 7 ))
echo koniec_okres=$(date -d "$start_okresl + $dni days" +'%Y-%m-%d')>>okres.conf
fi

czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "zmienienie numeru okresu oraz ustawienie początku i końca nowego okresu">>skrypt.log

elif [[ $okres_typ = "M" ]]; then
echo "#plik konfiguracyjny okresu jest potrzebny do poprawnego działania skryptu nie usuwaj i edytuj na własną odpowiedzialność">okres.conf
liczba2=$(($numer_okresu + 1))
echo numer_okresu="$liczba2">>okres.conf
echo start_okres=$(date +%Y-%m-%d)>>okres.conf
echo start_okresl="`date +%j`">>okres.conf
echo rokp="`date +%Y`">>okres.conf
echo rokk="`date +%Y`">>okres.conf
liczba=$(($(date +%j) + $okres * 30))
echo koniec_okresl="$liczba">>okres.conf
dni=$(( $okres * 30 ))
echo koniec_okres=$(date -d "$start_okresl + $dni days" +'%Y-%m-%d')>>okres.conf

if [[ $liczba > 365 ]]; then
echo "#plik konfiguracyjny okresu jest potrzebny do poprawnego działania skryptu nie usuwaj i edytuj na własną odpowiedzialność">okres.conf
echo numer_okresu="$liczba2">>okres.conf
echo start_okres=$(date +%Y-%m-%d)>>okres.conf
echo start_okresl="`date +%j`">>okres.conf
echo rokp="`date +%Y`">>okres.conf
echo rokk=$(($(date +%Y) + 1))>>okres.conf
liczba3=$(((365 - $liczba) * -1))
echo koniec_okresl="$liczba3">>okres.conf
dni=$(( $okres * 30 ))
echo koniec_okres=$(date -d "$start_okresl + $dni days" +'%Y-%m-%d')>>okres.conf
fi
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "zmienienie numeru okresu oraz ustawienie początku i końca nowego okresu">>skrypt.log
fi
fi
source okres.conf
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "ponowne połączenie się z plikiem konfiguracyjnym okresu">>skrypt.log
fi





else
touch okres.conf

czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "utworzenie pliku konfiguracyjnego okresu okres.conf">>skrypt.log

if [[ $okres_typ = "D" ]]; then
echo "#plik konfiguracyjny okresu jest potrzebny do poprawnego działania skryptu nie usuwaj i edytuj na własną odpowiedzialność">okres.conf
liczba2=1
echo numer_okresu="$liczba2">>okres.conf
echo start_okres=$(date +%Y-%m-%d)>>okres.conf
echo start_okresl="`date +%j`">>okres.conf
echo rokp="`date +%Y`">>okres.conf
echo rokk="`date +%Y`">>okres.conf
liczba=$(($(date +%j) + $okres))
echo koniec_okresl="$liczba">>okres.conf
dni=$(( $okres * 1 ))
echo koniec_okres=$(date -d "$start_okresl + $dni days" +'%Y-%m-%d')>>okres.conf

if [[ $liczba > 365 ]]; then
echo "#plik konfiguracyjny okresu jest potrzebny do poprawnego działania skryptu nie usuwaj i edytuj na własną odpowiedzialność">okres.conf
liczba2=1
echo numer_okresu="$liczba2">>okres.conf
echo start_okres=$(date +%Y-%m-%d)>>okres.conf
echo start_okresl="`date +%j`">>okres.conf
echo rokp="`date +%Y`">>okres.conf
echo rokk=$(($(date +%Y) + 1))>>okres.conf
liczba3=$(((365 - $liczba) * -1))
echo koniec_okresl="$liczba3">>okres.conf
dni=$(( $okres * 1 ))
echo koniec_okres=$(date -d "$start_okresl + $dni days" +'%Y-%m-%d')>>okres.conf
fi

czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "określnie okresu i zapisanie jego początku i końca w poliku konfiguracyjnym okresu">>skrypt.log

elif [[ $okres_typ = "T" ]]; then
echo "#plik konfiguracyjny okresu jest potrzebny do poprawnego działania skryptu nie usuwaj i edytuj na własną odpowiedzialność">okres.conf
liczba2=1
echo numer_okresu="$liczba2">>okres.conf
echo start_okres=$(date +%Y-%m-%d)>>okres.conf
echo start_okresl="`date +%j`">>okres.conf
echo rokp="`date +%Y`">>okres.conf
echo rokk="`date +%Y`">>okres.conf
liczba=$(($(date +%j) + $okres * 7))
echo koniec_okresl="$liczba">>okres.conf
dni=$(( $okres * 7 ))
echo koniec_okres=$(date -d "$start_okresl + $dni days" +'%Y-%m-%d')>>okres.conf

if [[ $liczba > 365 ]]; then
echo "#plik konfiguracyjny okresu jest potrzebny do poprawnego działania skryptu nie usuwaj i edytuj na własną odpowiedzialność">okres.conf
liczba2=1
echo numer_okresu="$liczba2">>okres.conf
echo start_okres=$(date +%Y-%m-%d)>>okres.conf
echo start_okresl="`date +%j`">>okres.conf
echo rokp="`date +%Y`">>okres.conf
echo rokk=$(($(date +%Y) + 1))>>okres.conf
liczba3=$(((365 - $liczba) * -1))
echo koniec_okresl="$liczba3">>okres.conf
dni=$(( $okres * 7 ))
echo koniec_okres=$(date -d "$start_okresl + $dni days" +'%Y-%m-%d')>>okres.conf
fi

czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "określnie okresu i zapisanie jego początku i końca w poliku konfiguracyjnym okresu">>skrypt.log

elif [[ $okres_typ = "M" ]]; then
echo "#plik konfiguracyjny okresu jest potrzebny do poprawnego działania skryptu nie usuwaj i edytuj na własną odpowiedzialność">okres.conf
liczba2=1
echo numer_okresu="$liczba2">>okres.conf
echo start_okres=$(date +%Y-%m-%d)>>okres.conf
echo start_okresl="`date +%j`">>okres.conf
echo rokp=$(date +%Y)>>okres.conf
echo rokk="`date +%Y`">>okres.conf
liczba=$(($(date +%j) + $okres * 30))
echo koniec_okresl="$liczba">>okres.conf
dni=$(( $okres * 30 ))
echo koniec_okres=$(date -d "$start_okresl + $dni days" +'%Y-%m-%d')>>okres.conf

if [[ $liczba > 365 ]]; then
echo "#plik konfiguracyjny okresu jest potrzebny do poprawnego działania skryptu nie usuwaj i edytuj na własną odpowiedzialność">okres.conf
liczba2=1
echo numer_okresu="$liczba2">>okres.conf
echo start_okres=$(date +%Y-%m-%d)>>okres.conf
echo start_okresl="`date +%j`">>okres.conf
echo rokp=$(date +%Y)>>okres.conf
echo rokk=$(($(date +%Y) + 1))>>okres.conf
liczba3=$(((365 - $liczba) * -1))
echo koniec_okresl="$liczba3">>okres.conf
dni=$(( $okres * 30 ))
echo koniec_okres=$(date -d "$start_okresl + $dni days" +'%Y-%m-%d')>>okres.conf
fi

czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "określnie okresu i zapisanie jego początku i końca w poliku konfiguracyjnym okresu">>skrypt.log

fi
source okres.conf

czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "połączenie z plikiem konfiguracyjnym okresu">>skrypt.log

fi


katalog=`date +%d-%m-%Y`

if [[ -x $katalog_z_kopiami/kopie_zdalne/okres$numer_okresu-$start_okres-$koniec_okres/$katalog ]]; then
cp -r $cel $katalog_z_kopiami/kopie_zdalne/okres$numer_okresu-$start_okres-$koniec_okres/$katalog
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "utworzenie kopii lokalnej i zapisanie jej w $katalog_z_kopiami/kopie_zdalne/okres$numer_okresu-$start_okres-$koniec_okres/$katalog">>skrypt.log
elif [[ -x $katalog_z_kopiami/kopie_zdalne/okres$numer_okresu-$start_okres-$koniec_okres ]]; then
cd $katalog_z_kopiami/kopie_zdalne/okres$numer_okresu-$start_okres-$koniec_okres
mkdir $katalog
cd $tutaj_jestem
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "utworzenie katalogu $katalog">>skrypt.log
cp -r $cel $katalog_z_kopiami/kopie_zdalne/okres$numer_okresu-$start_okres-$koniec_okres/$katalog
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "utworzenie kopii lokalnej i zapisanie jej w $katalog_z_kopiami/kopie_zdalne/okres$numer_okresu-$start_okres-$koniec_okres/$katalog">>skrypt.log
elif [[ -x $katalog_z_kopiami/kopie_zdalne ]]; then
cd $katalog_z_kopiami/kopie_zdalne
mkdir okres$numer_okresu-$start_okres-$koniec_okres
cd $tutaj_jestem

czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "utworzenie katalogu okres$numer_okresu-$start_okres-$koniec_okres">>skrypt.log

cd  $katalog_z_kopiami/kopie_zdalne/okres$numer_okresu-$start_okres-$koniec_okres
mkdir $katalog
cd $tutaj_jestem
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "utworzenie katalogu $katalog">>skrypt.log

cd $tutaj_jestem
cp -r $cel $katalog_z_kopiami/kopie_zdalne/okres$numer_okresu-$start_okres-$koniec_okres/$katalog
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "utworzenie kopii lokalnej i zapisanie jej w $katalog_z_kopiami/kopie_zdalne/okres$numer_okresu-$start_okres-$koniec_okres/$katalog">>skrypt.log
else
cd $katalog_z_kopiami
mkdir kopie_zdalne

cd $tutaj_jestem
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "utworzenie katalogu kopie_zdalne">>skrypt.log

cd $katalog_z_kopiami/kopie_zdalne
mkdir okres$numer_okresu-$start_okres-$koniec_okres

cd $tutaj_jestem
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "utworzenie katalogu okres$numer_okresu-$start_okres-$koniec_okres">>skrypt.log

cd $katalog_z_kopiami/kopie_zdalne/okres$numer_okresu-$start_okres-$koniec_okres
mkdir $katalog

cd $tutaj_jestem
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "utworzenie katalogu $katalog">>skrypt.log

cd $tutaj_jestem
cp -r $cel $katalog_z_kopiami/kopie_zdalne/okres$numer_okresu-$start_okres-$koniec_okres/$katalog
czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "utworzenie kopii lokalnej i zapisanie jej w $katalog_z_kopiami/kopie_zdalne/okres$numer_okresu-$start_okres-$koniec_okres/$katalog">>skrypt.log
fi


cd $tutaj_jestem




czas="`date +%d-%m-%Y` `date +%T`"
echo $czas "usunięcie pliku lock i zakończenie działania skryptu">>skrypt.log

log="skrypt-`date +%d-%m-%Y-%H-%M-%S`.log"

mv skrypt.log $log
cp $log $logi
rm -f $log


rm lock
fi