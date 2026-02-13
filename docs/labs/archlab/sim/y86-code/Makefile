CC=gcc
CFLAGS=-Wall -O2

ISADIR = ../misc
YAS=$(ISADIR)/yas
YIS=$(ISADIR)/yis
PIPE=../pipe/psim
SEQ=../seq/ssim
SEQ+ =../seq/ssim+

YOFILES = abs-asum-cmov.yo abs-asum-jmp.yo asum.yo asumr.yo asumi.yo cjr.yo j-cc.yo poptest.yo pushquestion.yo pushtest.yo prog1.yo prog2.yo prog3.yo prog4.yo prog5.yo prog6.yo prog7.yo prog8.yo prog9.yo prog10.yo ret-hazard.yo

PIPEFILES = asum.pipe asumr.pipe cjr.pipe j-cc.pipe poptest.pipe pushquestion.pipe pushtest.pipe prog1.pipe prog2.pipe prog3.pipe prog4.pipe prog5.pipe prog6.pipe prog7.pipe prog8.pipe ret-hazard.pipe

SEQFILES = asum.seq asumr.seq cjr.seq j-cc.seq poptest.seq pushquestion.seq pushtest.seq prog1.seq prog2.seq prog3.seq prog4.seq prog5.seq prog6.seq prog7.seq prog8.seq ret-hazard.seq

SEQ+FILES = asum.seq+ asumr.seq+ cjr.seq+ j-cc.seq+ poptest.seq+ pushquestion.seq+ pushtest.seq+ prog1.seq+ prog2.seq+ prog3.seq+ prog4.seq+ prog5.seq+ prog6.seq+ prog7.seq+ prog8.seq+ ret-hazard.seq+

.SUFFIXES:
.SUFFIXES: .c .s .o .ys .yo .yis .pipe .seq .seq+

all: $(YOFILES) 

test: testpsim testssim testssim+

testpsim: $(PIPEFILES)
	grep "ISA Check" *.pipe
	rm $(PIPEFILES)

testssim: $(SEQFILES)
	grep "ISA Check" *.seq
	rm $(SEQFILES)

testssim+: $(SEQ+FILES)
	grep "ISA Check" *.seq+
	rm $(SEQ+FILES)

.ys.yo:
	$(YAS) $*.ys

.yo.yis: $(YIS)
	$(YIS) $*.yo > $*.yis

.yo.pipe: $(PIPE)
	$(PIPE) -t $*.yo > $*.pipe

.yo.seq: $(SEQ)
	$(SEQ) -t $*.yo > $*.seq

.yo.seq+: $(SEQ+)
	$(SEQ+) -t $*.yo > $*.seq+

clean:
	rm -f *.o *.yis *~ *.yo *.pipe *.seq *.seq+ core
