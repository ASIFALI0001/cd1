%{
#include <stdio.h>
#include <stdlib.h>

void yyerror();
int yylex(void);
%}

%union {
    int ival;
}

%token <ival> NUM
%type <ival> I

%left '+' '-'
%left '*' '/'
%right UMINUS

%%

S : I { printf("Result is %d\n", $1); }
  ;

I : I '+' I             { $$ = $1 + $3; }
  | I '-' I             { $$ = $1 - $3; }
  | I '*' I             { $$ = $1 * $3; }
  | I '/' I             { if ($3 == 0) yyerror(); else $$ = $1 / $3; }
  | '(' I ')'           { $$ = $2; }
  | NUM                 { $$ = $1; }
  | '-' I %prec UMINUS  { $$ = -$2; }
  ;

%%

int main() {
    printf("Enter an expression:\n");
    yyparse();
    printf("Valid\n");
    return 0;
}

void yyerror() {
    printf("Invalid\n");
    exit(0);
}
