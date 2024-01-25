%{
#include <stdio.h>
#include <math.h>

int var_cnt = 0;
char iden[20];

int yylex(void);
void yyerror(const char *s);

%}

%token id
%token digit

%%
S: id '=' E { printf("%s=t%d\n", iden, var_cnt - 1); }
E: E '+' T { $$ = var_cnt; var_cnt++; printf("t%d = t%d + t%d;\n", $$, $1, $3); }
 | E '-' T { $$ = var_cnt; var_cnt++; printf("t%d = t%d - t%d;\n", $$, $1, $3); }
 | T { $$ = $1; }
 ;

T: T '*' F { $$ = var_cnt; var_cnt++; printf("t%d = t%d * t%d;\n", $$, $1, $3); }
 | T '/' F { $$ = var_cnt; var_cnt++; printf("t%d = t%d / t%d;\n", $$, $1, $3); }
 | F { $$ = $1; }
 ;

F: P '^' F { $$ = var_cnt; var_cnt++; printf("t%d = pow(t%d, t%d);\n", $$, $1, $3); }
 | P { $$ = $1; }
 ;

P: '(' E ')' { $$ = $2; }
 | digit { $$ = var_cnt; var_cnt++; printf("t%d = %d;\n", $$, $1); }
 ;

%%

int main()
{
    var_cnt = 0;
    printf("Enter an expression : \n");
    yyparse();
    return 0;
}

void yyerror(const char *s)
{
    fprintf(stderr, "error: %s\n", s);
}


