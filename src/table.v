//---------------------------------------
//module name ：table_f1f2//
// Design : Wang Zi Chen ,Zhang Zhe Ren ,Wang Han Xiang //
// coding : Wang Zi Chen//
// simulate : Wang Zi Chen,Zhang Zhe Ren//
// review ：Zhang Zhe Ren ,Wang Han Xiang//
// --------------------------------------
module table_f1f2(
input [7:0] K,
//input [12:0] K,
output[8:0] f1,
output[9:0] f2,
output      flag
);
reg[8:0] f1_temp;
reg[9:0] f2_temp;
reg      flag_temp;

assign f1 = f1_temp;
assign f2 = f2_temp;
assign flag = flag_temp;


always @(*) 
case (K)
8'd0:
begin
f1_temp = 31;
f2_temp = 64;
flag_temp = 1;
end
8'd1:
begin
f1_temp = 17;
f2_temp = 66;
flag_temp = 0;
end
8'd2:
begin
f1_temp = 171;
f2_temp = 204;
flag_temp = 1;
end
8'd3:
begin
f1_temp = 67;
f2_temp = 140;
flag_temp = 1;
end
8'd4:
begin
f1_temp = 35;
f2_temp = 72;
flag_temp = 1;
end
8'd5:
begin
f1_temp = 19;
f2_temp = 74;
flag_temp = 1;
end
8'd6:
begin
f1_temp = 39;
f2_temp = 76;
flag_temp = 1;
end
8'd7:
begin
f1_temp = 19;
f2_temp = 78;
flag_temp = 1;
end
8'd8:
begin
f1_temp = 199;
f2_temp = 240;
flag_temp = 1;
end
8'd9:
begin
f1_temp = 21;
f2_temp = 82;
flag_temp = 0;
end
8'd10:
begin
f1_temp = 211;
f2_temp = 252;
flag_temp = 1;
end
8'd11:
begin
f1_temp = 21;
f2_temp = 86;
flag_temp = 0;
end
8'd12:
begin
f1_temp = 43;
f2_temp = 88;
flag_temp = 1;
end
8'd13:
begin
f1_temp = 149;
f2_temp = 60;
flag_temp = 0;
end
8'd14:
begin
f1_temp = 45;
f2_temp = 92;
flag_temp = 0;
end
8'd15:
begin
f1_temp = 49;
f2_temp = 846;
flag_temp = 0;
end
8'd16:
begin
f1_temp = 71;
f2_temp = 48;
flag_temp = 1;
end
8'd17:
begin
f1_temp = 13;
f2_temp = 28;
flag_temp = 0;
end
8'd18:
begin
f1_temp = 17;
f2_temp = 80;
flag_temp = 0;
end
8'd19:
begin
f1_temp = 25;
f2_temp = 102;
flag_temp = 0;
end
8'd20:
begin
f1_temp = 183;
f2_temp = 104;
flag_temp = 1;
end
8'd21:
begin
f1_temp = 55;
f2_temp = 954;
flag_temp = 1;
end
8'd22:
begin
f1_temp = 127;
f2_temp = 96;
flag_temp = 1;
end
8'd23:
begin
f1_temp = 27;
f2_temp = 110;
flag_temp = 1;
end
8'd24:
begin
f1_temp = 29;
f2_temp = 112;
flag_temp = 0;
end
8'd25:
begin
f1_temp = 29;
f2_temp = 114;
flag_temp = 0;
end
8'd26:
begin
f1_temp = 57;
f2_temp = 116;
flag_temp = 0;
end
8'd27:
begin
f1_temp = 45;
f2_temp = 354;
flag_temp = 0;
end
8'd28:
begin
f1_temp = 31;
f2_temp = 120;
flag_temp = 1;
end
8'd29:
begin
f1_temp = 59;
f2_temp = 610;
flag_temp = 1;
end
8'd30:
begin
f1_temp = 185;
f2_temp = 124;
flag_temp = 0;
end
8'd31:
begin
f1_temp = 113;
f2_temp = 420;
flag_temp = 0;
end
8'd32:
begin
f1_temp = 31;
f2_temp = 64;
flag_temp = 1;
end
8'd34:
begin
f1_temp = 17;
f2_temp = 66;
flag_temp = 0;
end
8'd36:
begin
f1_temp = 171;
f2_temp = 136;
flag_temp = 1;
end
8'd38:
begin
f1_temp = 209;
f2_temp = 420;
flag_temp = 0;
end
8'd40:
begin
f1_temp = 253;
f2_temp = 216;
flag_temp = 0;
end
8'd42:
begin
f1_temp = 367;
f2_temp = 444;
flag_temp = 1;
end
8'd44:
begin
f1_temp = 265;
f2_temp = 456;
flag_temp = 0;
end
8'd46:
begin
f1_temp = 181;
f2_temp = 468;
flag_temp = 0;
end
8'd48:
begin
f1_temp = 39;
f2_temp = 80;
flag_temp = 1;
end
8'd50:
begin
f1_temp = 27;
f2_temp = 164;
flag_temp = 1;
end
8'd52:
begin
f1_temp = 127;
f2_temp = 504;
flag_temp = 1;
end
8'd54:
begin
f1_temp = 143;
f2_temp = 172;
flag_temp = 1;
end
8'd56:
begin
f1_temp = 43;
f2_temp = 88;
flag_temp = 1;
end
8'd58:
begin
f1_temp = 29;
f2_temp = 300;
flag_temp = 0;
end
8'd60:
begin
f1_temp = 45;
f2_temp = 92;
flag_temp = 0;
end
8'd62:
begin
f1_temp = 157;
f2_temp = 188;
flag_temp = 0;
end
8'd64:
begin
f1_temp = 47;
f2_temp = 96;
flag_temp = 1;
end
8'd66:
begin
f1_temp = 13;
f2_temp = 28;
flag_temp = 0;
end
8'd68:
begin
f1_temp = 111;
f2_temp = 240;
flag_temp = 1;
end
8'd70:
begin
f1_temp = 443;
f2_temp = 204;
flag_temp = 1;
end
8'd72:
begin
f1_temp = 51;
f2_temp = 104;
flag_temp = 1;
end
8'd74:
begin
f1_temp = 51;
f2_temp = 212;
flag_temp = 1;
end
8'd76:
begin
f1_temp = 451;
f2_temp = 192;
flag_temp = 1;
end
8'd78:
begin
f1_temp = 257;
f2_temp = 220;
flag_temp = 0;
end
8'd80:
begin
f1_temp = 57;
f2_temp = 336;
flag_temp = 0;
end
8'd82:
begin
f1_temp = 313;
f2_temp = 228;
flag_temp = 0;
end
8'd84:
begin
f1_temp = 271;
f2_temp = 232;
flag_temp = 1;
end
8'd86:
begin
f1_temp = 179;
f2_temp = 236;
flag_temp = 1;
end
8'd88:
begin
f1_temp = 331;
f2_temp = 120;
flag_temp = 1;
end
8'd90:
begin
f1_temp = 363;
f2_temp = 244;
flag_temp = 1;
end
8'd92:
begin
f1_temp = 375;
f2_temp = 248;
flag_temp = 1;
end
8'd94:
begin
f1_temp = 127;
f2_temp = 168;
flag_temp = 1;
end
8'd96:
begin
f1_temp = 31;
f2_temp = 64;
flag_temp = 1;
end
8'd98:
begin
f1_temp = 33;
f2_temp = 130;
flag_temp = 0;
end
8'd100:
begin
f1_temp = 43;
f2_temp = 264;
flag_temp = 1;
end
8'd102:
begin
f1_temp = 33;
f2_temp = 134;
flag_temp = 0;
end
8'd104:
begin
f1_temp = 477;
f2_temp = 408;
flag_temp = 0;
end
8'd106:
begin
f1_temp = 35;
f2_temp = 138;
flag_temp = 1;
end
8'd108:
begin
f1_temp = 233;
f2_temp = 280;
flag_temp = 0;
end
8'd110:
begin
f1_temp = 357;
f2_temp = 142;
flag_temp = 0;
end
8'd112:
begin
f1_temp = 337;
f2_temp = 480;
flag_temp = 0;
end
8'd114:
begin
f1_temp = 37;
f2_temp = 146;
flag_temp = 0;
end
8'd116:
begin
f1_temp = 71;
f2_temp = 444;
flag_temp = 1;
end
8'd118:
begin
f1_temp = 71;
f2_temp = 120;
flag_temp = 1;
end
8'd120:
begin
f1_temp = 37;
f2_temp = 152;
flag_temp = 0;
end
8'd122:
begin
f1_temp = 39;
f2_temp = 462;
flag_temp = 1;
end
8'd124:
begin
f1_temp = 127;
f2_temp = 234;
flag_temp = 1;
end
8'd126:
begin
f1_temp = 39;
f2_temp = 158;
flag_temp = 1;
end
8'd128:
begin
f1_temp = 39;
f2_temp = 80;
flag_temp = 1;
end
8'd130:
begin
f1_temp = 31;
f2_temp = 96;
flag_temp = 1;
end
8'd132:
begin
f1_temp = 113;
f2_temp = 902;
flag_temp = 0;
end
8'd134:
begin
f1_temp = 41;
f2_temp = 166;
flag_temp = 0;
end
8'd136:
begin
f1_temp = 251;
f2_temp = 336;
flag_temp = 1;
end
8'd138:
begin
f1_temp = 43;
f2_temp = 170;
flag_temp = 1;
end
8'd140:
begin
f1_temp = 21;
f2_temp = 86;
flag_temp = 0;
end
8'd142:
begin
f1_temp = 43;
f2_temp = 174;
flag_temp = 1;
end
8'd144:
begin
f1_temp = 45;
f2_temp = 176;
flag_temp = 0;
end
8'd146:
begin
f1_temp = 45;
f2_temp = 178;
flag_temp = 0;
end
8'd148:
begin
f1_temp = 161;
f2_temp = 120;
flag_temp = 0;
end
8'd150:
begin
f1_temp = 89;
f2_temp = 182;
flag_temp = 0;
end
8'd152:
begin
f1_temp = 323;
f2_temp = 184;
flag_temp = 1;
end
8'd154:
begin
f1_temp = 47;
f2_temp = 186;
flag_temp = 1;
end
8'd156:
begin
f1_temp = 23;
f2_temp = 94;
flag_temp = 1;
end
8'd158:
begin
f1_temp = 47;
f2_temp = 190;
flag_temp = 1;
end
8'd160:
begin
f1_temp = 263;
f2_temp = 480;
flag_temp = 1;
end
default:
begin
f1_temp = 0;
f2_temp = 0;
flag_temp = 0;
end
endcase						

endmodule

