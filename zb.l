%{
#include <stdio.h>
#include "y.tab.h"
void yyerror (char * s);
int line=1;
%}
L	[A-Za-z]
D	[0-9]
%%
^"."C.*		;
[ \t]+		;
IF			{return If;}
THEN		{return Then;}
END		{return End;}
WHILE		{return While;}
DO			{return Do;}
{L}({L}|{D})*	{return Ident;}
{D}+		{return IntConst;}
"="		{return Assign;}
".EQ."	{return Eq;}
".NE."	{return Ne;}
".LT."	{return Lt;}
".LE."	{return Le;}
".GT."	{return Gt;}
".GE."	{return Ge;}
"+"		{return Plus;}
"-"		{return Minus;}
"*"		{return Star;}
"/"		{return Slash;}
"("		{return LParen;}
")"		{return RParen;}
"\n"		{line++;}
.			{yyerror ("Bad Character");}
%%
void yyerror (char s[])
{
	printf ("Error: %s at token %s in line %d\n", s, yytext, line);
}
