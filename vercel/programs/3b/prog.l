%{
#include "y.tab.h"
%}

%%

"int"|"void"|"char"|"float"|"double"   { return TYP; }
"return"                               { return RETURN; }

[a-zA-Z_][a-zA-Z0-9_]*                 { return ID; }
[0-9]+                                 { return NUM; }

"("                                    { return LP; }
")"                                    { return RP; }
"{"                                    { return LB; }
"}"                                    { return RB; }

";"                                    { return SC; }
","                                    { return CM; }

"="                                    { return EQ; }
"+"|"-"|"*"|"/"                        { return OP; }

[ \t\n]                                ;
.                                      ;

%%

int yywrap(void) {
    return 1;
}
