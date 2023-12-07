%{
#include<stdio.h>
int d;
%}
alpha [a-zA-Z0-9]*

%%
[0-9]+ { printf("Digit ");}
[a-zA-Z]+ { printf("Character ");}
{alpha} { printf("Invalid String ");}
\n\t {}

%%
int yywrap() {}

int main(){
	printf("Enter a string");
	yylex();
	return 0;
}
