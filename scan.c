#include <stdio.h>
#include "y.tab.h"

main ()
{
	int tok;
	extern char *yytext;
	/* extern char yytext[]; need this for lex on admiral */

	while ((tok = yylex()) != 0) {
		printf ("%d\t%s\n", tok, yytext);
		}
	printf ("%d\t<eof>\n", tok);
}
