# TALLER ( PRIMER PARCIAL)
### ARQUITECTURA DE COMPUTADORES
#### 2017
###### Porcentaje 30%



4. Explique cómo inicializar un valor grande, que ocupe más de 13 bits, en la arquitectura **SPARC V8**.

* Para un numero que en binario sea mayor de 13 bits se inicializa con la instruccion SETHI.
* EJ:
```
1.se crea un registro en el que se guardara en este caso a = L0
2.Tamiben se convierte el numero a binario como se indica abajo.
a = 23500 = 100011010100000000
3.despues se complementa con ceros a la izquierda hasta tener un numero de 32 bits de la siguiente manera.
00000000000000100011010100000000
4.Del binario resultante se toman los 22 bits mas significativos o los primeros 22  bits de izquierda a derecha y se combierten a decimal.
5.tambien se toman los 10 bits restantes y se convierten a decimal tambien.
000000000000001001101             01000000000
        141                           256
6.Despues de haber identificado y tambien convertido a decimal se ejecuta la instruccion [SETHI] para los primeros 22 bits y tambien una instruccion [OR] para los otros 10 bits de la siguiente forma.
 
SETHI 141, %L0  //se pone la instruccion SETHI despues el decimal resultante de los primeros 22 bits y depues el registor en el que se guardara todo esto para el lenguaje ensamblador.
 
OR L0, 256, %01 //se pone la instruccion OR despues el registro donde se encunetra el decimal restante de los primeros 22 bits, despues el decimal resultante de los ultimos 10 bits y despues el registro destino.

7.Despues se pasana ambas instrucciones a lenguaje de maquina de la siguiente manera con el OP: 00 y OP2:100
OP   RD  OP2      INM DE 22 BITS
00|10000|100|0000000000000000000000010001101|
 
8. Y para el OR es  en formato 3 con OP:00 y OP3:000010 y RS: 10000
 
OP  RD    OP2     RS  I  BITS RESULTANTES
10|01001|000010|10000|1|0100000000| 
```
5. Como puedo reescribir la instrucción **(OR y SUBcc)** cuando inicializo y  comparó 2 registros.

R/

* El [OR] se puede reempélazar con instruccion sintetica MOV y la [SUBcc] se reemplaza por la instruccion sintetica [CMP]

6. ¿Qué instrucciones utilizan el delay slot antes de saltar?
R/

* Las instrucciones que se utilizan el delay slot antes de saltar son la funcion CALL , JUMP AND LINK [JMPL] y el Branch en caso de que el bit a sea igual a cero se hace el delay slot de lo contrario no se efectuaria.

7. ¿Qué significa el bit **a**, en el formato 2 de las instrucciones **BRANCH**?
R/

* Si el bit [a] NO se encuentra en la instruccion significa que ejecuta la instruccion que esta debajo y luego salta hacia arriba con el fin de continuar con las instrucciones que se encuentran en la parte superior
* si el bit [a] SI se encuentra en la instruccion significa que ejecutara solamente las instrucciones que se encuentran en la parte superior mas no en la parte inferior.

8. ¿Por que la instrucción **CALL** utilizar el registro %o7 ---> registro 15.?
R/

* Se utiliza para guardar la direccion donde se ejecuta la funcion y tambien se utiliza como referencia para volver a ejecutar las siguientes instrucciones que se encuentran en la parte inferior de donde se se llamo la instruccion [CALL]

9. convertir el programa en lenguaje de máquina a lenguaje ensamblador y luego a lenguaje de alto nivel el siguiente programa:
```
10100000000100000010000000000101
10100010000100000011111111111010
10010000000001000100000000010000
```

```
R/

|10|10000|000010|00000|1|0000000000101|

Op[10] = Con esto nos damos cuenta que es en formato 3
rd[10000] = aqui se muestra el registro destino y nos damos cuenta que es el 16 en binario por lo tanto es el registro L0
op3[000010] = con esto nos damos cuenta que el OP3 corresponde a un [OR]
rs1[00000] = este es el registro fuente uno y como tenemos el numero cero en decimal y binario sabemos que es el registro G0
[1]=con el nos damos cuentaa que hay un inmediato
[0000000000101] = el inmediato es el quivalente en binario del numero 5

#PARA EL LENGUAJE ENSAMBLADOR TENDRIAMOS
MOV 5, %L0


|10|10001|000010|00000|1|1111111111010|

Op[10] = Con esto nos damos cuenta que es en formato 3
rd[10001] = aqui se muestra el registro destino y nos damos cuenta que es el 17 en binario por lo tanto es el registro L1
op3[000010] = con esto nos damos cuenta que el OP3 corresponde a un [OR]
rs1[00000] = este es el registro fuente uno y como tenemos el numero cero en decimal y binario sabemos que es el registro G0
[1]=con el nos damos cuentaa que hay un inmediato
[1111111111010] = el inmediato es el quivalente en binario del numero -6

#PARA EL LENGUAJE ENSAMBLADOR TENDRIAMOS
MOV -6, %L1

|10|01000|000000|10001|0|00000000|10000|

Op[10] = Con esto nos damos cuenta que es en formato 3
rd[01000] = aqui se muestra el registro destino y nos damos cuenta que es el 8 en binario por lo tanto es el registro O0
op3[00000] = con esto nos damos cuenta que el OP3 corresponde a un [ADD]
rs1[10001] = este es el registro fuente 1 y como tenemos el numero 17 en decimal y binario sabemos que es el registro L1
[0]=con el nos damos cuentaa que hay un inmediato y como hay un 0 sabemos que no hay inmediato
[10000] = ya que no hay inmediato el ultimo registro se define como registro fuente 2 y es igual a 16 en binario lo cual seria L0

LENGIAJE ENSAMBLADOR 
ADD %l1,%l0,%O0
 
LENGUAJE DE ALTO NIVEL 

Lenguaje de alto nivel 
  
  
int main():
  {
 
 
    int x=5;

     int y=-6;
    
   
     return x+y;
 
  }
```  
10. Convierta el siguiente código a lenguaje ensamblador, máquina **SPARC V8** y hexadecimal.
a.
 ```c
 int main(){
 int a = 8;
 int b = -16800;
 int c = 33; 
 if((a+b)<=b*32){
 	c=a+(b*2);
	}
else{
	return b;
}
	return a+c;
}
 ```
 ```c
 a-->%lo, b-->%l1,c-->%l2
 main:
 0x0000 mov 8 , %lo          |op=10|rd=10000|op3=000010|rs1=00000|i=1|imm13=0000000001000|        0xA01802008
 0x0004 sethi 4194287 , %l1  |op=00|rd=10001|op2=100|1111111111111111101111|                      0x233FFFEF
 0x0008 or %l1 ,608,%l1      |op=10|rd=10001|op3=000010|rs1=10001|i=1|imm13=0001001100000|        0xA2146260
 0x000c mov 33,%l2           |op=10|rd=10010|op3=000010|rs1=00000|i=1|imm13=0000000100001|        0xA4102021
 0x0010 add %l0,%l1,%l3      |op=10|rd=10011|op3=000000|rs1=10000|i=0|unused=00000000|rs2=10001|  0xA6040011
 0x0014 SLL %l3,5,%l4        |op=10|rd=10100|op3=100101|rs1=10011|i=1|unused=00000000|shc=00101|  0xA92CE5
 0x0018 cmp %l3,%l4          |op=10|rd=00000|op3=010100|rs1=10011|i=0|unused=00000000|rs2=10100|  0x80A4C014
 0x001c BG a TRUE            |op=00|a=1|cond=1010|010|disp22=0000000000000000000100|              0xAB2C61
  0x0020 SLL %l1,1,%l5       |op=10|rd=10101|op3=100101|rs1=10001|i=1|unused=00000000|shc=00001|  0xAB2C61
  0x0024 add %lo,%l5,%l2     |op=10|rd=10010|op3=000000|rs1=10000|i=0|unused=00000000|rs2=10101|  0X5202000
 0x0028 BA a Exit            |op=00|a=1|cond=1000|010|disp22=0000000000000000000010|              0X3080002
 TRUE
  0x002c mov,%l1,%Oo         |op=10|rd=01000|op3=000010|rs1=O0000|i=0|unused=00000000|rs2=10001|  0X58100001
 Exit
  0x0030 add %lo,%l2,%O1     |op=10|rd=01001|op3=000000|rs1=10000|i=0|unused=00000000|rs2=10010|  0X92040012
 ```

b.
 ```c
int main(){
	int a = 8;
	int b = -10;
	if(a!=b){
		return c/8;
}
else{
	return b;
}
}
```
```c
a-->%lo, b-->%l1,c-->%l2
main:
0x0000 mov 8,%lo     |op=10|rd=10000|op3=000010|rs1=00000|i=1|imm13=0000000001000|          0X50080008
0x0004 mov -10,%l1   |op=10|rd=10001|op3=000010|rs1=00000|i=1|imm13=1111111110110|          0XA2103FF6
0x0008 mov 0,%l2     |op=10|rd=10010|op3=000010|rs1=00000|i=1|imm13=0000000000000|          0XA4102000
0x000c cmp %lo,%l1   |op=10|rd=00000|op3=010100|rs1=10000|i=0|unused=00000000|rs2=10001|    0X80A40011
0x0010 BE a TRUE     |op=00|a=1|cond=0001|010|disp22=0000000000000000000011|                0X22800003
0x0014 SRL %l2,3,%Oo|op=10|rd=01000|op3=100110|rs1=10010|i=1|unused=00000000|shc=00011|     0X9134A3
0x0018 BA a Exit     |op=00|a=1|cond=1000|010|disp22=0000000000000000000010|                0X08000002
TRUE
 0x001c mov %l1,%O1  |op=10|rd=01001|op3=000010|rs1=00000|i=0|unused=00000000|rs2=10001|    0X92100011
Exit
 0x0020 NOP          |op=00|00000|100|0000000000000000000000|                               0X01000000


```
c.
 ```c
int main(){
	int a = -21180;
}
```
```c
a-->%lo
main:
0x0000 sethi 4194283,%lo  |op=00|rd=10000|op2=100|1111111111111111101011|                  0X113FFFEB
0x0004 or %lo,324,%lo     |op=10|rd=10000|op3=000010|rs1=10000|i=1|imm13=0000101000100|    0XA0144144


```

11. Convierta el siguiente código a lenguaje ensamblador, máquina **SPARC V8** y hexadecimal.
 ```c
int test(int a, int b, int c){
	int z;
	z = a - b + c*4;
	return z + 2;
}

int main(){
	int p = 4, y = 2, c = -128;
	int x = test(p,y,c);
	return x + 45;
}
 ```
 ```c
 a,p-->%io |b,y-->%i1 |c-->%i2|z-->%l3
 Test
 0x0000 mov 0,%l3      |op=10|rd=10011|op3=000010|rs1=00000|i=1|imm13=0000000000000|         0XA6102000
 0x0004 sub %io,i1,%lo |op=10|rd=10000|op3=000100|rs1=11000|i=0|unused=00000000|rs2=11001|   0XA0260019
 0x0008 SLL %i2,2,%l1  |op=10|rd=10001|op3=100101|rs1=11010|i=1|unused=00000000|shc=00010|   0XA32EA2
 0x000c add %lo,%l1,%l3|op=10|rd=10011|op3=000000|rs1=10000|i=0|unused=00000000|rs2=10001|   0XA6040011
 0x0010 jmpl %O7+8,%go |op=10|rd=00000|op3=111000|rs1=01111|i=1|rs2=0000000001000|           0X81C3E008
 0x0014 add %l3,2,%Oo  |op=10|rd=01000|op3=000000|rs1=10011|i=1|imm13=0000000000010|         0X9004E002
 
 main:
 0x0018 mov 4,%io       |op=10|rd=11000|op3=000010|rs1=00000|i=1|imm13=0000000000100|        0XB0102004
 0x001c mov 2,%i1       |op=10|rd=11001|op3=000010|rs1=00000|i=1|imm13=0000000000010|        0XB2102002
 0x0020 mov -128,%i2    |op=10|rd=11010|op3=000010|rs1=00000|i=1|imm13=1111110000000|        0XB2103F80
 0x0024 call Test       |op=01|disp30=111111111111111111111111110110|                        0X7FFFFFF6
  0x0028 mov 0,%l4      |op=10|rd=10100|op3=000010|rs1=00000|i=1|imm13=0000000000000|        0XA8202000
 0x002c add %l4,45,%O1  |op=10|rd=01001|op3=000000|rs1=10100|i=1|imm13=0000000101101|        0X9205202D
 
 
 ```
12. Implemente una función **Mul** en lenguaje de alto nivel, lenguaje ensamblador **SPARC V8** y lenguaje de máquina SPARC V8 que realice la multiplicación de dos enteros sin signo usando solo sumas.
```c
int mul(int a, int b){
	int z=0;
	for(int cont=1;cont<=b;cont+=1){
		z=z+a;
	}
	
	return z;
	
}
``` 

```c
a-->%io, b-->%i1, cont-->%l1,z-->%lo
mul:
0x0000 mov 0,%lo        |op=10|rd=10000|op3=000010|rs1=00000|i=1|imm13=0000000000000|       
0x0004 mov 1,%l1        |op=10|rd=10001|op3=000010|rs1=00000|i=1|imm13=0000000000001|
For
0x0008 cmp %l1,%i1      |op=10|rd=00000|op3=010100|rs1=10001|i=0|unused=00000000|rs2=11001|   
0x000c BG a salida      |op=00|a=1|cond=1010|010|disp22=0000000000000000000100|
0x0010  add %lo,%io,lo  |op=10|rd=10000|op3=000000|rs1=10000|i=0|unused=00000000|rs2=11000|
0x0014 BA   For         |op=00|a=0|cond=1000|010|disp22=1111111111111111111100|
0x0018  add %l1,1,%l1   |op=10|rd=10001|op3=000000|rs1=10001|i=1|imm13=00000000000001|
salida
0x001c mov %lo,%Oo      |op=10|rd=01000|op3=000010|rs1=00000|i=0|unused=00000000|rs2=10000|




```


13. Implemente la función **Pot** en lenguaje de alto nivel,lenguaje ensamblador **SPARC V8** y lenguaje de máquina SPARC V8 que realice la potencia de dos números enteros sin signo realizando llamados a la función desarrollada en el punto 9.
```c
int pot(int a,int b){
	int c = a;
	if(b==0){
	return 1;
	}else{	
	for(int i=1;i<b;i++){
		a=mul(a*c);
		}
	return a;
}
}

a-->%i0,b-->%i0;c-->%lo,i-->%l1
pot:
0x0000 mov %i0,%lo    |op=10|rd=10000|op3=000010|rs1=00000|i=0|unused=00000000|rs2=11000|
0x0004 mov 1,%l1      |op=10|rd=10001|op3=000010|rs1=00000|i=1|imm13=0000000000001|
0x0008 cmp i0%,0      |op=10|rd=00000|op3=010100|rs1=11000|i=1|imm13=0000000000000|    
0x000c BNE a True     |op=00|a=1|cond=1001|010|disp22=0000000000000000000011|
0x0010 mov 0,%Oo      |op=10|rd=01000|op3=000010|rs1=00000|i=1|imm13=0000000000000|
0x0014 BA a Exit      |op=00|a=1|cond=1000|010|disp22=0000000000000000001000|
True
for
0x0018 cmp %l1,%i1    |op=10|rd=00000|op3=010100|rs1=10001|i=0|unused=00000000|rs2=11001|
0x001c BGE a Exit1    |op=00|a=1|cond=1011|010|disp22=0000000000000000000100|
0x0020 call mult      |op=10|rd=11000|op3=100101|rs1=11000|i=1|unused=00000000|rs2=10000|
0x0024 mov %io,%l0
0x0024 BA    For      |op=00|a=0|cond=1000|010|disp22=1111111111111111111100|
0x0028 add %l1,1,%l1  |op=10|rd=10001|op3=000000|rs1=10001|i=1|imm13=00000000000001|
Exit1
0x002c mov %i0,%O1    |op=10|rd=01001|op3=000010|rs1=00000|i=0|unused=00000000|rs2=11001|
Exit
0x0030 NOP            |op=00|00000|100|0000000000000000000000|  


```

14. Implemente una función **Fact** en lenguaje de alto nivel, lenguaje ensamblador **SPARC V8** y lenguaje de máquina SPARC V8 que calcule el factorial de un número entero sin signo.
```c
int fact (int a){
  int b,fac=1;
  for (b=1 ; b<=a ; b++)
    {
         fac=mul(b,fac);
    }
    return fac;
    
}
b-->%lo, fac-->%l1, a-->%i0
fact:
0x0000 mov 0,%lo      |op=10|rd=10000|op3=000010|rs1=00000|i=1|imm13=0000000000000|
0x0004 mov 1,%l1      |op=10|rd=10001|op3=000010|rs1=00000|i=1|imm13=0000000000001|
For
0x0008 cmp %l1,%i0    |op=10|rd=00000|op3=010100|rs1=10001|i=0|unused=00000000|rs2=11000|
0x000c BG a salida    |op=00|a=1|cond=1010|010|disp22=0000000000000000000100|
0x0010 call mul       |op=10|rd=10001|op3=100101|rs1=10000|i=1|unused=00000000|rs2=10001|
0x0014 mov %l1,%l1
0x0014 BA    For      |op=00|a=0|cond=1000|010|disp22=1111111111111111111100|
0x0018 add %lo,1,%lo  |op=10|rd=10000|op3=000000|rs1=10000|i=1|imm13=00000000000001|
salida
0x001c mov %l1,%Oo    |op=10|rd=01000|op3=000010|rs1=00000|i=0|unused=00000000|rs2=10001|



```


15. Implemente una función **Div** en lenguaje de alto nivel, lenguaje ensamblador **SPARC V8** y lenguaje de máquina SPARC V8 que calcule la division de un número entero sin signo.
 ```c
int div(int a,int b){
int z=0;
for(int cont=a;cont>0;cont-=b){
		z=z+1;
	}
   return z;
}
```
```c
a-->%io, b-->%i1, cont-->%l1,z-->%lo
div:
0x0000 mov 0,%lo      |op=10|rd=10000|op3=000010|rs1=00000|i=1|imm13=0000000000000|
0x0004 mov %io,%l1    |op=10|rd=10001|op3=000010|rs1=00000|i=0|unused=00000000|rs2=11000|
For
0x0008 cmp %l1,0      |op=10|rd=00000|op3=010100|rs1=10011|i=1|imm13=0000000000000|
0x000c BLE a salida   |op=00|a=1|cond=0010|010|disp22=0000000000000000000100|
0x0010  add %lo,1,%lo |op=10|rd=10000|op3=000000|rs1=10000|i=1|imm13=0000000000001|
0x0014 BA     For     |op=00|a=0|cond=1000|010|disp22=1111111111111111111100|
0x0018  sub %l1,i1,%l1|op=10|rd=10001|op3=000100|rs1=10001|i=0|unused=00000000|rs2=11001|
salida
0x001c mov %lo,%O1    |op=10|rd=01001|op3=000010|rs1=00000|i=0|unused=00000000|rs2=10000|     
```








