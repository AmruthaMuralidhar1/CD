%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "y.tab.h" // Include the Yacc header

float x = 0;

void yyerror(char *s);

%}

%token ZERO ONE POINT

%%

L: X POINT Y { printf("%f", $1 + x); }
 | X { printf("%d", $1); }

X: X B { $$ = $1 * 2 + $2; }
 | B { $$ = $1; }

Y: B Y { x = $1 * 0.5 + x * 0.5; }
 | {;}

B: ZERO { $$ = $1; }
 | ONE { $$ = $1; };

%%

int main()
{
    printf("Enter the binary number : ");
    yyparse(); // No need for a loop here
    printf("\n");
    return 0;
}

void yyerror(char *s)
{
    fprintf(stdout, "\n%s", s);
}

