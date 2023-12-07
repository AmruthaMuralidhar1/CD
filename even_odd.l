%{
#include<stdio.h>
int d;
%}

%%
[0-9]+ { d=atoi(yytext);
	if ((d%2)==0){
		printf("%d is even\n", d);
	}
	else{
		printf("%d is odd\n", d);
	}
}
\n\t {}

%%
int yywrap() {}

int main(){
	printf("Enter a digit\n");
	yylex();
	return 0;
}
