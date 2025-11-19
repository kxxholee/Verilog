rm simv dump.vcd

iverilog -o simv -f filelist.f
vvp simv
gtkwave dump.vcd
