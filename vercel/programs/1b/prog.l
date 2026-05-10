%{
#include "y.tab.h"
%}

%%

a        { return 'a'; }
b        { return 'b'; }
c        { return 'c'; }

#        { return 0; }

[ \t\n]  ;

.        { return yytext[0]; }

%%

int yywrap() {
    return 1;
}
