//---------------------------------------
// module name : interleaver_stage_1//
// Design : Wang Zi Chen ,Zhang Zhe Ren ,Wang Han Xiang //
// coding : Wang Zi Chen//
// simulate : Wang Zi Chen,Zhang Zhe Ren//
// review ：Zhang Zhe Ren ,Wang Han Xiang//
// --------------------------------------

module interleaver_stage_1(
input[12:0] 	K_i,  // 输入K
input	    	clk,
input[8:0]  	f1,    //查表的f1f2
input[9:0]  	f2,
input 			flag,       //计算初值的标志
input[14:0]		Theta_0_previous,// 上一时钟的δ(2i)
input[14:0]		Theta_1_previous, //上一时钟的δ(2i+1)
input			dff_clr,     //寄存器复位信号


output[9:0]     counter_r,   //计数
output[10:0]    Theta_1_0_to_stage_2, //送往stage2的用于计算初值的的δ
output[14:0]	Theta_0_to_stage_2, // 送往stage2的δ(2i)
output[14:0]	Theta_1_to_stage_2,  // 送往stage2的δ(2i+1)
output[12:0]	Pi2n_plus_K4_init_to_stage_2, // 送往stage2的初值们
output[12:0]	Pi2n_plus_3K4_init_to_stage_2, 
output[12:0]	Pi2n_plus_K2_init_to_stage_2   
);




// 需要用的K的倍数

wire[13:0]	  K_mul_2 = {K_i , 1'b0};
wire[14:0]	  K_mul_4 = {K_i , 2'b0};
wire[10:0]    K_div_4 = K_i[12:2];

// 计算b和δ的值
wire[12:0]    b_2_temp = {f2,3'b0};
wire[14:0]    b_2 = (b_2_temp > K_mul_4) ? (b_2_temp - K_mul_4) : 
						((b_2_temp > K_mul_2) ? (b_2_temp - K_mul_2) : ((b_2_temp > K_i) ? b_2_temp - K_i : b_2_temp )); 
						
wire[10:0]    Theta_1_0 = f1 + f2;
wire[12:0]    Theta_2_0_temp = {f1,1'b0} + {f2,2'b0};
wire[13:0]    Theta_2_1_temp = {f1,1'b0} + {f2,3'b0};
wire[13:0]    Theta_2_0 = (Theta_2_0_temp > K_mul_2) ? (Theta_2_0_temp - K_mul_2) : 
								((Theta_2_0_temp > K_i) ? Theta_2_0_temp - K_i : Theta_2_0_temp );
								
wire[14:0]    Theta_2_1 = (Theta_2_1_temp > K_mul_4) ? (Theta_2_1_temp - K_mul_4) : 
								((Theta_2_1_temp > K_mul_2) ? (Theta_2_1_temp - K_mul_2) : ((Theta_2_1_temp > K_i) ? Theta_2_1_temp - K_i : Theta_2_1_temp ));

wire[14:0]	  Theta_temp_0 = (counter_r == 0) ? 15'b000_0000_0000_0000 : 
								(counter_r == 1) ? Theta_2_0 :
													(((Theta_0_previous + b_2) < K_i) ? Theta_0_previous + b_2 : Theta_0_previous + b_2 - K_i );

wire[14:0]	  Theta_temp_1 = (counter_r == 0) ? 15'b000_0000_0000_0000 : 
								(counter_r == 1) ? Theta_2_1 :
													(((Theta_1_previous + b_2) < K_i) ? Theta_1_previous + b_2 : Theta_1_previous + b_2 - K_i );
//计算Pi的初值 
wire[12:0]	  Pi2n_plus_K4_init = (flag == 1) ? {K_div_4,2'b0} - K_div_4 : {2'b0,K_div_4};
wire[12:0]	  Pi2n_plus_3K4_init = (flag == 1) ? {2'b0,K_div_4}  : {K_div_4,2'b0} - K_div_4;
wire[12:0]	  Pi2n_plus_K2_init = {1'b0,K_i[12:1]};

wire[9:0]     counter_next = counter_r + 1;


//标准dff单元
generaldff #(.DW(10)) counter_dff ( .dnxt(counter_next), .qout(counter_r), .clk(clk),.rst_n(dff_clr));
generaldff #(.DW(15)) Theta_reg_0_dff (Theta_temp_0, Theta_0_to_stage_2, clk,dff_clr);
generaldff #(.DW(15)) Theta_reg_1_dff (Theta_temp_1, Theta_1_to_stage_2, clk,dff_clr);
generaldff #(.DW(11)) Theta_reg_1_0_dff (Theta_1_0, Theta_1_0_to_stage_2, clk,dff_clr);

generaldff #(.DW(13)) Pi2n_plus_K4_init_dff (Pi2n_plus_K4_init, Pi2n_plus_K4_init_to_stage_2, clk,dff_clr);
generaldff #(.DW(13)) Pi2n_plus_3K4_init_dff (Pi2n_plus_3K4_init, Pi2n_plus_3K4_init_to_stage_2, clk,dff_clr);
generaldff #(.DW(13)) Pi2n_plus_K2_init_dff (Pi2n_plus_K2_init, Pi2n_plus_K2_init_to_stage_2, clk,dff_clr);

endmodule




