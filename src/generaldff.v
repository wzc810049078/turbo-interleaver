//---------------------------------------
// module name : dff//
// Description: The general DFF module
// Design : Wang Zi Chen ,Zhang Zhe Ren ,Wang Han Xiang //
// coding : Wang Zi Chen//
// simulate : Wang Zi Chen,Zhang Zhe Ren//
// review ：Zhang Zhe Ren ,Wang Han Xiang//
// --------------------------------------
module generaldff # (
  parameter DW = 32
) (

  input[DW-1:0]       dnxt,
  output[DW-1:0]      qout,

  input               clk,
  input               rst_n
);

reg [DW-1:0] qout_r;

always @(posedge clk or negedge rst_n)
begin : generaldff
  if (rst_n == 1'b0)
    qout_r <= {DW{1'b0}};
  else                  
    qout_r <= dnxt;
end

assign qout = qout_r;

endmodule