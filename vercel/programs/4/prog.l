%{
#include "y.tab.h"
#include <stdlib.h>
%}

%%

[0-9]+        { yylval.sym = yytext[0]; return NUMBER; }
[a-zA-Z]      { yylval.sym = yytext[0]; return LETTER; }

[ \t\n]       ;

.             { return yytext[0]; }

%%

int yywrap() {
    return 1;
}
