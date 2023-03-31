## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]       
 set_property IOSTANDARD LVCMOS33 [get_ports clk]

## power indicator light
set_property PACKAGE_PIN U16 [get_ports onoff]                    
   set_property IOSTANDARD LVCMOS33 [get_ports onoff]

set_property PACKAGE_PIN V7 [get_ports {ind}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ind}]

## reset button
set_property PACKAGE_PIN W16 [get_ports reset]                    
   set_property IOSTANDARD LVCMOS33 [get_ports reset]

## U and D buttons
set_property PACKAGE_PIN V17 [get_ports U]                    
   set_property IOSTANDARD LVCMOS33 [get_ports U] 
               
set_property PACKAGE_PIN V16 [get_ports D]                    
   set_property IOSTANDARD LVCMOS33 [get_ports D]

## 7-segment display
set_property PACKAGE_PIN W7 [get_ports {seg[6]}]                    
   set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]
set_property PACKAGE_PIN W6 [get_ports {seg[5]}]                    
   set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]
set_property PACKAGE_PIN U8 [get_ports {seg[4]}]                    
   set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]
set_property PACKAGE_PIN V8 [get_ports {seg[3]}]                    
   set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]
set_property PACKAGE_PIN U5 [get_ports {seg[2]}]                    
   set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]
set_property PACKAGE_PIN V5 [get_ports {seg[1]}]                    
   set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]
set_property PACKAGE_PIN U7 [get_ports {seg[0]}]                    
   set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]
set_property PACKAGE_PIN U2 [get_ports {AN[0]}]                    
   set_property IOSTANDARD LVCMOS33 [get_ports {AN[0]}]
set_property PACKAGE_PIN U4 [get_ports {AN[1]}]                    
   set_property IOSTANDARD LVCMOS33 [get_ports {AN[1]}]
set_property PACKAGE_PIN V4 [get_ports {AN[2]}]               
   set_property IOSTANDARD LVCMOS33 [get_ports {AN[2]}]
set_property PACKAGE_PIN W4 [get_ports {AN[3]}]          
   set_property IOSTANDARD LVCMOS33 [get_ports {AN[3]}]
   
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]  