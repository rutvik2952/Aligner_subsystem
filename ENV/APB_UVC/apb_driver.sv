`ifndef APB_DRIVER_SV
`define APB_DRIVER_SV

 //-----------------------------------------------------------------------------
 // class  : apb_driver
 // parent : uvm_driver
 //-----------------------------------------------------------------------------
 class apb_driver extends uvm_driver#(apb_transaction);

  // APB Transaction
  apb_transaction trans;

  // APB Interface
  virtual apb_inf vif;

  // APB CONFIG 
   apb_config cfg;

  //-----------------------------------------------------------------------
  // Factory Registration
  //----------------------------------------------------------------------- 
   `uvm_component_utils(apb_driver)

  //-----------------------------------------------------------------
  // Method       : New
  // Argument     : name   -  string for instance name.
  //                parent - uvm_component for parent instance.
  // Description : This is the constructor function of this class.
  //-----------------------------------------------------------------
  function new(string name ="apb_driver",uvm_component parent);
   super.new(name,parent);
  endfunction

 //-----------------------------------------------------------------
 // Method       : run_phase
 // Argument     : phase   -  uvm_phase for instance phase.
 //                
 // Description : This method is collect apb transaction from sequence
 //               through sequencer and call the method send_apb_transaction.   
 //-----------------------------------------------------------------
 virtual task run_phase(uvm_phase phase);
   super.run_phase(phase);

  // wait for Initial Reset
   wait(vif.PRESETn==1);

   forever begin
     seq_item_port.get_next_item(req);
      req.print();
      send_apb_transaction(req); 
     seq_item_port.item_done();
   end 
 endtask

 //-----------------------------------------------------------------
 // Method       : send_apb_transaction
 // Argument     : trans   -  apb_transaction for instance trans.
 //                
 // Description : This method is generate  the APB transaction   
 //-----------------------------------------------------------------
  task send_apb_transaction(apb_transaction trans); 
   int wait_for_ready=0;
     @(posedge vif.PCLK);
      vif.PSEL    <= 1;
      vif.PADDR   <= trans.apb_addr;
      vif.PWERITE <= int'(trans.apb_operation);
      vif.PWDATA  <= trans.apb_write_data;
    
     @(posedge vif.PCLK);
      vif.PENABLE <= 1;
       
      fork
         begin
           wait(vif.PREADY==1);
           wait_for_ready = 0;
         end
         begin
           repeat(cfg.apb_delay)begin
             @(posedge vif.PCLK);
           end
           wait_for_ready =1; 
         end
      join_any
      disable fork;
      if(wait_for_ready==1) `uvm_error(get_type_name(), "PREADY is Not Asserted")
      @(posedge vif.PCLK); 
       vif.PENABLE <= 0;
       vif.PSEL    <= 0;
       vif.PADDR   <= 0;
       vif.PWERITE <= 0;
       vif.PWDATA  <= 0;
      @(posedge vif.PCLK); 
 
  endtask

endclass
 
`endif //APB_DRIVER_SV 
