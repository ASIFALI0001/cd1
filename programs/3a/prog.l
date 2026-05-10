%{
#include "y.tab.h"
%}

%%

"for"      { return FOR; }
"("        { return LPAREN; }
")"        { return RPAREN; }
"{"        { return LF; }
"}"        { return RF; }

"=="       { return EQ; }
"<="       { return LE; }
">="       { return GE; }
"+="       { return ADDEQ; }
"-="       { return SUBEQ; }
"++"       { return INC; }
"--"       { return DEC; }

"="        { return '='; }
">"        { return '>'; }
"<"        { return '<'; }
"+"        { return '+'; }
"-"        { return '-'; }
";"        { return ';'; }

[a-zA-Z]+  { return ALPH; }
[0-9]+     { return NUM; }

[ \t\n]    ;

#          { return 0; }

.          ;

%%

int yywrap() {
    return 1;
}
