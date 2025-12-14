#include <iostream>
#include <cmath>

using namespace std;

int main()
{
    cout<< "program do wyszukiwania najwiekszej liczby podanej przez uzytkownika"<< endl;
    cout << "podaj ile chcesz liczb" << endl;
    int n;
    cin >> n;
    cout << "podaj liczby do tablicy"<<endl;
    float tablica[n];
    for(int i=0; i<=n-1; i++)
 {
    cin >> tablica[i];
 }
 float x=tablica[0];
        for(int i=0; i<=n-1; i++)
 {
     if(x<tablica[i])
     {
        x=tablica[i];
     }
 }

 cout <<"najwieksza podana liczba to "<< x <<endl;
    return 0;
}
