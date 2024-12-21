# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {E:/Submission Projects/Normal Nano processor/MicroP_test.cache/wt} [current_project]
set_property parent.project_path {E:/Submission Projects/Normal Nano processor/MicroP_test.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:basys3:part0:1.2 [current_project]
set_property ip_output_repo {e:/Submission Projects/Normal Nano processor/MicroP_test.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  {E:/Submission Projects/Normal Nano processor/MicroP_test.srcs/sources_1/imports/New folder/AddSub.vhd}
  {E:/Submission Projects/Normal Nano processor/MicroP_test.srcs/sources_1/imports/New folder/Adder_3_bit.vhd}
  {E:/Submission Projects/Normal Nano processor/MicroP_test.srcs/sources_1/imports/New folder/D_FF.vhd}
  {E:/Submission Projects/Normal Nano processor/MicroP_test.srcs/sources_1/imports/New folder/Decoder_2_to_4.vhd}
  {E:/Submission Projects/Normal Nano processor/MicroP_test.srcs/sources_1/imports/New folder/Decoder_3_to_8.vhd}
  {E:/Submission Projects/Normal Nano processor/MicroP_test.srcs/sources_1/imports/New folder/FA.vhd}
  {E:/Submission Projects/Normal Nano processor/MicroP_test.srcs/sources_1/imports/New folder/HA.vhd}
  {E:/Submission Projects/Normal Nano processor/MicroP_test.srcs/sources_1/imports/New folder/Inst_Decoder.vhd}
  {E:/Submission Projects/Normal Nano processor/MicroP_test.srcs/sources_1/imports/New folder/LUT_16_7.vhd}
  {E:/Submission Projects/Normal Nano processor/MicroP_test.srcs/sources_1/imports/New folder/MUX_2_1.vhd}
  {E:/Submission Projects/Normal Nano processor/MicroP_test.srcs/sources_1/imports/New folder/MUX_2_WAY_3_bit.vhd}
  {E:/Submission Projects/Normal Nano processor/MicroP_test.srcs/sources_1/imports/New folder/MUX_2_WAY_4_BIT.vhd}
  {E:/Submission Projects/Normal Nano processor/MicroP_test.srcs/sources_1/imports/New folder/Mux_8_to_1.vhd}
  {E:/Submission Projects/Normal Nano processor/MicroP_test.srcs/sources_1/imports/New folder/Mux_8_way_4.vhd}
  {E:/Submission Projects/Normal Nano processor/MicroP_test.srcs/sources_1/imports/New folder/PC.vhd}
  {E:/Submission Projects/Normal Nano processor/MicroP_test.srcs/sources_1/imports/New folder/REGISTER_BANK.vhd}
  {E:/Submission Projects/Normal Nano processor/MicroP_test.srcs/sources_1/imports/New folder/ROM.vhd}
  {E:/Submission Projects/Normal Nano processor/MicroP_test.srcs/sources_1/imports/New folder/Reg_D_FF.vhd}
  {E:/Submission Projects/Normal Nano processor/MicroP_test.srcs/sources_1/imports/New folder/Seven_Seg.vhd}
  {E:/Submission Projects/Normal Nano processor/MicroP_test.srcs/sources_1/imports/New folder/Slow_Clk.vhd}
  {E:/Submission Projects/Normal Nano processor/MicroP_test.srcs/sources_1/imports/New folder/M_P.vhd}
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/Acer/micro_processer/micro_processer.srcs/constrs_1/new/NP_CONSTRAIN.xdc
set_property used_in_implementation false [get_files C:/Users/Acer/micro_processer/micro_processer.srcs/constrs_1/new/NP_CONSTRAIN.xdc]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top M_P -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef M_P.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file M_P_utilization_synth.rpt -pb M_P_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
