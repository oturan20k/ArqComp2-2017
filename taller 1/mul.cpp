#include <iostream>
#include <stdio.h>
#include <stdlib.h>

int multi(int a,int b){
	int z=0;

	for(int cont=a;cont>0;cont-=b){
		z=z+1;
	}
   return z;

}

int main(){
	
	int a=100;
	int b=0;
	int result;
	result=multi(a,b);

    return result;
}
