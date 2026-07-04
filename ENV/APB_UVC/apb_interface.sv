`ifndef APB_INTERFACE_SV
`define APB_INTERFACE_SV

 `include"../../COMMON/aligner_common.sv"

  interface apb_inf(input logic PCLK , logic PRESETn);

   logic                     PSEL;
   logic[APB_ADDR_WIDTH-1:0] PADDR;
   logic                     PWERITE;
   logic[APB_DATA_WIDTH-1:0] PWDATA;
   logic                     PENABLE;
   logic                     PREADY;
   logic[APB_DATA_WIDTH-1:0] PRDATA;
   logic                     PSLVERR;

  endinterface

`endif // APB_INTERFACE_SV   
