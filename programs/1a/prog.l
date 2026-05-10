%{
#include <stdio.h>

int lines = 1, spaces = 0, words = 0, characters = 0;
%}

%%

#              { return 0; }

[ ]            { spaces++; characters++; }
[\t]           { spaces++; characters++; }
\n             { lines++; characters++; }

[a-zA-Z]+      { words++; characters += yyleng; }

.              { characters++; }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter a paragraph (end with #):\n");
    yylex();

    printf("\nNumber of lines = %d\n", lines);
    printf("Number of spaces = %d\n", spaces);
    printf("Number of words = %d\n", words);
    printf("Number of characters = %d\n", characters);

    return 0;
}
