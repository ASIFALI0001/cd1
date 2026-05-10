%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);
%}

%token TYP ID LP RP LB RB SC CM EQ OP RETURN NUM

%left OP
%right EQ

%%

prog : func
     ;

func : TYP ID LP params RP LB stmts RB
      { printf("Function is syntactically correct\n"); }
     ;

params : /* empty */
       | param_list
       ;

param_list : param
           | param_list CM param
           ;

param : TYP ID
      ;

stmts : stmt
      | stmts stmt
      ;

stmt : var_decl
     | assign SC
     | RETURN expr SC
     ;

var_decl : TYP ID SC
         | TYP ID EQ expr SC
         ;

assign : ID EQ expr
       ;

expr : expr OP expr
     | LP expr RP
     | ID
     | NUM
     ;

%%

int main() {
    printf("Enter function:\n");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    printf("Invalid function\n");
    exit(0);
}
