`ifndef ALIGNER_VIRTUAL_SEQUENCE_SV
`define ALIGNER_VIRTUAL_SEQUENCE_SV

  //-----------------------------------------------------------------------------
  // class  : aligner_virtual_sequence
  // parent : uvm_sequence
  //-----------------------------------------------------------------------------
  class aligner_virtual_sequence  extends uvm_sequence;

    // Declare P_Sequencer
    `uvm_declare_p_sequencer(aligner_virtual_sequencer)

    // APB Base Sequence
    apb_base_sequence apb_seqc;

    //-----------------------------------------------------------------------
    // Factory Registration
    //-----------------------------------------------------------------------
     `uvm_object_utils(aligner_virtual_sequence)

    //-----------------------------------------------------------------
    // Method       : New
    // Argument     : name   -  string for instance name.
    // Description : This is the constructor function of this class.
    //-----------------------------------------------------------------
     function new(string name ="aligner_virtual_sequence");
        super.new(name);
     endfunction

    //-----------------------------------------------------------------
    // Method      : body
    // Argument    :
    // Description : This is method generate the transaction.
    //-----------------------------------------------------------------
     task body();
       repeat(5)begin
         `uvm_do_on(apb_seqc,p_sequencer.apb_seqr)
       end
     endtask
   
  endclass        

`endif // ALIGNER_VIRTUAL_SEQUENCE_SV
