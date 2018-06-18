
OPTS = /nologo /Gd /ML
DEFS = /DWIN32
CFLAGSREL = $(OPTS) $(DEFS)

hello.dll : dll.h hello.c
	cl hello.c $(CFLAGSREL) /LD

clean :
	del *.exe *.obj
