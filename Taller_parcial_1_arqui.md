# TALLER ( PRIMER PARCIAL)
### ARQUITECTURA DE COMPUTADORES
#### 2017
###### Porcentaje 30%


1. Describa la Taxonomía de Flynn.
2. Diga cuales son los 4 principios de diseño.
3. Explique los tres formatos que se usan en la arquitectura SPARC V8, y que instrucciones usan los formatos correspondientes a la arquitectura **SPARC V8** 
4. Explique cómo inicializar un valor grande, que ocupe más de 13 bits, en la arquitectura **SPARC V8**.
5. Como puedo reescribir la instrucción **(OR y SUBcc)** cuando inicializo y  comparó 2 registros.
6. ¿Qué instrucciones utilizan el delay slot antes de saltar?
7. ¿Qué significa el bit **a**, en el formato 2 de las instrucciones **BRANCH**?
8. ¿Por que la instrucción **CALL** utilizar el registro %o7 ---> registro 15.?
9. convertir el programa en lenguaje de máquina a lenguaje ensamblador y luego a lenguaje de alto nivel el siguiente programa:
```
10100000000100000010000000000101
10100010000100000011111111111010
10010000000001000100000000010000
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
 ```
 a-->%lo, b-->%l1,c-->%l2
 main:
 0x0000 mov 8 , %lo          |op=10|rd=10000|op3=000010|rs1=00000|i=1|imm13=0000000001000|
 0x0004 sethi 4194287 , %l1  |op=00|rd=10001|op2=100|1111111111111111101111|
 0x0008 or %l1 ,608,%l1      |op=10|rd=10001|op3=000010|rs1=10001|i=1|imm13=0001001100000|
 0x000c mov 33,%l2           |op=10|rd=10010|op3=000010|rs1=00000|i=1|imm13=0000000100001|
 0x0010 add %l0,%l1,%l3      |op=10|rd=10011|op3=000000|rs1=10000|i=0|unused=00000000|rs2=10001|
 0x0014 SLL %l3,5,%l4        |op=10|rd=10100|op3=100101|rs1=10011|i=1|shcnt=00101|
 0x0018 cmp %l3,%l4          |op=10|rd=00000|op3=010100|rs1=10011|i=0|unused=00000000|rs2=10100|
 0x001c BG a TRUE            |op=00|a=1|cond=1010|010|disp22=0000000000000000000100|
  0x0020 SLL %l1,1,%l5       |op=10|rd=10101|op3=100101|rs1=10001|i=1|shcnt=00001|
  0x0024 add %lo,%l5,%l2     |op=10|rd=10010|op3=000000|rs1=10000|i=0|unused=00000000|rs2=10101|
 0x0028 BA a Exit            |op=00|a=1|cond=1000|010|disp22=0000000000000000000010|
 TRUE
  0x002c mov,%l1,%Oo         |op=10|rd=01000|op3=000010|rs1=O0000|i=0|unused=00000000|rs2=10001|
 Exit
  0x0030 add %lo,%l2,%O1     |op=10|rd=01001|op3=000000|rs1=10000|i=0|unused=00000000|rs2=10010|
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
```
a-->%lo, b-->%l1,c-->%l2
main:
0x0000 mov 8,%lo     |op=10|rd=10000|op3=000010|rs1=00000|i=1|imm13=0000000001000|
0x0004 mov -10,%l1   |op=10|rd=10001|op3=000010|rs1=00000|i=1|imm13=1111111110110|
0x0008 mov 0,%l2     |op=10|rd=10010|op3=000010|rs1=00000|i=1|imm13=0000000000000|
0x000c cmp %lo,%l1   |op=10|rd=00000|op3=010100|rs1=10000|i=0|unused=00000000|rs2=10001|
0x0010 BE a TRUE     |op=00|a=1|cond=0001|010|disp22=0000000000000000000011|
 0x0014 SRL %l2,3,%Oo|op=10|rd=01000|op3=100110|rs1=10010|i=1|shcnt=00011|
0x0018 BA a Exit     |op=00|a=1|cond=1000|010|disp22=0000000000000000000010|
TRUE
 0x001c mov %l1,%O1  |op=10|rd=01001|op3=000010|rs1=00000|i=0|unused=00000000|rs2=10001|
Exit
 0x0020 NOP          |op=00|00000|100|0000000000000000000000|


```
c.
 ```c
int main(){
	int a = -21180;
}
```
```
a-->%lo
main:
0x0000 sethi 4194283,%lo  |op=00|rd=10000|op2=100|1111111111111111101011|
0x0004 or %lo,324,%lo     |op=10|rd=10000|op3=000010|rs1=10000|i=1|imm13=0000101000100|


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
12. Implemente una función **Mul** en lenguaje de alto nivel, lenguaje ensamblador **SPARC V8** y lenguaje de máquina SPARC V8 que realice la multiplicación de dos enteros sin signo usando solo sumas.
13. Implemente la función **Pot** en lenguaje de alto nivel,lenguaje ensamblador **SPARC V8** y lenguaje de máquina SPARC V8 que realice la potencia de dos números enteros sin signo realizando llamados a la función desarrollada en el punto 9.
14. Implemente una función **Fact** en lenguaje de alto nivel, lenguaje ensamblador **SPARC V8** y lenguaje de máquina SPARC V8 que calcule el factorial de un número entero sin signo.
15. Implemente una función **Div** en lenguaje de alto nivel, lenguaje ensamblador **SPARC V8** y lenguaje de máquina SPARC V8 que calcule la division de un número entero sin signo.



### SOLUCION

4./Respuesta
Para un numero que en binario sea mayor de 13 bits se inicializa con la funcion SETHI




