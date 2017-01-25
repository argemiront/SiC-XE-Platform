MAIN	START	0
	EXTDEF	BUFFER, BUFEND, LENGHT
	EXTREF	RDEN, RDSA
CLOOP	+JSUB	RDEN
	LDA	LENGHT
	COMP	#0
	JEQ	ENDFIL
	+JSUB	RDSA
	J	CLOOP
ENDFIL	LDA	#0
	STA	LENGHT
	+JSUB	RDSA
	SVC
RETADR	RESW	1
LENGHT	RESW	1
BUFFER	RESB	10
BUFEND	EQU	*
MAXLEN	EQU	BUFEND-BUFFER
.
.	SUB-ROTINA PARA GUARDAR REGISTRO NO BUFFER
RDEN	CSECT
	EXTREF	BUFFER, LENGHT, BUFEND
	CLEAR	X
	CLEAR	A
	LDS	#48
	LDT	MAXLEN
RLOOP	TD	INPUT
	JEQ	RLOOP
	RD	INPUT
	COMPR	A,S
	JEQ	EXIT
	+STCH	BUFFER,X
	TIXR	T
	JLT	RLOOP
EXIT	+STX	LENGHT
	RSUB
INPUT	BYTE	X'F1'
MAXLEN	WORD	BUFEND-BUFFER
.
.	SUB-ROTINA PARA TRANSFERIR REGISTRO DO BUFFER
.
RDSA	CSECT
	EXTREF	LENGHT, BUFFER
	CLEAR	X
	+LDT	LENGHT
WLOOP	TD	OUTPUT
	JEQ	WLOOP
	+LDCH	BUFFER,X
	WD	OUTPUT
	TIXR	T
	JLT	WLOOP
	RSUB
OUTPUT	BYTE	X'05'
	END	FIRST