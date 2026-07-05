module  aligner_tb_top;

 reg clk;
 reg reset;
 
import uvm_pkg::*;
`include"uvm_macros.svh"
import aliger_top_pkg::*;

//APB Interface
apb_inf apb_vif(.PCLK(clk),
                .PRESETn(reset));

//DUT
cfs_aligner dut_connect(.clk(clk),
                        .reset_n(apb_vif.PRESETn),
                        .paddr(apb_vif.PADDR),
                        .pwrite(apb_vif.PWERITE),
                        .psel(apb_vif.PSEL),
                        .penable(apb_vif.PENABLE),
                        .pwdata(apb_vif.PWDATA),
                        .pready(apb_vif.PREADY),
                        .prdata(apb_vif.PRDATA),
                        .pslverr(apb_vif.PSLVERR));


always #5 clk = ~clk;


initial begin
 clk =0;
 reset =0;
 repeat(5)begin
   @(posedge clk);
 end
 reset =1;
end

initial begin
 uvm_config_db#(virtual apb_inf)::set(null,"*","APB_VIF",apb_vif);
 run_test();
end

endmodule
