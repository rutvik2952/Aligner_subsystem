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

   //-----------------------------------------------------------------
   // Method       : run_phase
   // Argument     : phase   -  uvm_phase for instance phase.
   //                
   // Description : This method is collect APB Design data and send
   //               to other component.   
   //-----------------------------------------------------------------
   virtual task run_phase(uvm_phase phase);
     super.run_phase(phase);
     forever begin
      @(posedge vif.PCLK);
      if(vif.PSEL && vif.PENABLE && vif.PREADY) begin
        trans =  apb_transaction::type_id::create("trans");
        trans.apb_operation  = apb_operation_t'(vif.PWERITE);
        trans.apb_addr       = vif.PADDR;
        trans.apb_write_data = vif.PWDATA;
        trans.apb_read_data  = vif.PRDATA;
        trans.apb_responce   =apb_responce_t'(vif.PSLVERR);
        `uvm_info(get_type_name(), "APB_UVC Monitor collect the DUT Transaction and Send to other component",UVM_LOW)
        apb_moni_port.write(trans);
        trans.print();
      end
     end
   endtask

 endclass    
  
`endif //APB_MONITOR_SV    
