%{
#include<stdio.h>
%}
sign [+-][0-9]+
unsign [0-9]+
%%
({sign})[.]?{unsign}* {printf("Signed Number");}
({unsign})[.]?{unsign}* {printf("Unigned Number");}
\n\t {}
%%
int yywrap() {}
int main(){
	printf("Enter");
	yylex();
	return 0;
}
