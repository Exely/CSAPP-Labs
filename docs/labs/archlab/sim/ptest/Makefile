SIM=../pipe/psim
TFLAGS=

ISADIR = ../misc
YAS=$(ISADIR)/yas

.SUFFIXES: .ys .yo

.ys.yo:
	$(YAS) $*.ys

test:
	./optest.pl -s $(SIM) $(TFLAGS)
	./jtest.pl -s $(SIM) $(TFLAGS)
	./ctest.pl -s $(SIM) $(TFLAGS)
	./htest.pl -s $(SIM) $(TFLAGS)

clean:
	rm -f *.o *~ *.yo *.ys

