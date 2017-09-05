#include <conio.h>
#include <stdio.h>

int main()
{
    int x, y, res;

    printf( "ingrrese la base " );
    scanf( "%d", &x );
    printf( "\nIngrese el exponenete" );
    scanf( "%d", &res );

    if ( x > 0 && y == 0 )
    {
    	res=1;
       printf( "\n la potencia de %d es %d.",x ,res );
       
}

    if(y==1){
    	res=x;
    	
    	 printf( "\n la potencia de %d es %d.",x ,res);
    	
      }
      
      if(x>1 && y>1){
      res = x;	
      for(int cont1=x;cont1>=y;cont1=+1){
		res=x;
		}     	
      	
      	 printf( "\n la potencia de %d es %d.",x ,res );
	  }

    return 0;
}
