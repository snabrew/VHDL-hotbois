#clock
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]

#timing indicator
set_property PACKAGE_PIN V7 [get_ports {ind}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ind}]


#seven-segment LED display
        set_property PACKAGE_PIN W7 [get_ports {LED_out[6]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {LED_out[6]}]
        set_property PACKAGE_PIN W6 [get_ports {LED_out[5]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {LED_out[5]}]
        set_property PACKAGE_PIN U8 [get_ports {LED_out[4]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {LED_out[4]}]
        set_property PACKAGE_PIN V8 [get_ports {LED_out[3]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {LED_out[3]}]
        set_property PACKAGE_PIN U5 [get_ports {LED_out[2]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {LED_out[2]}]
        set_property PACKAGE_PIN V5 [get_ports {LED_out[1]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {LED_out[1]}]
        set_property PACKAGE_PIN U7 [get_ports {LED_out[0]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {LED_out[0]}]
            
#anode_out
        set_property PACKAGE_PIN U2 [get_ports {anode_out[0]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {anode_out[0]}]
        set_property PACKAGE_PIN U4 [get_ports {anode_out[1]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {anode_out[1]}]
        set_property PACKAGE_PIN V4 [get_ports {anode_out[2]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {anode_out[2]}]
        set_property PACKAGE_PIN W4 [get_ports {anode_out[3]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {anode_out[3]}]
