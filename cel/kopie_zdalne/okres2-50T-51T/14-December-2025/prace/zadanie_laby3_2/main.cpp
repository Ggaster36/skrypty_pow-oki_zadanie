#include <iostream>
#include<cmath>

using namespace std;
bool CzyLezaNaProstej(float Ax,float Ay,float Bx, float By, float Cx, float Cy)
{
float AB;
float BC;
float AC;

AB=sqrt(pow(Bx - Ax,2) + pow(By - Ay,2));
BC=sqrt(pow(Cx - Bx,2) + pow(Cy - By,2));
AC=sqrt(pow(Cx - Ax,2) + pow(Cy - Ay,2));

if (BC>AC,BC>AB)
{
    if (BC == AB+AC)
    {
       return 1;
    }
    else
    {
        return 0;
    }
}

if (AC>AB,AC>BC)
{
    if (AC == AB+BC)
    {
       return 1;
    }
    else
    {
        return 0;
    }
}

if (AB>BC,AB>AC)
{
    if (AB == AC+BC)
    {
       return 1;
    }
    else
    {
        return 0;
    }
}
return 0;
}

int main()
{
    cout<< "Program do sprawdzania czy trzy punkty A(Ax,Ay),B(Bx,By),C(Cx,Cy) le¿¹ na tej samej prostej "<<endl;
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
        if (CzyLezaNaProstej(Ax,Ay,Bx,By,Cx,Cy)==1)
        {
            cout<<"Punkty A(Ax,Ay),B(Bx,By),C(Cx,Cy) le¿¹ na tej samej prostej"<<endl;
        }
        else
        {
            cout<<"Punkty A(Ax,Ay),B(Bx,By),C(Cx,Cy) nie le¿¹ na tej samej prostej"<<endl;
        }
    return 0;
}
