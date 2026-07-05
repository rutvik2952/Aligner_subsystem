`ifndef ALIGNER_ENVIRONMENT_SV
`define ALIGNER_ENVIRONMENT_SV

// typedef class apb_environment;
 //-----------------------------------------------------------------------------
 // class  : aligner_environment
 // parent : uvm_env
 //-----------------------------------------------------------------------------
 class aligner_environment extends uvm_env;

  // APB Environment
   apb_environment apb_env;

  // Virtual Sequencer
   aligner_virtual_sequencer virtual_seqr;

  //-----------------------------------------------------------------------
  // Factory Registration
  //-----------------------------------------------------------------------
  `uvm_component_utils(aligner_environment)

  //-----------------------------------------------------------------
  // Method       : New
  // Argument     : name   -  string for instance name.
  //                parent - uvm_component for parent instance.
  // Description : This is the constructor function of this class.
  //-----------------------------------------------------------------
   function new(string name ="aligner_environment",uvm_component parent);
     super.new(name,parent);
   endfunction

  //-----------------------------------------------------------------
  // Method       : build_phase
  // Argument     : phase  - uvm_phase for instance phase.
  // Description  : This method is construct the component.
  //-----------------------------------------------------------------
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    apb_env      = apb_environment::type_id::create("apb_env",this);
    virtual_seqr = aligner_virtual_sequencer::type_id::create("virtual_seqr",this);
  endfunction

  //-----------------------------------------------------------------
  // Method       : connect_phase
  // Argument     : phase  - uvm_phase for instance phase.
  // Description  : This method is construct the component.
  //-----------------------------------------------------------------
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    virtual_seqr.apb_seqr = apb_env.apb_agt.apb_seqr;
  endfunction

 endclass

`endif //ALIGNER_ENVIRONMENT_SV
