#include <conio.h>
#include <stdio.h>
#include <iostream>
using namespace std;

int x,y,fact;

int main (void)
{
    cout << "Por favor ingrese un numero " <<endl;
    cin >> x;
    fact=1;
    for (y=1 ; y<=x ; y++)
    {
    	
         fact = y * fact;
         
    }
    
    cout << "El factorial de %d es: %d ", &x, &fact ;
    
    system("pause");
    
    return 0;
}
