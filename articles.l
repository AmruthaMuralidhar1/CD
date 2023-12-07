%{
#include<stdio.h>
int f=0;
%}

%%
[A|An|THE|The|A|a][A-Za-z]* { f = f+1; }
\t\n  { return 0;}
%%

int yywrap() {}

int main(){
	printf("Enter a string\n");
	yylex();
	if(f>0){
		printf("Starts with art\n");
	}
	else {
		printf("Starts without art\n");
	}
	return 0;
}


