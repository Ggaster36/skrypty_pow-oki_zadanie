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
    int program=2;
    int menu=1;
    int kontrola;
    float Ax;
    float Ay;
    float Bx;
    float By;
    float Cx;
    float Cy;
    while(program>1)
    {
        if(menu==1)
        {
            cout<<"-----------------------------------------------------------"<<endl;
            cout<<"Witaj w DumbMenu"<<endl;
            cout<<"wybierz opcje któr¹ chcesz:"<<endl;
            cout<<"wpisz 1 aby podaæ nowe punkty A(Ax,Ay),B(Bx,By),C(Cx,Cy)"<<endl;
            cout<<"wpisz 2 aby zakoñczyæ program"<<endl;
            cout<<"-----------------------------------------------------------"<<endl;
            cin>>kontrola;
            switch(kontrola)
            {
            case 1:
                cout<<"podaj nowe punkty A(Ax,Ay),B(Bx,By),C(Cx,Cy)"<<endl;
                cout<<"podaj Ax"<<endl;
                cin>>Ax;
                cout<<"podaj Ay"<<endl;
                cin>>Ay;
                cout<<"podaj Bx"<<endl;
                cin>>Bx;
                cout<<"podaj By"<<endl;
                cin>>By;
                cout<<"podaj Cx"<<endl;
                cin>>Cx;
                cout<<"podaj Cy"<<endl;
                cin>>Cy;
                cout<<endl;
                cout<<"nowe punkty zosta³y wpisane"<<endl;
                cout<<endl;
                menu=3;
                break;
            case 2:
                cout<<"wy³¹czanie programu"<<endl;
                program=0;
                break;
            default:
                cout<<endl;
                cout<<"nie ma takiej opcji wybierz jedn¹ z istniej¹cych opcji"<<endl;
                cout<<endl;
                menu=2;
            }
        }

          if(menu==2)
        {
            cout<<"-----------------------------------------------------------"<<endl;
            cout<<"wybierz opcje któr¹ chcesz:"<<endl;
            cout<<"wpisz 1 aby podaæ nowe punkty A(Ax,Ay),B(Bx,By),C(Cx,Cy)"<<endl;
            cout<<"wpisz 2 aby zakoñczyæ program"<<endl;
            cout<<"-----------------------------------------------------------"<<endl;
            cin>>kontrola;
            switch(kontrola)
            {
            case 1:
                cout<<"podaj nowe punkty A(Ax,Ay),B(Bx,By),C(Cx,Cy)"<<endl;
                 cout<<"podaj Ax"<<endl;
                cin>>Ax;
                cout<<"podaj Ay"<<endl;
                cin>>Ay;
                cout<<"podaj Bx"<<endl;
                cin>>Bx;
                cout<<"podaj By"<<endl;
                cin>>By;
                cout<<"podaj Cx"<<endl;
                cin>>Cx;
                cout<<"podaj Cy"<<endl;
                cin>>Cy;
                cout<<endl;
                cout<<"nowe punkty zosta³y wpisane"<<endl;
                cout<<endl;
                menu=3;
                break;
            case 2:
                cout<<"wy³¹czanie programu"<<endl;
                program=0;
                break;
            default:
                cout<<endl;
                cout<<"nie ma takiej opcji wybierz jedn¹ z istniej¹cych opcji"<<endl;
                cout<<endl;
                menu=2;
            }
        }

          if(menu==3)
        {
            cout<<"-----------------------------------------------------------"<<endl;
            cout<<"aktualne podane punkty A("<<Ax<<","<<Ay<<"),B("<<Bx<<","<<By<<"),C("<<Cx<<","<<Cy<<")"<<endl;
            cout<<"wybierz opcje któr¹ chcesz:"<<endl;
            cout<<"wpisz 1 aby podaæ nowe punkty A(Ax,Ay),B(Bx,By),C(Cx,Cy)"<<endl;
            cout<<"wpisz 2 aby sprawdziæ czy podane punkty s¹ na tej samej prostej"<<endl;
            cout<<"wpisz 3 aby zakoñczyæ program"<<endl;
            cout<<"-----------------------------------------------------------"<<endl;
            cin>>kontrola;
            switch(kontrola)
            {
            case 1:
                cout<<"podaj nowe punkty A(Ax,Ay),B(Bx,By),C(Cx,Cy)"<<endl;
                 cout<<"podaj Ax"<<endl;
                cin>>Ax;
                cout<<"podaj Ay"<<endl;
                cin>>Ay;
                cout<<"podaj Bx"<<endl;
                cin>>Bx;
                cout<<"podaj By"<<endl;
                cin>>By;
                cout<<"podaj Cx"<<endl;
                cin>>Cx;
                cout<<"podaj Cy"<<endl;
                cin>>Cy;
                cout<<endl;
                cout<<"nowe punkty zosta³y wpisane"<<endl;
                cout<<endl;
                menu=3;
                break;
            case 2:
                if (CzyLezaNaProstej(Ax,Ay,Bx,By,Cx,Cy)==1)
                {
                    cout<<endl;
                cout<<"Podane punkty le¿¹ na tej samej prostej"<<endl;
                cout<<""<<endl;
                menu=4;
                }
                else
                {
                    cout<<endl;
                cout<<"Podane punktyu nie le¿¹ na tej samej prostej"<<endl;
                cout<<""<<endl;
                menu=5;
                }
                break;
            case 3:
                cout<<"wy³¹czanie programu"<<endl;
                program=0;
                break;
            default:
                cout<<endl;
                cout<<"nie ma takiej opcji wybierz jedn¹ z istniej¹cych opcji"<<endl;
                cout<<endl;
                menu=3;
            }
        }

        if(menu==4)
        {
            cout<<"-----------------------------------------------------------"<<endl;
            cout<<"aktualne podane punkty A("<<Ax<<","<<Ay<<"),B("<<Bx<<","<<By<<"),C("<<Cx<<","<<Cy<<")"<<endl;
            cout<<"podane punkty le¿¹ na tej samej prostej";
            cout<<"wybierz opcje któr¹ chcesz:"<<endl;
            cout<<"wpisz 1 aby podaæ nowe punkty A(Ax,Ay),B(Bx,By),C(Cx,Cy)"<<endl;
            cout<<"wpisz 2 aby zakoñczyæ program"<<endl;
            cout<<"-----------------------------------------------------------"<<endl;
            cin>>kontrola;
            switch(kontrola)
            {
            case 1:
                cout<<"podaj nowe punkty A(Ax,Ay),B(Bx,By),C(Cx,Cy)"<<endl;
                 cout<<"podaj Ax"<<endl;
                cin>>Ax;
                cout<<"podaj Ay"<<endl;
                cin>>Ay;
                cout<<"podaj Bx"<<endl;
                cin>>Bx;
                cout<<"podaj By"<<endl;
                cin>>By;
                cout<<"podaj Cx"<<endl;
                cin>>Cx;
                cout<<"podaj Cy"<<endl;
                cin>>Cy;
                cout<<endl;
                cout<<"nowe punkty zosta³y wpisane"<<endl;
                cout<<endl;
                menu=3;
                break;
            case 2:
                cout<<"wy³¹czanie programu"<<endl;
                program=0;
                break;
            default:
                cout<<endl;
                cout<<"nie ma takiej opcji wybierz jedn¹ z istniej¹cych opcji"<<endl;
                cout<<endl;
                menu=4;
            }
        }

        if(menu==5)
        {
            cout<<"-----------------------------------------------------------"<<endl;
            cout<<"aktualne podane punkty A("<<Ax<<","<<Ay<<"),B("<<Bx<<","<<By<<"),C("<<Cx<<","<<Cy<<")"<<endl;
            cout<<"podane punkty nie le¿¹ na tej samej prostej"<<endl;
            cout<<"wybierz opcje któr¹ chcesz:"<<endl;
            cout<<"wpisz 1 aby podaæ nowe punkty A(Ax,Ay),B(Bx,By),C(Cx,Cy)"<<endl;
            cout<<"wpisz 2 aby obliczyæ pole trójk¹ta o wierzcho³kach A,B,C"<<endl;
            cout<<"wpisz 3 aby zakoñczyæ program"<<endl;
            cout<<"-----------------------------------------------------------"<<endl;
            cin>>kontrola;
            switch(kontrola)
            {
            case 1:
                cout<<"podaj nowe punkty A(Ax,Ay),B(Bx,By),C(Cx,Cy)"<<endl;
                 cout<<"podaj Ax"<<endl;
                cin>>Ax;
                cout<<"podaj Ay"<<endl;
                cin>>Ay;
                cout<<"podaj Bx"<<endl;
                cin>>Bx;
                cout<<"podaj By"<<endl;
                cin>>By;
                cout<<"podaj Cx"<<endl;
                cin>>Cx;
                cout<<"podaj Cy"<<endl;
                cin>>Cy;
                cout<<endl;
                cout<<"nowe punkty zosta³y wpisane"<<endl;
                cout<<endl;
                menu=3;
                break;
            case 2:
                cout<<endl;
                cout<<"pole trójk¹ta o wierzcho³kach A,B,C wynosi "<<PoleTrojkata(Ax,Ay,Bx,By,Cx,Cy)<<endl;
                cout<<endl;
                menu=6;
                break;
            case 3:
                cout<<"wy³¹czanie programu"<<endl;
                program=0;
                break;
            default:
                cout<<endl;
                cout<<"nie ma takiej opcji wybierz jedn¹ z istniej¹cych opcji"<<endl;
                cout<<endl;
                menu=5;
            }
        }

        if(menu==6)
        {
            cout<<"-----------------------------------------------------------"<<endl;
            cout<<"aktualne podane punkty A("<<Ax<<","<<Ay<<"),B("<<Bx<<","<<By<<"),C("<<Cx<<","<<Cy<<")"<<endl;
            cout<<"pole trójk¹ta o wierzcho³kach A,B,C wynosi "<<PoleTrojkata(Ax,Ay,Bx,By,Cx,Cy)<<endl;
            cout<<"wybierz opcje któr¹ chcesz:"<<endl;
            cout<<"wpisz 1 aby podaæ nowe punkty A(Ax,Ay),B(Bx,By),C(Cx,Cy)"<<endl;
            cout<<"wpisz 2 aby zakoñczyæ program"<<endl;
            cout<<"-----------------------------------------------------------"<<endl;
            cin>>kontrola;
            switch(kontrola)
            {
            case 1:
                cout<<"podaj nowe punkty A(Ax,Ay),B(Bx,By),C(Cx,Cy)"<<endl;
                 cout<<"podaj Ax"<<endl;
                cin>>Ax;
                cout<<"podaj Ay"<<endl;
                cin>>Ay;
                cout<<"podaj Bx"<<endl;
                cin>>Bx;
                cout<<"podaj By"<<endl;
                cin>>By;
                cout<<"podaj Cx"<<endl;
                cin>>Cx;
                cout<<"podaj Cy"<<endl;
                cin>>Cy;
                cout<<endl;
                cout<<"nowe punkty zosta³y wpisane"<<endl;
                cout<<endl;
                menu=3;
                break;
            case 2:
                cout<<"wy³¹czanie programu"<<endl;
                program=0;
                break;
            default:
                cout<<endl;
                cout<<"nie ma takiej opcji wybierz jedn¹ z istniej¹cych opcji"<<endl;
                cout<<endl;
                menu=6;
            }
        }
    }
    return 0;
}
