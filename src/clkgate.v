//---------------------------------------
//module name ：clkgate//
// Design : Wang Zi Chen ,Zhang Zhe Ren ,Wang Han Xiang //
// coding : Wang Zi Chen//
// simulate : Wang Zi Chen,Zhang Zhe Ren//
// review ：Zhang Zhe Ren ,Wang Han Xiang//
// --------------------------------------
module clkgate (
  input   clk_in,
  input   clock_en,
  output  clk_out
);

reg en;

always@(*)
  if (!clk_in)
    en = clock_en ;

assign clk_out = en & clk_in;

endmodule 