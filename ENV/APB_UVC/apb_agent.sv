`ifndef APB_AGENT_SV
`define APB_AGENT_SV

 //-----------------------------------------------------------------------------
 // class  : apb_agent
 // parent : uvm_agent
 //-----------------------------------------------------------------------------
 class apb_agent extends uvm_agent;

  // APB Sequencer
  apb_sequencer apb_seqr;

  // APB Driver
  apb_driver apb_dri;

  // APB Monitor
  apb_monitor apb_moni;

  // APB Interface
  virtual apb_inf vif;

  // APB Configuration
  apb_config apb_cfg;

  //-----------------------------------------------------------------------
  // Factory Registration
  //----------------------------------------------------------------------- 
  `uvm_component_utils(apb_agent)

  //-----------------------------------------------------------------
  // Method       : New
  // Argument     : name   -  string for instance name.
  //                parent - uvm_component for parent instance.
  // Description : This is the constructor function of this class.
  //-----------------------------------------------------------------
   function new(string name = "apb_agent",uvm_component parent);
     super.new(name,parent);
   endfunction

  //-----------------------------------------------------------------
  // Method       : build_phase
  // Argument     : phase  - uvm_phase for instance phase.
  // Description  : This method is construct the component and get
  //                the APB configuration.
  //-----------------------------------------------------------------
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(apb_config)::get(this,"","CFG",apb_cfg))
     `uvm_fatal(get_type_name(),"Unable to get APB Configuration")
    begin
    if(apb_cfg.APB_AGENT == UVM_ACTIVE) begin
       apb_seqr = apb_sequencer::type_id::create("apb_seqr",this);
       apb_dri  = apb_driver::type_id::create("apb_dri",this);
    end
    apb_moni = apb_monitor::type_id::create("apb_moni",this);
   
  endfunction

  //-----------------------------------------------------------------
  // Method       : connect_phase
  // Argument     : phase  - uvm_phase for instance phase.
  // Description  : This method is get the APB Interface and connect
  //                driver and sequencer
  //-----------------------------------------------------------------
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    if(apb_cfg.APB_AGENT == UVM_ACTIVE) begin
      if(!uvm_config_db#(virtual apb_inf)::get(this,"","APB_VIF",vif)) 
        `uvm_fatal(get_type_name(),"Unable to  get APB Interface")
      else begin
        apb_dri.vif  = vif;
        apb_moni.vif = vif;
        apb_dri.cfg  = apb_cfg;
      end
      apb_dri.seq_item_port.connect(apb_seqr.seqq_item_export);  
    end
    else  apb_moni.vif = vif;
  endfunction  

endclass

`endif // APB_AGENT_SV
