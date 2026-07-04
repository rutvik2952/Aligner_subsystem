`ifndef APB_ENV_SV
`define APB_ENV_SV

 //-----------------------------------------------------------------------------
 // class  : apb_environment
 // parent : uvm_env
 //-----------------------------------------------------------------------------
 class apb_environment extends uvm_env;

  //APB Configuration
  apb_config cfg;

  //APB Agent
  apb_agent apb_agt;

  //-----------------------------------------------------------------------
  // Factory Registration
  //----------------------------------------------------------------------- 
  `uvm_component_utils(apb_environment)

  //-----------------------------------------------------------------
  // Method       : New
  // Argument     : name   -  string for instance name.
  //                parent - uvm_component for parent instance.
  // Description : This is the constructor function of this class.
  //-----------------------------------------------------------------
   function new(string name ="apb_environment",uvm_component parent);
     super.new(name,parent);
   endfunction

  //-----------------------------------------------------------------
  // Method       : build_phase
  // Argument     : phase  - uvm_phase for instance phase.
  // Description  : This method is construct the component and set
  //                the APB configuration.
  //-----------------------------------------------------------------
   virtual function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     cfg = apb_config::type_id::create("cfg",this);
     uvm_config_db#(apb_config)::set(this,"*","CFG",cfg);
     apb_agt = apb_agent::type_id::create("apb_agt",this);
   endfunction

 endclass

`endif //APB_ENV_SV  
