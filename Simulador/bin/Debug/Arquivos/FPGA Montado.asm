FPGA	START	0
0000	RLOOP	TD	CHAVE			E32011
0003		JEQ	RLOOP			332FFA
0006		RD	CHAVE			DB200B
0009		WD	CHAVE			DF2008
000C		J	RLOOP			3F2FF1
000F		SVC	4			B040
0011	ZERO	WORD	0		000000
0014	CHAVE	BYTE	X'01'		01
	END	0