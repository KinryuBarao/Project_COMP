#Flag -g -> Gera automato em imagem (.dot)
#Flag -v -> Gera Cases Output (.output)
YACCFLAGS = -v -g 


all: compile_yacc

compile_lex: Meta1/gocompiler.l lex.yy.c
		lex Meta1/gocompiler.l
		clang-3.9 -o main lex.yy.c

compile_yacc: gocompiler.l gocompiler.y y.tab.c lex.yy.c
		lex gocompiler.l
		yacc -d gocompiler.y
		gcc -o  main y.tab.c lex.yy.c

		
object_flags: y.tab.c ylex.yy.c
		gcc -o  $(YACCFLAGS) main y.tab.c lex.yy.c

run:
		./main
run_test:
		./main < Test
clean: 
		rm -rf *o main