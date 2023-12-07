%option noyywrap
%{
#include<stdio.h>
%}
%%
[0-9]+ {printf("\nnumber: %s\n", yytext);}
[+-] {printf("\nOperator: %s\n", yytext);}
int|char|float|bool|True {printf("\nKeyword: %s\n", yytext);}
[!,.] {printf("\nPunctuations: %s\n", yytext);}
[a-zA-Z_0-9]* {printf("\nIdentifier: %s\n", yytext);}
[\t\n] {}
%%

int main()
{
printf("\nEnter\n");
yylex();
return 0;
}

