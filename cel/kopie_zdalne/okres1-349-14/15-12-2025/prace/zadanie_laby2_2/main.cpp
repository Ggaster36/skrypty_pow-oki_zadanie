#include <iostream>
#include <cmath>
#include <string>
using namespace std;

int main()
{
    cout << "program do sprawdzania czy podane slowo jest palindromem" << endl;
    cout << "podaj slowo kture chcesz sprawdzic"<< endl;
    string slowo;
   getline(cin, slowo);
        int a;
    a=slowo.length();
    for(int i=0; i<a; i++)
    {

       if(slowo[i]==slowo[a-1-i])
        {
        }
        else
        {
            cout<< "podane slowo nie jest palindromem"<< endl;
            return 0;
        }
    }
    cout << "podane slowo jest palindromem"<< endl;
    return 0;
}


