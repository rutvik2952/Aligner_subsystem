`ifndef ALIGNER_SEQUENCE_PACKAGE_SV
`define ALIGNER_SEQUENCE_PACKAGE_SV

 package aligner_seq_pkg;

   `include"uvm_macros.svh"
   import uvm_pkg::*;
   import apb_pkg::*;
   import aligner_env_pkg::*;
   `include"apb_base_sequence.sv"
   `include"aligner_virtual_sequence.sv"
 
 endpackage

`endif // ALIGNER_SEQUENCE_PACKAGE_SV    
