%{
#include<stdio.h>
%}
%%
^[-+]?[0-9]*[.]?[0-9]+$ {printf("\nFloat: %s\n", yytext);}
[\t\n] {}
%%

int main()
{
printf("\nEnter\n");
yylex();
return 0;
}
