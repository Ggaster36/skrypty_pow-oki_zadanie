#include <iostream>
#include<cmath>

using namespace std;

float PoleTrojkata(float Ax,float Ay,float Bx, float By, float Cx, float Cy)
{
    float a;
    float b;
    float c;
    float p;
    float pole;

    a=sqrt(pow(Bx - Cx,2) + pow(By - Cy,2));
    b=sqrt(pow(Cx - Ax,2) + pow(Cy - Ay,2));
    c=sqrt(pow(Bx - Ax,2) + pow(By - Ay,2));

    p=(a+b+c)/2;

    pole=sqrt(p*((p-a)*(p-b)*(p-c)));
    return pole;
}

int main()
{
    cout << "program do obliczania pola trójk¹ta o wierzcho³kach w punktach A(Ax,Ay),B(Bx,By),C(Cx,Cy)" << endl;
    cout << "podaj Ax" << endl;
    float Ax;
    cin>>Ax;
    cout << "podaj Ay" << endl;
    float Ay;
    cin>>Ay;
    cout << "podaj Bx" << endl;
    float Bx;
    cin>>Bx;
    cout << "podaj By" << endl;
    float By;
    cin>>By;
    cout << "podaj Cx" << endl;
    float Cx;
    cin>>Cx;
    cout << "podaj Cy" << endl;
    float Cy;
    cin>>Cy;
    cout<<""<<endl;
    cout<<"pole danego trójk¹ta wynosi "<<PoleTrojkata(Ax,Ay,Bx,By,Cx,Cy)<<endl;
    return 0;
}
