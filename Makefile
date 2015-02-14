CC = gcc -g
LEX = lex
LLIBS = -ll
OBJS = lex.yy.o scan.o

scan : $(OBJS) 
	$(CC) -o scan $(OBJS) $(LLIBS) 

lex.yy.c : zb.l
	$(LEX) zb.l
lex.yy.o : lex.yy.c 

# scan : scan.o lex.yy.o
# 	$(CC) -o scan scan.o lex.yy.o $(LLIBS)
#scan.o : scan.c 

clean :
	-@ rm lex.yy.c *.o 
realclean : clean
	-@ rm scan
