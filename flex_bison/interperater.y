%{
    //#include "defines.h"

    #include <iostream>
    #include "lex.l"

    using std::cout, std::endl;
%}

%token PRINT
%token NEWLINE
%token OTHER

%%

program : line          {$$ = $1}
        | program line  {$$ = $1 + $2}
        ;

line : NEWLINE    {$$ = $1}
     | printline  {$$ = $1}
     ;

printline :
          | printline NEWLINE  {cout << endl; $$ = $1 + $2}
          | printline OTHER    {cout << yylval ; $$ = $1 + $2}
          | PRINT              {$$ = $1;}
          ;

%%

void yyerror (char *s) {
  fprintf(stderr, "%s\n", s);
}

int main() {
  yyparse();
  return 0;
}