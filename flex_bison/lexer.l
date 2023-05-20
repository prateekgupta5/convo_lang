%{
    //#include "defines.h"
    #include <string>
    #define YYSTYPE string
    #include "interperater.tab.c"
    extern YYSTYPE yylval;
%}

%%
\n          {return NEWLINE}
" say "     {return PRINT}
[ ][.]*[ ]  {yylval = yytext; return OTHER}
%%

int yywrap () {}

int yylex () {}