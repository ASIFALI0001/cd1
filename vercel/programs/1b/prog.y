%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%start S

%%

S : A B ;

A : 'a' A 'b'
  | /* empty */
  ;

B : 'b' B 'c'
  | /* empty */
  ;

%%

int main() {
    printf("Enter string:\n");
    yyparse();
    printf("Valid string\n");
    return 0;
}

void yyerror(const char *s) {
    printf("Invalid string\n");
    exit(0);
}
