`ifndef APB_BASE_SEQUENCE_SV
`define APB_BASE_SEQUENCE_SV

 //-----------------------------------------------------------------------------
 // class  : apb_base_sequence
 // parent : uvm_sequence
 //-----------------------------------------------------------------------------
 class apb_base_sequence extends uvm_sequence#(apb_transaction);

   // APB Transaction
    apb_transaction trans;

   //-----------------------------------------------------------------------
   // Factory Registration
   //-----------------------------------------------------------------------
    `uvm_object_utils(apb_base_sequence)

   //-----------------------------------------------------------------
   // Method       : New
   // Argument     : name   -  string for instance name.
   // Description : This is the constructor function of this class.
   //-----------------------------------------------------------------
    function new(string name = "apb_base_sequence");
      super.new(name);
    endfunction

 endclass

`endif //APB_BASE_SEQUENCE_SV
