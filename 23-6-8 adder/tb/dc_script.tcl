
set sb_home "/mnt/hgfs/virtual_share"
set search_path "$sb_home/my_ic_lib/lib/logic   $sb_home/ic_lab3"  
 #设置搜索路径

set target_library " slow.db "     
#设置标准元件库
set link_library   "* $target_library "
set symbol_library " smic18.sdb "  
#设置标准元件图标库

set access_internal_pins true

set report_path "./reports"    
#设置reports文件夹
set output_path "./outputs"    
#设置outputs文件夹


read_file -format VHDL full_adder.vhd 
read_file -format VHDL bit_adder.vhd 
#读取verilog设计文件
# read_file -format verilog divider64.v


current_design FullAdder_64bit   
#指明主程序
link   
#工艺库链接
uniquify


set     design_name     [get_object_name [current_design]]

set_wire_load_model -name "smic18_wl10"    
#设置线负载模型
set_wire_load_mode top

#############################
set clock_period1 5
set chip_area 0
#############################
create_clock -period $clock_period1 -name clk


set_clock_uncertainty -setup 0.5 clk
set_clock_uncertainty -hold 0.5 clk

set_input_delay 0.5 -clock clk [all_inputs]
set_output_delay 0.5 -clock clk [all_outputs]

set_max_area $chip_area
set_max_fanout 100 [get_designs FullAdder_64bit]
#################################
set auto_wire_load_selection true
########################

#设置输出延时35ns
set_load          1        [all_outputs]    
#设置输出负载为1pFS





# check_design > $report_path/check_design_before_compile.rpt
# check_timing > $report_path/check_timing_before_compile.rpt


compile
# compile -incremental_mapping -map_effort high
# 更加努力的去达到约束的目标


write_sdf -version 2.1         $output_path/${design_name}_post_dc.sdf   
#时序描述

write -f ddc -hier -output     $output_path/${design_name}_post_dc.ddc
write -f verilog -hier -output $output_path/${design_name}_post_dc.v
    #网表
write_sdc                      $output_path/${design_name}_post_dc.sdc  
#约束

report_constraint -all_violators -verbose          > $report_path/constraint.rpt
report_qor                > $report_path/qor.rpt
report_power              > $report_path/power.rpt
report_area               > $report_path/area.rpt
report_cell               > $report_path/cell.rpt
report_clock              > $report_path/clk.rpt
report_hierarchy          > $report_path/hierarchy.rpt
report_design             > $report_path/design.rpt
report_reference          > $report_path/reference.rpt
report_timing             > $report_path/timing.rpt

check_design > $report_path/check_design_post_compile.rpt
check_timing > $report_path/check_timing_post_compile.rpt


# start_gui
