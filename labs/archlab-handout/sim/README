/***********************************************************************
 * Y86-64 Tools (Student Distribution)
 *
 * Copyright (c) 2002, 2010, 2015, R. Bryant and D. O'Hallaron,
 * All rights reserved. May not be used, modified, or copied
 * without permission.
 ***********************************************************************/ 

This directory contains the student distribution of the Y86-64 tools.  It
is a proper subset of the master distribution, minus the solution
files found in the master distribution.

yas		Y86-64 assembler
yis		Y86-64 instruction (ISA) simulator 
hcl2c		HCL to C translator
hcl2v		HCL to Verilog translator
ssim		SEQ simulator
ssim+		SEQ+ simulator
psim		PIPE simulator

*************************
1. Building the Y86-64 tools
*************************

The Y86-64 simulators can be configured to support TTY and GUI
interfaces. A simulator running in TTY mode prints all information
about its run-time behavior on the terminal.  It's harder to understand what's
going on, but useful for automated testing, and doesn't require any
special installation features.  A simulator running in GUI mode uses a
fancy graphical user interface.  Nice for visualizing and debugging,
but requires installation of Tcl/Tk on your system.

To build the Y86-64 tools, perform the following steps:

NOTE: If your instructor prepared this distribution for you, then you
can skip Step 1 and proceed directly to Step 2. The Makefile will
already have the proper values for GUIMODE, TKLIBS, and TKINC for your
system.

Step 1. Decide whether you want the TTY or GUI form of the simulators,
and then modify ./Makefile in this directory accordingly. (The changes
you make to the variables in this Makefile will override the values
already assigned in the Makefiles in the seq and pipe directories.)

Building the GUI simulators: If you have Tcl/Tk installed on your
system, then you can build the GUI form by initializing the GUIMODE,
TKLIBS, and TKINC variables, as appropriate for your system. (The
default values work for Linux systems.) 

Assigning GUIMODE=-DHAS_GUI causes the necessary GUI support code in
the simulator sources to be included.  The TKLIBS variable tells gcc
where to look for the libtcl.so and libtk.so libraries. And the TKINC
variable tells gcc where to find the tcl.h and tk.h header files.

Building the TTY simulators: If you don't have Tcl/Tk installed on
your system, then build the TTY form by commenting out all three of
these variables (GUIMODE, TKLIBS, and TKINC) in the Makefile.

Step 2: Once you've modified the Makefile to build either the GUI or
TTY form, then you can construct the entire set of Y86-64 tools by typing 

	unix> make clean; make

********
2. Files
********

Makefile
	Builds the Y86-64 tools

README
	This file

misc/	
	Source files for the Y86-64 assembler yas, the Y86-64 instruction
	simulator yis, and the isa.c file that is used by the -t option
	of the processor simulators to check the results against the
	ISA simulation.  Also contains files for the programs
	hcl2c and hcl2v

seq/	
	Code for the SEQ and SEQ+ simulators.  Contains HCL files for
	labs and homework problems that involve modifying SEQ.

pipe/	
	Code for the PIPE simulator.  Contains HCL files for labs and
	homework problems that involve modifying PIPE.

y86-code/
	Example .ys files from CS:APP and scripts for conducting
	automated benchmark teseting of the new processor designs.

ptest/
	Automated regression testing scripts for testing processor designs.

verilog/
	System for producing Verilog designs from HCL code
