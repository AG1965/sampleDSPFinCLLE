OBJ_LIB = ANGO1
SRC_LIB = ANGO1

QOBJ_LIB = /QSYS.LIB/$(OBJ_LIB).LIB
QSRC_LIB = /QSYS.LIB/$(SRC_LIB).LIB
#------------------------------------------------------------------------------
# the first rule is the default rule
all:	DSPFs PGMs
	@echo "*** make $@ finished ***"

pre-build:
	system -i "ADDLIBLE $(OBJ_LIB)"

DSPFs:	$(QOBJ_LIB)/DSPDA1FM.FILE
	@echo "*** make $@ finished ***"

PGMs:	$(QOBJ_LIB)/DSPDA1.PGM
	@echo "*** make $@ finished ***"
#------------------------------------------------------------------------------
# explicit rules


#------------------------------------------------------------------------------
# implicit recipes to create objects
$(QOBJ_LIB)/%.FILE:	./QDSPSRC/%.DSPF
	system -i "CPYFRMSTMF FROMSTMF('./$<') TOMBR('/QSYS.LIB/$(SRC_LIB).LIB/QDSPSRC.FILE/$*.MBR') MBROPT(*REPLACE)"
	system -i "CRTDSPF FILE($(OBJ_LIB)/$*) SRCFILE($(SRC_LIB)/QDSPSRC) SRCMBR(*FILE)"

$(QOBJ_LIB)/%.PGM:	./QRPGLESRC/%.RPGLE
	system -i "CRTBNDRPG PGM($(OBJ_LIB)/$*) SRCSTMF('./$<') DBGVIEW(*ALL) REPLACE(*YES)"

$(QOBJ_LIB)/%.PGM:	./QCLLESRC/%.CLLE
	system -i "CRTBNDCL PGM($(OBJ_LIB)/$*) SRCSTMF('./$<') DBGVIEW(*ALL) REPLACE(*YES)"
	
$(QOBJ_LIB)/%.PGM:	./QRPGLESRC/%.SQLRPGLE
	system -i "CRTSQLRPGI OBJ($(OBJ_LIB)/$*) SRCSTMF('./$<') COMMIT(*NONE) OBJTYPE(*PGM) DBGVIEW(*LIST) REPLACE(*YES)"
           

