%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror();

int depth = 0;
int maxDepth = 0;
int count = 0;
%}

%token FOR LPAREN RPAREN LF RF ALPH NUM EQ LE GE ADDEQ SUBEQ INC DEC

%%

S : FORSTMT {
        if (maxDepth >= 3) {
            printf("Valid\n");
            printf("Number of nested FOR's are: %d\n", count);
        } else {
            printf("Invalid\n");
        }
    }
  ;

FORSTMT :
    FOR A LF {
        depth++;
        count++;
        if (depth > maxDepth) maxDepth = depth;
    }
    BODY
    RF {
        depth--;
    }
;

BODY :
    FORSTMT BODY
  | /* empty */
;

A : LPAREN E ';' E ';' E RPAREN ;

E :
    ALPH Z NUM
  | ALPH Z ALPH
  | ALPH U
  | /* empty */
;

Z :
    '=' | '>' | '<' | LE | GE | EQ | ADDEQ | SUBEQ
;

U :
    INC | DEC
;

%%

int main() {
    printf("Enter code (end with #):\n");
    yyparse();
    return 0;
}

void yyerror() {
    printf("Invalid\n");
    exit(0);
}
