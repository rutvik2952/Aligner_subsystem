`ifndef APB_TRANSACTION_SV
`define APB_TRANSACTION_SV

 //-----------------------------------------------------------------------------
 // class  : apb_transaction
 // parent : uvm_sequence_item
 //-----------------------------------------------------------------------------
 class apb_transaction extends uvm_sequence_item;

  rand apb_operation_t         apb_operation;
  rand bit[APB_ADDR_WIDTH-1:0] apb_addr;
  rand bit[APB_DATA_WIDTH-1:0] apb_write_data;
       bit[APB_DATA_WIDTH-1:0] apb_read_data; 

 //-----------------------------------------------------------------------
 // Factory Registration
 //----------------------------------------------------------------------- 
 `uvm_object_utils_begin(apb_transaction)
 `uvm_field_enum(apb_operation_t,apb_operation,UVM_ALL_ON)
 `uvm_field_int(apb_addr,UVM_ALL_ON)
 `uvm_field_int(apb_write_data,UVM_ALL_ON)
 `uvm_field_int(apb_read_data,UVM_ALL_ON)
 `uvm_object_utils_end


 //-----------------------------------------------------------------
 // Method       : New
 // Argument     : name   -  string for instance name.
 // Description : This is the constructor function of this class.
 //-----------------------------------------------------------------
  function new(string name = "apb_transaction");
    super.new(name);
  endfunction

 endclass

`endif //APB_TRANSACTION_SV
