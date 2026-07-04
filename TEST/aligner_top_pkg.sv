`ifndef ALIGNER_TOP_PACKAGE_SV
`define ALIGNER_TOP_PACKAGE_SV
 
 package aliger_top_pkg;

   `include"uvm_macros.svh"
   import uvm_pkg::*;

   import apb_pkg::*;
   import aligner_seq_pkg::*;
   import aligner_env_pkg::*;

  `include"aligner_base_test.sv"

 endpackage

`endif //ALIGNER_TOP_PACKAGE_SV    
