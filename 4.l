%option noyywrap
%{
#include<stdio.h>
%}
%%
^(([0-9][0-9][0-9][0-9][0-9])+"55"[0-9]*)* {printf("%s has 55's consecutively\n", yytext);}
[0-9a-zA-z]* {printf("This is invalid\n");}
[\t\n] {}
%%

int main()
{
printf("\nEnter String\n");
yylex();
return 0;
}

