`ifndef APB_CONFIG_SV
`define APB_CONFIG_SV

 //-----------------------------------------------------------------------------
 // class  : apb_config
 // parent : uvm_component
 //-----------------------------------------------------------------------------
 class apb_config extends uvm_component;

  uvm_active_passive_enum APB_AGENT = UVM_ACTIVE;
  int apb_delay = 4; 

  //-----------------------------------------------------------------------
  // Factory Registration
  //----------------------------------------------------------------------- 
  `uvm_component_utils(apb_config)

  //-----------------------------------------------------------------
  // Method       : New
  // Argument     : name   -  string for instance name.
  //                parent - uvm_component for parent instance.
  // Description : This is the constructor function of this class.
  //-----------------------------------------------------------------
   function new(string name = "apb_config",uvm_component parent);
     super.new(name,parent);
   endfunction

 endclass

`endif //APB_CONFIG_SV  
