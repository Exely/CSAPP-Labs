##########################################################################
# Parsing of command line flags                                          #
##########################################################################

proc flagVal {flag default} {
    global argv
    foreach t $argv {
	if {[string match "-$flag*" $t]} {return [string range $t 2 end]}
    }
    return $default
}

proc findFlag {flag} {
    global argv
    foreach t $argv {
	if {[string match "-$flag" $t]} {return 1}
    }
    return 0
}

##########################################################################
# Register File Implementation.  Shown as array of 3 X 5                 #
##########################################################################


# Font used to display register contents
set fontSize [expr 10 * [flagVal "f" 12]]
set codeFontSize [expr 10 * [flagVal "c" 10]]
set labFontSize [expr 10 * [flagVal "l" 10]]
set bigFontSize [expr 10 * [flagVal "b" 16]]
set dpyFont "*-courier-medium-r-normal--*-$fontSize-*-*-*-*-*-*"
set labFont "*-helvetica-medium-r-normal--*-$labFontSize-*-*-*-*-*-*"
set bigLabFont "*-helvetica-bold-r-normal--*-$bigFontSize-*-*-*-*-*-*"
set codeFont "*-courier-medium-r-normal--*-$codeFontSize-*-*-*-*-*-*"
# Background Color of normal register
set normalBg white
# Background Color of highlighted register
set specialBg LightSkyBlue

# Height of titles separating major sections of control panel
set sectionHeight 2


# How many rows of code do I display
set codeRowCount [flagVal "r" 50]

# Keep track of previous highlighted register
set lastId -1
proc setReg {id val highlight} {
    global lastId normalBg specialBg
    if {$lastId >= 0} {
	.r.reg$lastId config -bg $normalBg
	set lastId -1
    }
    if {$id < 0 || $id >= 15} {
	error "Invalid Register ($id)"
    }
    .r.reg$id config -text [format %16x $val]
    if {$highlight} {
	uplevel .r.reg$id config -bg $specialBg
	set lastId $id
    }
}

# Clear all registers
proc clearReg {} {
    global lastId normalBg
    if {$lastId >= 0} {
	.r.reg$lastId config -bg $normalBg
	set lastId -1
    } 
    for {set i 0} {$i < 8} {incr i 1} {
	.r.reg$i config -text ""
    }
}

# Set all 3 condition codes
proc setCC {zv cv ov} {
    .cc.cc0 config -text [format %d $zv]
    .cc.cc1 config -text [format %d $cv]
    .cc.cc2 config -text [format %d $ov]
}

# Set CPI display
proc showCPI {cycles instructions cpi} {
    .cpi.cyc config -text [format %d $cycles]
    .cpi.instr config -text [format %d $instructions]
    .cpi.cpi config -text [format %.2f $cpi]
}

# Set status display
proc showStat {s} {
    .stat.val config -text $s
}

##############################################################################
# CPI Display
##############################################################################
# Create Window for CPI display 
frame .cpi
pack .cpi -in . -side bottom

label .cpi.lab -text "Performance" -font $bigLabFont -height $sectionHeight
pack .cpi.lab -in .cpi -side left

label .cpi.clab -text "Cycles" -font $labFont
pack .cpi.clab -in .cpi -side left
label .cpi.cyc -text "0" -width 6 -font $dpyFont -relief ridge -bg $normalBg
pack .cpi.cyc -in .cpi -side left

label .cpi.ilab -text "Instructions" -font $labFont
pack .cpi.ilab -in .cpi -side left
label .cpi.instr -text "0" -width 6 -font $dpyFont -relief ridge -bg $normalBg
pack .cpi.instr -in .cpi -side left

label .cpi.cpilab -text "CPI" -font $labFont
pack .cpi.cpilab -in .cpi -side left
label .cpi.cpi -text "1.0" -width 5 -font $dpyFont -relief ridge -bg $normalBg
pack .cpi.cpi -in .cpi -side left

##############################################################################
# Status Display                                                             #
##############################################################################
# Create Window for processor status (packed next to condition codes)
frame .stat
pack .stat -in . -side bottom

label .stat.lab -text "Stat"  -width 7 -font $bigLabFont -height $sectionHeight
label .stat.val -width 3 -font $dpyFont -relief ridge -bg $normalBg
label .stat.fill -width 6 -text ""
pack .stat.lab .stat.val .stat.fill -in .stat -side left


##############################################################################
# Condition Code Display                                                     #
##############################################################################
# Create Window for condition codes
frame .cc
pack .cc -in .stat -side left

label .cc.lab -text "Condition Codes"  -font $bigLabFont -height $sectionHeight
pack .cc.lab -in .cc -side left


set ccnames [list "Z" "S" "O"]

# Create Row of CC Labels
for {set i 0} {$i < 3} {incr i 1} {
    label .cc.lab$i -width 1 -font $dpyFont -text [lindex $ccnames $i]
    pack .cc.lab$i -in .cc -side left
    label .cc.cc$i -width 1 -font $dpyFont -relief ridge -bg $normalBg
    pack .cc.cc$i -in .cc -side left
}

##############################################################################
# Register Display                                                           #     
##############################################################################


# Create Window for registers
frame .r
pack .r -in . -side bottom
# Following give separate window for register file
# toplevel .r
# wm title .r "Register File"
label .r.lab -text "Register File" -font $bigLabFont -height $sectionHeight
pack .r.lab -in .r -side top
# Set up top row control panel (disabled)
# frame .r.cntl
# pack .r.cntl -fill x -in .r
# label .r.labreg -text "Register" -width 10
# entry .r.regid -width 3 -relief sunken -textvariable regId -font $dpyFont
# label .r.labval -text "Value" -width 10
# entry .r.regval -width 8 -relief sunken -textvariable regVal -font $dpyFont
# button .r.doset -text "Set" -command {setReg $regId $regVal 1} -width 6
# button .r.c -text "Clear" -command clearReg -width 6
# pack .r.labreg .r.regid .r.labval .r.regval .r.doset .r.c  -in .r.cntl -side left

set regnames [list "%rax" "%rcx" "%rdx" "%rbx" "%rsp" "%rbp" "%rsi" "%rdi" "%r8 " "%r9 " "%r10" "%r11" "%r12" "%r13" "%r14" ""]

# Create rows of register labels and displays
for {set j 0} {$j < 3} {incr j 1} {
    frame .r.labels$j
    pack .r.labels$j -side top -in .r

    for {set c 0} {$c < 5} {incr c 1} {
	set i [expr $j * 5 + $c]
	label .r.lab$i -width 16 -font $dpyFont -text [lindex $regnames $i]
	pack .r.lab$i -in .r.labels$j -side left
    }

    # Create Row of Register Entries
    frame .r.row$j
    pack .r.row$j -side top -in .r

    # Create 5 registers
    for {set c 0} {$c < 5} {incr c 1} {
	set i [expr $j * 5 + $c]
	if {$i == 15} {
	    label .r.reg$i -width 16 -font $dpyFont -text ""
	} else {
	    label .r.reg$i -width 16 -font $dpyFont -relief ridge \
		-bg $normalBg
	}
	pack .r.reg$i -in .r.row$j -side left
    }

}


##############################################################################
#  Main Control Panel                                                        #
##############################################################################
#
# Set the simulator name (defined in simname in ssim.c) 
# as the title of the main window
#
wm title . $simname

# Control Panel for simulator
set cntlBW 12
frame .cntl
pack .cntl
button .cntl.quit -width $cntlBW -text Quit -command exit
button .cntl.run -width $cntlBW -text Go -command simGo
button .cntl.stop -width $cntlBW -text Stop -command simStop
button .cntl.step -width $cntlBW -text Step -command simStep
button .cntl.reset -width $cntlBW -text Reset -command simResetAll
pack .cntl.quit .cntl.run .cntl.stop .cntl.step .cntl.reset -in .cntl -side left
# Simulation speed control
scale .spd -label {Simulator Speed (10*log Hz)} -from -10 -to 30 -length 10c \
  -orient horizontal -command setSpeed
pack .spd

# Simulation mode 
set simMode forward

frame .md
### Old Simulation mode stuff
#pack .md
#radiobutton .md.wedged -text Wedged -variable simMode \
#	-value wedged -width 10 -command {setSimMode wedged}
#radiobutton .md.stall -text Stall -variable simMode \
#	-value stall -width 10 -command {setSimMode stall}
#radiobutton .md.forward -text Forward -variable simMode \
#	-value forward -width 10 -command {setSimMode forward}
#pack .md.wedged .md.stall .md.forward -in .md -side left


# simDelay defines number of milliseconds for each cycle of simulator
# Initial value is 1000ms
set simDelay 1000
# Set delay based on rate expressed in log(Hz)
proc setSpeed {rate} {
  global simDelay
  set simDelay [expr round(1000 / pow(10,$rate/10.0))]
}

# Global variables controlling simulator execution
# Should simulator be running now?
set simGoOK 0

proc simStop  {} {
  global simGoOK
  set simGoOK 0
}

proc simStep {} {
    global simStat
    set simStat [simRun 1]
}

proc simGo {} {
    global simGoOK simDelay simStat
    set simGoOK 1
    # Disable the Go and Step buttons
    # Enable the Stop button
    while {$simGoOK} {
	# run the simulator 1 cycle
	after $simDelay
	set simStat [simRun 1]
	if {$simStat != "AOK" && $simStat != "BUB"} {set simGoOK 0}
	update
    }
    # Disable the Stop button
    # Enable the Go and Step buttons
}

##############################################################################
#  Pipe Register Display                                                     #
##############################################################################

# Colors for Highlighting Data Sources
set valaBg LightPink
set valbBg PaleGreen1

# Overall width of pipe register display
set pipeWidth 72
set pipeHeight 2
set labWidth 5

# Add labeled display to window 
proc addDisp {win width name} {
    global dpyFont labFont
    set lname [string tolower $name]
    frame $win.$lname
    pack $win.$lname -in $win -side left
    label $win.$lname.t -text $name -font $labFont
    label $win.$lname.n -width $width -font $dpyFont -bg lightgray -fg Black
    label $win.$lname.c -width $width -font $dpyFont -bg white -relief ridge
    pack $win.$lname.t $win.$lname.c $win.$lname.n -in $win.$lname -side top
    return [list $win.$lname.n $win.$lname.c]
}

# Set text in display row
proc setDisp {wins txts} {
    for {set i 0} {$i < [llength $wins] && $i < [llength $txts]} {incr i} {
	set win [lindex $wins $i]
	set txt [lindex $txts $i]
	$win config -text $txt
    }
}

frame .p -width $pipeWidth 
pack .p -in . -side bottom
label .p.lab -text "Pipeline Registers" -font $bigLabFont -height $sectionHeight
pack .p.lab -in .p -side top
label .p.mem -text "Memory Stage" -height $pipeHeight -width $pipeWidth -bg NavyBlue -fg White -font $bigLabFont
label .p.ex -text "Execute Stage" -height $pipeHeight -width $pipeWidth -bg NavyBlue -fg White -font $bigLabFont
label .p.id -text "Decode Stage" -height $pipeHeight -width $pipeWidth -bg NavyBlue -fg White -font $bigLabFont
label .p.if -text "Fetch Stage" -height $pipeHeight -width $pipeWidth -bg NavyBlue -fg White -font $bigLabFont
frame .p.mw 
frame .p.em
frame .p.de
frame .p.fd
frame .p.pc
frame .p.e
pack .p.mw .p.mem .p.em .p.ex .p.e .p.de .p.id .p.fd .p.if .p.pc -in .p -side top -anchor w -expand 1

proc addLabel { win nstage cstage } {
    global labWidth labFont bigLabFont
    frame $win.lab
    label $win.name -text "$cstage" -width $labWidth -font $bigLabFont
    pack $win.name -in $win.lab -side left

    label $win.lab.t  -text " " -font $labFont 
    label $win.lab.n -width $labWidth  -text "Input" -anchor w
    label $win.lab.c -width $labWidth  -text "State" -anchor w
    pack  $win.lab.t $win.lab.c $win.lab.n -in $win.lab -side top
    pack $win.lab -in $win -side left
}

addLabel .p.mw M W
addLabel .p.em E M
addLabel .p.de D E
addLabel .p.fd F D
addLabel .p.pc "" F

proc addFill { win w } {
    frame $win.fill
    label $win.fill.t -text "" -width $w -bg lightgray
    label $win.fill.n -bg white -text "" -width $w -bg lightgray
    label $win.fill.c -bg white -text "" -width $w -bg lightgray
    pack $win.fill.c $win.fill.t $win.fill.n -in $win.fill -side top -expand 1
    pack $win.fill -in $win -side right -expand 1
}

addFill .p.mw 0
addFill .p.de 0
addFill .p.fd 0
addFill .p.pc 0

# Take list of lists, and transpose nesting
# Assumes all lists are of same length
proc ltranspose {inlist} {
    set result {}
    for {set i 0} {$i < [llength [lindex $inlist 0]]} {incr i} {
	set nlist {}
	for {set j 0} {$j < [llength $inlist]} {incr j} {
	    set ele [lindex [lindex $inlist $j] $i]
	    set nlist [concat $nlist [list $ele]]
	}
	set result [concat $result [list $nlist]]
    }
    return $result
}

# Fields in F display
# Total size = 3+16 = 19
set pwins(F) [ltranspose [list [addDisp .p.pc 3 Stat] \
                                [addDisp .p.pc 16 predPC]]]

# Fields in D display
# Total size = 3+6+4+4+16+16 = 49
set pwins(D) [ltranspose \
           [list [addDisp .p.fd 3 Stat]   \
	         [addDisp .p.fd 6 Instr] \
	         [addDisp .p.fd 4 rA] \
	         [addDisp .p.fd 4 rB] \
                 [addDisp .p.fd 16 valC] \
		 [addDisp .p.fd 16 valP]]] 

# Fields in E Display
# Total size = 3+6+16+16+16+4+4+4+4 = 73
set pwins(E) [ltranspose \
           [list [addDisp .p.de 3 Stat] \
	         [addDisp .p.de 6 Instr] \
		 [addDisp .p.de 16 valC] \
		 [addDisp .p.de 16 valA] \
		 [addDisp .p.de 16 valB] \
		 [addDisp .p.de 4 dstE] \
		 [addDisp .p.de 4 dstM] \
		 [addDisp .p.de 4 srcA] \
		 [addDisp .p.de 4 srcB]]]

# Fields in M Display
# Total size = 3+6+3+16+16+4+4 = 52
set pwins(M) [ltranspose \
           [list [addDisp .p.em 3 Stat] \
	         [addDisp .p.em 6 Instr] \
	         [addDisp .p.em 3 Cnd] \
		 [addDisp .p.em 16 valE] \
		 [addDisp .p.em 16 valA] \
		 [addDisp .p.em 4 dstE] \
		 [addDisp .p.em 4 dstM]]]
# Fields in W display
# Total size = 3+6+16+16+4+4 = 49
set pwins(W) [ltranspose \
           [list [addDisp .p.mw 3 Stat] \
	         [addDisp .p.mw 6 Instr] \
		 [addDisp .p.mw 16 valE] \
		 [addDisp .p.mw 16 valM] \
		 [addDisp .p.mw 4 dstE] \
		 [addDisp .p.mw 4 dstM]]]

# update status line for specified pipe register
proc updateStage {name current txts} {
    set Name [string toupper $name]
    global pwins
    set wins [lindex $pwins($Name) $current]
    setDisp $wins $txts
}   

# Create Array of windows corresponding to data sources
set rwins(wm) .p.mw.valm.c
set rwins(we) .p.mw.vale.c
set rwins(me) .p.em.vale.c
set rwins(ea) .p.de.vala.c
set rwins(eb) .p.de.valb.c

# Highlight Data Source Registers for valA, valB
proc showSources { a b } {
    global rwins valaBg valbBg 
    # Set them all to white
    foreach w [array names rwins] {
	$rwins($w) config -bg White
    }
    if {$a != "none"} { $rwins($a) config -bg $valaBg }
    if {$b != "none"} { $rwins($b) config -bg $valbBg }

    # Indicate forwarding destinations by their color
    .p.de.vala.t config -bg $valaBg
    .p.de.valb.t config -bg $valbBg
}

##########################################################################
#                    Instruction Display                                 #
##########################################################################

toplevel .c
wm title .c "Program Code"
frame .c.cntl 
pack .c.cntl -in .c -side top -anchor w
label .c.filelab -width 10 -text "File"
entry .c.filename -width 20 -relief sunken -textvariable codeFile \
	-font $dpyFont -bg white
button .c.loadbutton -width $cntlBW -command {loadCode $codeFile} -text Load
pack .c.filelab .c.filename .c.loadbutton -in .c.cntl -side left

proc clearCode {} {
    simLabel {} {}
    destroy .c.t
    destroy .c.tr
}

proc createCode {} {
    # Create Code Structure
    frame .c.t
    pack .c.t -in .c -side top -anchor w
    # Support up to 4 columns of code, each $codeRowCount lines long
    frame .c.tr
    pack .c.tr -in .c.t -side top -anchor nw
}

proc loadCode {file} {
    # Kill old code window
    clearCode
    # Create new one
    createCode
    simCode $file
    simResetAll
}

# Start with initial code window, even though it will be destroyed.
createCode

# Add a line of code to the display
proc addCodeLine {line addr op text} {
    global codeRowCount
    # Create new line in display
    global codeFont
    frame .c.tr.$addr
    pack .c.tr.$addr -in .c.tr -side top -anchor w
    label .c.tr.$addr.a -width 6 -text [format "0x%x" $addr] -font $codeFont
    label .c.tr.$addr.i -width 20 -text $op -font $codeFont 
    label .c.tr.$addr.s -width 2 -text "" -font $codeFont -bg white
    label .c.tr.$addr.t -text $text -font $codeFont
    pack .c.tr.$addr.a .c.tr.$addr.i .c.tr.$addr.s \
	    .c.tr.$addr.t -in .c.tr.$addr -side left
}

# Keep track of which instructions have stage labels

set oldAddr {}

proc simLabel {addrs labs} {
    global oldAddr
    set newAddr {}
    # Clear away any old labels
    foreach a $oldAddr {
	.c.tr.$a.s config -text ""
    }
    for {set i 0} {$i < [llength $addrs]} {incr i} {
	set a [lindex $addrs $i]
	set t [lindex $labs $i]
	if {[winfo exists .c.tr.$a]} {
	    .c.tr.$a.s config -text $t
	    set newAddr [concat $newAddr $a]
	}
    }
    set oldAddr $newAddr
}

proc simResetAll {} {
    global simStat
    set simStat "AOK"
    simReset
    clearMem
    simLabel {} {}
}

###############################################################################
#    Memory Display                                                           #
###############################################################################
toplevel .m
wm title .m "Memory Contents"
frame .m.t
pack .m.t -in .m -side top -anchor w

label .m.t.lab -width 6 -font $dpyFont -text "      "
pack .m.t.lab -in .m.t -side left
for {set i 0} {$i < 16} {incr i 8} {
    label .m.t.a$i -width 16 -font $dpyFont -text [format "  0x---%x" [expr $i % 16]]
    pack .m.t.a$i -in .m.t -side left
}


# Keep track of range of addresses currently displayed
set minAddr 0
set memCnt  0
set haveMem 0

proc createMem {nminAddr nmemCnt} {
    global minAddr memCnt haveMem codeFont dpyFont normalBg
    set minAddr $nminAddr
    set memCnt $nmemCnt

    if { $haveMem } { destroy .m.e }

    # Create Memory Structure
    frame .m.e
    set haveMem 1
    pack .m.e -in .m -side top -anchor w
    # Now fill it with values
    for {set i 0} {$i < $memCnt} {incr i 16} {
	set addr [expr $minAddr + $i]

	frame .m.e.r$i
	pack .m.e.r$i -side bottom -in .m.e
	label .m.e.r$i.lab -width 6 -font $dpyFont -text [format "0x%.3x-"  [expr $addr / 16]]
	pack .m.e.r$i.lab -in .m.e.r$i -side left

	for {set j 0} {$j < 16} {incr j 8} {
	    set a [expr $addr + $j]
	    label .m.e.v$a -width 16 -font $dpyFont -relief ridge \
                -bg $normalBg
	    pack .m.e.v$a -in .m.e.r$i -side left
	}
    }
}

proc setMem {Addr Val} {
    global minAddr memCnt
    if {$Addr < $minAddr || $Addr > [expr $minAddr + $memCnt]} {
	error "Memory address $Addr out of range"
    }
    .m.e.v$Addr config -text [format %16x $Val]
}

proc clearMem {} {
    destroy .m.e
    createMem 0 0
}



###############################################################################
#    Command Line Initialization                                              #
###############################################################################

# Get code file name from input

# Find file with specified extension
proc findFile {tlist ext} {
    foreach t $tlist {
	if {[string match "*.$ext" $t]} {return $t}
    }
    return ""
}


set codeFile [findFile $argv yo]
if {$codeFile != ""} { loadCode $codeFile}
