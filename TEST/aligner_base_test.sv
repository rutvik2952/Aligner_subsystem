`ifndef ALIGNER_BASE_TEST_SV
`define ALIGENR_BASE_TEST_SV

  //-----------------------------------------------------------------------------
  // class  : aligner_base_test
  // parent : uvm_test
  //-----------------------------------------------------------------------------
  class aligner_base_test extends uvm_test;

    // Aligner Environment
    aligner_environment  aligner_env;

    // Aligner Sequence
    aligner_virtual_sequence aligner_seqc;

    //-----------------------------------------------------------------------
    // Factory Registration
    //----------------------------------------------------------------------- 
     `uvm_component_utils(aligner_base_test)

    //-----------------------------------------------------------------
    // Method       : build_phase
    // Argument     : phase  - uvm_phase for instance phase.
    // Description  : This method is construct the component.
    //-----------------------------------------------------------------
    virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      aligner_env = aligner_environment::type_id::create("aligner_env",this);
    endfunction

    //-----------------------------------------------------------------
    // Method       : run_phase
    // Argument     : phase  - uvm_phase for instance phase.
    // Description  : This method is run the seuence
    //-----------------------------------------------------------------    
    virtual task run_phase(uvm_phase phase);
      super.run_phase(phase);
      phase.raise_objection(this);
        aligner_seqc = aligner_virtual_sequence::type_id::create("aligner_seqc");
        aligner_seqc.start(aligner_env.virtual_seqr);
      phase.drop_objection(this);
    endtask

  endclass

`endif //ALIGENR_BASE_TEST_SV
