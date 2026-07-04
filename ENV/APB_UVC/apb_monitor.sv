`ifndef APB_MONITOR_SV
`define APB_MONITOR_SV

 //-----------------------------------------------------------------------------
 // class  : apb_monitor
 // parent : uvm_monitor
 //-----------------------------------------------------------------------------
 class apb_monitor extends uvm_monitor;;

   //APB Transaction
   apb_transaction trans;

   //APB Interface
   virtual apb_inf vif;

   // Analysis Port
   uvm_analysis_port#(apb_transaction) apb_moni_port;

   //-----------------------------------------------------------------------
   // Factory Registration
   //----------------------------------------------------------------------- 
   `uvm_component_utils(apb_monitor)

   //-----------------------------------------------------------------
   // Method       : New
   // Argument     : name   -  string for instance name.
   //                parent - uvm_component for parent instance.
   // Description : This is the constructor function of this class.
   //-----------------------------------------------------------------
    function new(string name = "apb_monitor", uvm_component parent);
      super.new(name,parent);
      apb_moni_port = new("apb_moni_port",this);
    endfunction

 endclass    
  
`endif //APB_MONITOR_SV    
