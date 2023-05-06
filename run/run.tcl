read_verilog ../src/top.v
read_verilog ../src/test_unit.v

#exec echo "Starting Testing" >ts.log

set fp [ open ./results "a" ]
puts $fp ""
puts $fp ""
puts $fp "---------------------------------------AMD Vivado Benchmark-----------------------------------"
puts $fp "|Thread     |synth_design	  |opt_design     |place_design       |route_design   |total      |" 
puts $fp "|-----------|---------------|---------------|-------------------|---------------|-----------|" 


foreach i {1 2 4} {
set ts_total 0
set_param general.maxThreads $i
puts -nonewline $fp "| $i "

set ts_start [exec date +%s]
#synth_design -top top -part xcvu095-ffvc2104-2-i -generic SUB_MODULE=1999
synth_design -top top -part xcvu095-ffvc2104-2-i -generic SUB_MODULE=19

set ts_end [exec date +%s]
set ts_int [expr $ts_end - $ts_start]

puts -nonewline $fp  "| $ts_int "

set ts_total [expr $ts_int + $ts_total]




set ts_start [exec date +%s]
opt_design
set ts_end [exec date +%s]
set ts_int [ expr $ts_end - $ts_start]

puts -nonewline $fp  "|   $ts_int" 

set ts_total [expr $ts_int + $ts_total]





set ts_start [exec date +%s]
place_design
set ts_end [exec date +%s]
set ts_int [ expr $ts_end - $ts_start]

puts -nonewline $fp  "|   $ts_int" 

set ts_total [expr $ts_int + $ts_total]






set ts_start [exec date +%s]
route_design
set ts_end [exec date +%s]
set ts_int [ expr $ts_end - $ts_start]

puts -nonewline $fp  "|   $ts_int"

set ts_total [expr $ts_int + $ts_total]





puts $fp  "|  $ts_total |  " 

}

close $fp 


exit
