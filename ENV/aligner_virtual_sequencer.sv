`ifndef ALIGNER_VIRTUAL_SEQUENCER_SV
`define ALIGNER_VIRTUAL_SEQUENCER_SV

// typedef class apb_sequencer;
 //-----------------------------------------------------------------------------
 // class  : aligner_virtual_sequencer
 // parent : uvm_sequencer
 //-----------------------------------------------------------------------------
 class aligner_virtual_sequencer extends uvm_sequencer;

  //APB Sequencer
  apb_sequencer apb_seqr;

  //-----------------------------------------------------------------------
  // Factory Registration
  //----------------------------------------------------------------------- 
  `uvm_component_utils(aligner_virtual_sequencer)

  //-----------------------------------------------------------------
  // Method       : New
  // Argument     : name   -  string for instance name.
  //                parent - uvm_component for parent instance.
  // Description : This is the constructor function of this class.
  //-----------------------------------------------------------------
  function new(string name ="aligner_virtual_sequencer",uvm_component parent);
    super.new(name,parent);
  endfunction

 endclass

`endif //ALIGNER_VIRTUAL_SEQUENCER_SV
