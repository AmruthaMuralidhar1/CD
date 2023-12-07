%option noyywrap
%{
#include<stdio.h>
%}
%%
^[0-9]*"222"[0-9]* {printf("%s has 222's consecutively\n", yytext);}
[0-9a-zA-z]* {printf("This is invalid\n");}
[\t\n] {}
%%

int main()
{
printf("\nEnter String\n");
yylex();
return 0;
}

