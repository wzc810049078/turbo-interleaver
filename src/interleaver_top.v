//---------------------------------------
// module name ：interleaver_top//
// Design : Wang Zi Chen ,Zhang Zhe Ren ,Wang Han Xiang //
// coding : Wang Zi Chen//
// simulate : Wang Zi Chen,Zhang Zhe Ren//
// review ：Zhang Zhe Ren ,Wang Han Xiang//
// --------------------------------------
module interleaver_top(
input	    clk_in,
input	    rst_n,
input[12:0] K,
input       sleep_mode, //睡眠模式,输入1即可停止时钟输入，进入休眠。

output[12:0]	Pi2n,
output[12:0]	Pi2n_plus_1,
output[12:0]	Pi2n_plus_K4,
output[12:0]	Pi2n_plus_K4_plus_1,
output[12:0]	Pi2n_plus_K2,
output[12:0]	Pi2n_plus_K2_plus_1,
output[12:0]	Pi2n_plus_3K4,
output[12:0]	Pi2n_plus_3K4_plus_1

);

wire[8:0] f1_t2i;
wire[9:0] f2_t2i;
wire      flag_t2i;
wire[9:0] counter_from_1;
wire[9:0] counter_to_2 = counter_from_1 - 1;
wire      finish = (counter_from_1 == (K[12:3] + 2)); //结束信号
wire      dff_clr = (rst_n & (~finish));//dff清空

//wire[7:0] K_i2t;
//wire[7:0] K_i2t = K[12:5] ;
wire[7:0] K_i2t = K[12:5] - 8'b0010_0000 ;//缩减进入查找表的索引

wire interleaver_en = (( K_i2t <= 8'd160 ) & ( K_i2t >= 8'd0 )) & sleep_mode ;//计算K是否在范围内&休眠
wire clk;

clkgate U2 (
				.clk_in(clk_in),
				.clock_en(interleaver_en),
				.clk_out(clk)

);

wire[10:0]  Theta_1_0_to_stage_2;
wire[14:0]	Theta_0_to_stage_2;
wire[14:0]	Theta_1_to_stage_2;  
wire[12:0]	Pi2n_plus_K4_init_to_stage_2;
wire[12:0]	Pi2n_plus_3K4_init_to_stage_2;
wire[12:0]	Pi2n_plus_K2_init_to_stage_2;

interleaver_stage_1 U0( 
			    .K_i(K),
			    .clk(clk),
			    .f1(f1_t2i),
			    .f2(f2_t2i),
			    .flag(flag_t2i),
				.dff_clr(dff_clr),
				
				
				.Theta_0_previous(Theta_0_to_stage_2),
				.Theta_1_previous(Theta_1_to_stage_2),
				.counter_r(counter_from_1),
				.Theta_1_0_to_stage_2(Theta_1_0_to_stage_2),
				.Theta_0_to_stage_2(Theta_0_to_stage_2),
				.Theta_1_to_stage_2(Theta_1_to_stage_2),  
				.Pi2n_plus_K4_init_to_stage_2(Pi2n_plus_K4_init_to_stage_2),
				.Pi2n_plus_3K4_init_to_stage_2(Pi2n_plus_3K4_init_to_stage_2),
				.Pi2n_plus_K2_init_to_stage_2(Pi2n_plus_K2_init_to_stage_2)
				);
				
				
interleaver_stage_2 U3( 
			    .K_i(K),
			    .clk(clk),
				.counter_r(counter_to_2),   
				.Theta_1_0_from_stage_1(Theta_1_0_to_stage_2),
				.Theta_0_from_stage_1(Theta_0_to_stage_2),
				.Theta_1_from_stage_1(Theta_1_to_stage_2),  
				.Pi2n_plus_K4_init_from_stage_1(Pi2n_plus_K4_init_to_stage_2),
				.Pi2n_plus_3K4_init_from_stage_1(Pi2n_plus_3K4_init_to_stage_2),
				.Pi2n_plus_K2_init_from_stage_1(Pi2n_plus_K2_init_to_stage_2),
				.dff_clr(dff_clr),				
				
			   	.Pi2n(Pi2n),
			   	.Pi2n_plus_1(Pi2n_plus_1),
			   	.Pi2n_plus_K4(Pi2n_plus_K4),
			   	.Pi2n_plus_K4_plus_1(Pi2n_plus_K4_plus_1),
			   	.Pi2n_plus_K2(Pi2n_plus_K2),
			   	.Pi2n_plus_K2_plus_1(Pi2n_plus_K2_plus_1),
			   	.Pi2n_plus_3K4(Pi2n_plus_3K4),
			   	.Pi2n_plus_3K4_plus_1(Pi2n_plus_3K4_plus_1)
				);
				
				
table_f1f2 U1(
				.K(K_i2t),
				.f1(f1_t2i),
				.f2(f2_t2i),
				.flag(flag_t2i)
				);
				
endmodule