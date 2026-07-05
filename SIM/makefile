lib:
	vlib work
remove:
	rm -rf work/

## Aligner IP 
rtl = ../DUT/cfs_synch.sv\
      ../DUT/cfs_synch_fifo.sv\
      ../DUT/cfs_rx_ctrl.sv\
      ../DUT/cfs_ctrl.sv\
      ../DUT/cfs_tx_ctrl.sv\
      ../DUT/cfs_edge_detect.sv\
      ../DUT/cfs_regs.sv\
      ../DUT/cfs_aligner_core.sv\
      ../DUT/cfs_aligner.sv

## TB Package
apb_package = ../ENV/APB_UVC/apb_pkg.sv
env_package = ../ENV/aligner_package.sv
seq_package = ../SEQ_LIB/aligner_sequence_package.sv
test_package = ../TEST/aligner_top_pkg.sv
aligner_package = $(apb_package) $(env_package) $(seq_package) $(test_package)


##Project Directory
PROJ_DIR = +incdir+../COMMON\
	   +incdir+../ENV\
           +incdir+../SEQ_LIB\
	   +incdir+../TEST

## TOP Module
TOP = ../TOP/aligner_top.sv

##TEST
TEST1 =aligner_base_test
 

# Compile Subsystem
comp:
	vlog $(rtl) $(aligner_package) $(TOP) $(PROJ_DIR) 
      
sanity :
	vsim aligner_tb_top -l LOG/$(TEST1).log -wlf $(TEST1).wlf -c -do "run -all;exit" +UVM_TESTNAME=$(TEST1)      	
