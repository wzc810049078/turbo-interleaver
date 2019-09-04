//---------------------------------------
// module name : interleaver_stage_2//
// Design : Wang Zi Chen ,Zhang Zhe Ren ,Wang Han Xiang //
// coding : Wang Zi Chen//
// simulate : Wang Zi Chen,Zhang Zhe Ren//
// review ：Zhang Zhe Ren ,Wang Han Xiang//
// --------------------------------------

module interleaver_stage_2(
input[12:0] 	K_i,  // 输入K
input			clk,
input[10:0]     Theta_1_0_from_stage_1,
input[14:0]		Theta_0_from_stage_1, // 来自stage1的δ(2i)
input[14:0]		Theta_1_from_stage_1,  // δ(2i+1)
input[12:0]		Pi2n_plus_K4_init_from_stage_1,
input[12:0]		Pi2n_plus_3K4_init_from_stage_1,
input[12:0]		Pi2n_plus_K2_init_from_stage_1,
input[9:0]      counter_r,
input			dff_clr,

output[12:0]	Pi2n,
output[12:0]	Pi2n_plus_1,
output[12:0]	Pi2n_plus_K4,
output[12:0]	Pi2n_plus_K4_plus_1,
output[12:0]	Pi2n_plus_K2,
output[12:0]	Pi2n_plus_K2_plus_1,
output[12:0]	Pi2n_plus_3K4,
output[12:0]	Pi2n_plus_3K4_plus_1
);


wire[12:0] Pi2n_reg;
wire[12:0] Pi2n_plus_1_reg;
wire[12:0] Pi2n_plus_K4_reg;
wire[12:0] Pi2n_plus_K4_plus_1_reg;
wire[12:0] Pi2n_plus_K2_reg;
wire[12:0] Pi2n_plus_K2_plus_1_reg;
wire[12:0] Pi2n_plus_3K4_reg;
wire[12:0] Pi2n_plus_3K4_plus_1_reg;
//计算8个Pi的值
wire[12:0]	Pi2n_temp = 
				(counter_r != 0) ? (((Pi2n_reg + Theta_0_from_stage_1) < K_i) ? Pi2n_reg + Theta_0_from_stage_1 :Pi2n_reg + Theta_0_from_stage_1 - K_i )
					: 13'b0 ;
					
wire[12:0]	Pi2n_plus_1_temp = 
				(counter_r != 0) ? (((Pi2n_plus_1_reg + Theta_1_from_stage_1) < K_i) ? Pi2n_plus_1_reg + Theta_1_from_stage_1 : Pi2n_plus_1_reg + Theta_1_from_stage_1 - K_i )
					: Theta_1_0_from_stage_1 ;
									
wire[12:0]	Pi2n_plus_K4_temp = 
				(counter_r != 0) ? (((Pi2n_plus_K4_reg + Theta_0_from_stage_1) < K_i) ? Pi2n_plus_K4_reg + Theta_0_from_stage_1 : Pi2n_plus_K4_reg + Theta_0_from_stage_1 - K_i )
					: Pi2n_plus_K4_init_from_stage_1 ;
					
wire[12:0]	Pi2n_plus_K4_plus_1_temp = 
				(counter_r != 0) ? (((Pi2n_plus_K4_plus_1_reg + Theta_1_from_stage_1) < K_i) ? Pi2n_plus_K4_plus_1_reg + Theta_1_from_stage_1 : Pi2n_plus_K4_plus_1_reg + Theta_1_from_stage_1 - K_i )
					: (((Theta_1_0_from_stage_1 + Pi2n_plus_K4_temp) < K_i) ? Theta_1_0_from_stage_1 + Pi2n_plus_K4_temp : Theta_1_0_from_stage_1 + Pi2n_plus_K4_temp - K_i);
wire[12:0]	Pi2n_plus_K2_temp = 
				(counter_r != 0) ? (((Pi2n_plus_K2_reg + Theta_0_from_stage_1) < K_i) ? Pi2n_plus_K2_reg + Theta_0_from_stage_1 : Pi2n_plus_K2_reg + Theta_0_from_stage_1 - K_i )
					: Pi2n_plus_K2_init_from_stage_1 ;
					
wire[12:0]	Pi2n_plus_K2_plus_1_temp = 
				(counter_r != 0) ? (((Pi2n_plus_K2_plus_1_reg + Theta_1_from_stage_1) < K_i) ? Pi2n_plus_K2_plus_1_reg + Theta_1_from_stage_1 : Pi2n_plus_K2_plus_1_reg + Theta_1_from_stage_1 - K_i )
					: (((Theta_1_0_from_stage_1 + Pi2n_plus_K2_temp) < K_i) ? Theta_1_0_from_stage_1 + Pi2n_plus_K2_temp : Theta_1_0_from_stage_1 + Pi2n_plus_K2_temp - K_i)  ;
												
											
wire[12:0]	Pi2n_plus_3K4_temp = 
				(counter_r != 0) ? (((Pi2n_plus_3K4_reg + Theta_0_from_stage_1) < K_i) ? Pi2n_plus_3K4_reg + Theta_0_from_stage_1 : Pi2n_plus_3K4_reg + Theta_0_from_stage_1 - K_i )
					: Pi2n_plus_3K4_init_from_stage_1 ;
								
wire[12:0]	Pi2n_plus_3K4_plus_1_temp = 
				(counter_r != 0) ? (((Pi2n_plus_3K4_plus_1_reg + Theta_1_from_stage_1) < K_i) ? Pi2n_plus_3K4_plus_1_reg + Theta_1_from_stage_1 : Pi2n_plus_3K4_plus_1_reg + Theta_1_from_stage_1 - K_i )
					: (((Theta_1_0_from_stage_1 + Pi2n_plus_3K4_temp) < K_i) ? Theta_1_0_from_stage_1 + Pi2n_plus_3K4_temp : Theta_1_0_from_stage_1 + Pi2n_plus_3K4_temp - K_i)  ;




							
generaldff #(.DW(13)) Pi2n_dff (Pi2n_temp, Pi2n_reg, clk,dff_clr);
generaldff #(.DW(13)) Pi2n_plus_1_dff (Pi2n_plus_1_temp, Pi2n_plus_1_reg, clk,dff_clr);
generaldff #(.DW(13)) Pi2n_plus_K4_dff (Pi2n_plus_K4_temp, Pi2n_plus_K4_reg, clk,dff_clr);
generaldff #(.DW(13)) Pi2n_plus_K4_plus_1_dff (Pi2n_plus_K4_plus_1_temp, Pi2n_plus_K4_plus_1_reg, clk,dff_clr);
generaldff #(.DW(13)) Pi2n_plus_K2_dff (Pi2n_plus_K2_temp, Pi2n_plus_K2_reg, clk,dff_clr);
generaldff #(.DW(13)) Pi2n_plus_K2_plus_1_dff (Pi2n_plus_K2_plus_1_temp, Pi2n_plus_K2_plus_1_reg, clk,dff_clr);
generaldff #(.DW(13)) Pi2n_plus_3K4_dff (Pi2n_plus_3K4_temp, Pi2n_plus_3K4_reg, clk,dff_clr);
generaldff #(.DW(13)) Pi2n_plus_3K4_plus_1_dff (Pi2n_plus_3K4_plus_1_temp, Pi2n_plus_3K4_plus_1_reg, clk,dff_clr);


assign	Pi2n = Pi2n_reg;
assign	Pi2n_plus_1 = Pi2n_plus_1_reg;
assign	Pi2n_plus_K4 = Pi2n_plus_K4_reg;
assign	Pi2n_plus_K4_plus_1 = Pi2n_plus_K4_plus_1_reg;
assign	Pi2n_plus_K2 = Pi2n_plus_K2_reg;
assign	Pi2n_plus_K2_plus_1 = Pi2n_plus_K2_plus_1_reg;
assign	Pi2n_plus_3K4 = Pi2n_plus_3K4_reg;
assign	Pi2n_plus_3K4_plus_1 = Pi2n_plus_3K4_plus_1_reg;

endmodule