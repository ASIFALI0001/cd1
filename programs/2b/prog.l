%{
#include "y.tab.h"
#include <stdlib.h>
%}

%%

[0-9]+        { yylval.ival = atoi(yytext); return NUM; }
[+\-*/()]     { return yytext[0]; }
\n            { return 0; }
[ \t]         ;
.             { return yytext[0]; }

%%

int yywrap() {
    return 1;
}
