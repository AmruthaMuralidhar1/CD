%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include"y.tab.h"
extern int var_cnt;
extern char iden[20];
%}

digit [0-9]+
id [a-zA-Z]+

%%
{digit} { yylval = atoi(yytext); return digit; }
{id} { strcpy(iden, yytext); yylval = 1; return id; }
[ \t] { ; }
\n return 0;
. return yytext[0];
%%

int yywrap()
{
    return 1;
}

