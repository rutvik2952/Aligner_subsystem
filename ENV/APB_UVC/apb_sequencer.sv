`ifndef APB_SEQUENCER_SV
`define APB_SEQUENCER_SV

 //-----------------------------------------------------------------------------
 // class  : apb_sequencer
 // parent : uvm_sequencer
 //-----------------------------------------------------------------------------
 class apb_sequencer extends uvm_sequencer#(apb_transaction);

   //-----------------------------------------------------------------------
   // Factory Registration
   //----------------------------------------------------------------------- 
   `uvm_component_utils(apb_sequencer)

   //-----------------------------------------------------------------
   // Method       : New
   // Argument     : name   -  string for instance name.
   //                parent - uvm_component for parent instance.
   // Description : This is the constructor function of this class.
   //-----------------------------------------------------------------
    function new(string name ="apb_sequencer",uvm_component parent);
      super.new(name,parent);
    endfunction

 endclass

`endif //APB_SEQUENCER_SV      
