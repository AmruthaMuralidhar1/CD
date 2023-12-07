%{
#include<stdio.h>
char fname[25];
%}
alpha [a-zA-Z]
digit [0-9]
%%
(float|int) { printf("Keyword ");}
{alpha}({alpha}|{digit})* { printf("Identifier ");}
{digit}({alpha}|{digit})* { printf("Invalid String ");}
\n\t {}

%%
int yywrap() {}

int main(){
	printf("Enter file name\n");
	scanf("%s", fname);
	yyin = fopen(fname, "r");
	yylex();
	fclose(yyin);
	return 0;
}
