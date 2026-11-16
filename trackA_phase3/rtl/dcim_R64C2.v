module dcim (
  input clk,
  input load,
  input first,
  input [5:0] x_0,
  input [5:0] x_1,
  input [5:0] x_2,
  input [5:0] x_3,
  input [5:0] x_4,
  input [5:0] x_5,
  input [5:0] x_6,
  input [5:0] x_7,
  input [5:0] x_8,
  input [5:0] x_9,
  input [5:0] x_10,
  input [5:0] x_11,
  input [5:0] x_12,
  input [5:0] x_13,
  input [5:0] x_14,
  input [5:0] x_15,
  input [5:0] x_16,
  input [5:0] x_17,
  input [5:0] x_18,
  input [5:0] x_19,
  input [5:0] x_20,
  input [5:0] x_21,
  input [5:0] x_22,
  input [5:0] x_23,
  input [5:0] x_24,
  input [5:0] x_25,
  input [5:0] x_26,
  input [5:0] x_27,
  input [5:0] x_28,
  input [5:0] x_29,
  input [5:0] x_30,
  input [5:0] x_31,
  input [5:0] x_32,
  input [5:0] x_33,
  input [5:0] x_34,
  input [5:0] x_35,
  input [5:0] x_36,
  input [5:0] x_37,
  input [5:0] x_38,
  input [5:0] x_39,
  input [5:0] x_40,
  input [5:0] x_41,
  input [5:0] x_42,
  input [5:0] x_43,
  input [5:0] x_44,
  input [5:0] x_45,
  input [5:0] x_46,
  input [5:0] x_47,
  input [5:0] x_48,
  input [5:0] x_49,
  input [5:0] x_50,
  input [5:0] x_51,
  input [5:0] x_52,
  input [5:0] x_53,
  input [5:0] x_54,
  input [5:0] x_55,
  input [5:0] x_56,
  input [5:0] x_57,
  input [5:0] x_58,
  input [5:0] x_59,
  input [5:0] x_60,
  input [5:0] x_61,
  input [5:0] x_62,
  input [5:0] x_63,
  input w_0_0,
  input w_0_1,
  input w_1_0,
  input w_1_1,
  input w_2_0,
  input w_2_1,
  input w_3_0,
  input w_3_1,
  input w_4_0,
  input w_4_1,
  input w_5_0,
  input w_5_1,
  input w_6_0,
  input w_6_1,
  input w_7_0,
  input w_7_1,
  input w_8_0,
  input w_8_1,
  input w_9_0,
  input w_9_1,
  input w_10_0,
  input w_10_1,
  input w_11_0,
  input w_11_1,
  input w_12_0,
  input w_12_1,
  input w_13_0,
  input w_13_1,
  input w_14_0,
  input w_14_1,
  input w_15_0,
  input w_15_1,
  input w_16_0,
  input w_16_1,
  input w_17_0,
  input w_17_1,
  input w_18_0,
  input w_18_1,
  input w_19_0,
  input w_19_1,
  input w_20_0,
  input w_20_1,
  input w_21_0,
  input w_21_1,
  input w_22_0,
  input w_22_1,
  input w_23_0,
  input w_23_1,
  input w_24_0,
  input w_24_1,
  input w_25_0,
  input w_25_1,
  input w_26_0,
  input w_26_1,
  input w_27_0,
  input w_27_1,
  input w_28_0,
  input w_28_1,
  input w_29_0,
  input w_29_1,
  input w_30_0,
  input w_30_1,
  input w_31_0,
  input w_31_1,
  input w_32_0,
  input w_32_1,
  input w_33_0,
  input w_33_1,
  input w_34_0,
  input w_34_1,
  input w_35_0,
  input w_35_1,
  input w_36_0,
  input w_36_1,
  input w_37_0,
  input w_37_1,
  input w_38_0,
  input w_38_1,
  input w_39_0,
  input w_39_1,
  input w_40_0,
  input w_40_1,
  input w_41_0,
  input w_41_1,
  input w_42_0,
  input w_42_1,
  input w_43_0,
  input w_43_1,
  input w_44_0,
  input w_44_1,
  input w_45_0,
  input w_45_1,
  input w_46_0,
  input w_46_1,
  input w_47_0,
  input w_47_1,
  input w_48_0,
  input w_48_1,
  input w_49_0,
  input w_49_1,
  input w_50_0,
  input w_50_1,
  input w_51_0,
  input w_51_1,
  input w_52_0,
  input w_52_1,
  input w_53_0,
  input w_53_1,
  input w_54_0,
  input w_54_1,
  input w_55_0,
  input w_55_1,
  input w_56_0,
  input w_56_1,
  input w_57_0,
  input w_57_1,
  input w_58_0,
  input w_58_1,
  input w_59_0,
  input w_59_1,
  input w_60_0,
  input w_60_1,
  input w_61_0,
  input w_61_1,
  input w_62_0,
  input w_62_1,
  input w_63_0,
  input w_63_1,
  output signed [12:0] y_0,
  output signed [12:0] y_1
);
  reg [5:0] sr_0;
  wire b_0 = sr_0[5];
  reg [5:0] sr_1;
  wire b_1 = sr_1[5];
  reg [5:0] sr_2;
  wire b_2 = sr_2[5];
  reg [5:0] sr_3;
  wire b_3 = sr_3[5];
  reg [5:0] sr_4;
  wire b_4 = sr_4[5];
  reg [5:0] sr_5;
  wire b_5 = sr_5[5];
  reg [5:0] sr_6;
  wire b_6 = sr_6[5];
  reg [5:0] sr_7;
  wire b_7 = sr_7[5];
  reg [5:0] sr_8;
  wire b_8 = sr_8[5];
  reg [5:0] sr_9;
  wire b_9 = sr_9[5];
  reg [5:0] sr_10;
  wire b_10 = sr_10[5];
  reg [5:0] sr_11;
  wire b_11 = sr_11[5];
  reg [5:0] sr_12;
  wire b_12 = sr_12[5];
  reg [5:0] sr_13;
  wire b_13 = sr_13[5];
  reg [5:0] sr_14;
  wire b_14 = sr_14[5];
  reg [5:0] sr_15;
  wire b_15 = sr_15[5];
  reg [5:0] sr_16;
  wire b_16 = sr_16[5];
  reg [5:0] sr_17;
  wire b_17 = sr_17[5];
  reg [5:0] sr_18;
  wire b_18 = sr_18[5];
  reg [5:0] sr_19;
  wire b_19 = sr_19[5];
  reg [5:0] sr_20;
  wire b_20 = sr_20[5];
  reg [5:0] sr_21;
  wire b_21 = sr_21[5];
  reg [5:0] sr_22;
  wire b_22 = sr_22[5];
  reg [5:0] sr_23;
  wire b_23 = sr_23[5];
  reg [5:0] sr_24;
  wire b_24 = sr_24[5];
  reg [5:0] sr_25;
  wire b_25 = sr_25[5];
  reg [5:0] sr_26;
  wire b_26 = sr_26[5];
  reg [5:0] sr_27;
  wire b_27 = sr_27[5];
  reg [5:0] sr_28;
  wire b_28 = sr_28[5];
  reg [5:0] sr_29;
  wire b_29 = sr_29[5];
  reg [5:0] sr_30;
  wire b_30 = sr_30[5];
  reg [5:0] sr_31;
  wire b_31 = sr_31[5];
  reg [5:0] sr_32;
  wire b_32 = sr_32[5];
  reg [5:0] sr_33;
  wire b_33 = sr_33[5];
  reg [5:0] sr_34;
  wire b_34 = sr_34[5];
  reg [5:0] sr_35;
  wire b_35 = sr_35[5];
  reg [5:0] sr_36;
  wire b_36 = sr_36[5];
  reg [5:0] sr_37;
  wire b_37 = sr_37[5];
  reg [5:0] sr_38;
  wire b_38 = sr_38[5];
  reg [5:0] sr_39;
  wire b_39 = sr_39[5];
  reg [5:0] sr_40;
  wire b_40 = sr_40[5];
  reg [5:0] sr_41;
  wire b_41 = sr_41[5];
  reg [5:0] sr_42;
  wire b_42 = sr_42[5];
  reg [5:0] sr_43;
  wire b_43 = sr_43[5];
  reg [5:0] sr_44;
  wire b_44 = sr_44[5];
  reg [5:0] sr_45;
  wire b_45 = sr_45[5];
  reg [5:0] sr_46;
  wire b_46 = sr_46[5];
  reg [5:0] sr_47;
  wire b_47 = sr_47[5];
  reg [5:0] sr_48;
  wire b_48 = sr_48[5];
  reg [5:0] sr_49;
  wire b_49 = sr_49[5];
  reg [5:0] sr_50;
  wire b_50 = sr_50[5];
  reg [5:0] sr_51;
  wire b_51 = sr_51[5];
  reg [5:0] sr_52;
  wire b_52 = sr_52[5];
  reg [5:0] sr_53;
  wire b_53 = sr_53[5];
  reg [5:0] sr_54;
  wire b_54 = sr_54[5];
  reg [5:0] sr_55;
  wire b_55 = sr_55[5];
  reg [5:0] sr_56;
  wire b_56 = sr_56[5];
  reg [5:0] sr_57;
  wire b_57 = sr_57[5];
  reg [5:0] sr_58;
  wire b_58 = sr_58[5];
  reg [5:0] sr_59;
  wire b_59 = sr_59[5];
  reg [5:0] sr_60;
  wire b_60 = sr_60[5];
  reg [5:0] sr_61;
  wire b_61 = sr_61[5];
  reg [5:0] sr_62;
  wire b_62 = sr_62[5];
  reg [5:0] sr_63;
  wire b_63 = sr_63[5];
  wire signed [1:0] pp_0_0 = {1'b0, b_0 & w_0_0};
  wire signed [1:0] pp_1_0 = {1'b0, b_1 & w_1_0};
  wire signed [1:0] pp_2_0 = {1'b0, b_2 & w_2_0};
  wire signed [1:0] pp_3_0 = {1'b0, b_3 & w_3_0};
  wire signed [1:0] pp_4_0 = {1'b0, b_4 & w_4_0};
  wire signed [1:0] pp_5_0 = {1'b0, b_5 & w_5_0};
  wire signed [1:0] pp_6_0 = {1'b0, b_6 & w_6_0};
  wire signed [1:0] pp_7_0 = {1'b0, b_7 & w_7_0};
  wire signed [1:0] pp_8_0 = {1'b0, b_8 & w_8_0};
  wire signed [1:0] pp_9_0 = {1'b0, b_9 & w_9_0};
  wire signed [1:0] pp_10_0 = {1'b0, b_10 & w_10_0};
  wire signed [1:0] pp_11_0 = {1'b0, b_11 & w_11_0};
  wire signed [1:0] pp_12_0 = {1'b0, b_12 & w_12_0};
  wire signed [1:0] pp_13_0 = {1'b0, b_13 & w_13_0};
  wire signed [1:0] pp_14_0 = {1'b0, b_14 & w_14_0};
  wire signed [1:0] pp_15_0 = {1'b0, b_15 & w_15_0};
  wire signed [1:0] pp_16_0 = {1'b0, b_16 & w_16_0};
  wire signed [1:0] pp_17_0 = {1'b0, b_17 & w_17_0};
  wire signed [1:0] pp_18_0 = {1'b0, b_18 & w_18_0};
  wire signed [1:0] pp_19_0 = {1'b0, b_19 & w_19_0};
  wire signed [1:0] pp_20_0 = {1'b0, b_20 & w_20_0};
  wire signed [1:0] pp_21_0 = {1'b0, b_21 & w_21_0};
  wire signed [1:0] pp_22_0 = {1'b0, b_22 & w_22_0};
  wire signed [1:0] pp_23_0 = {1'b0, b_23 & w_23_0};
  wire signed [1:0] pp_24_0 = {1'b0, b_24 & w_24_0};
  wire signed [1:0] pp_25_0 = {1'b0, b_25 & w_25_0};
  wire signed [1:0] pp_26_0 = {1'b0, b_26 & w_26_0};
  wire signed [1:0] pp_27_0 = {1'b0, b_27 & w_27_0};
  wire signed [1:0] pp_28_0 = {1'b0, b_28 & w_28_0};
  wire signed [1:0] pp_29_0 = {1'b0, b_29 & w_29_0};
  wire signed [1:0] pp_30_0 = {1'b0, b_30 & w_30_0};
  wire signed [1:0] pp_31_0 = {1'b0, b_31 & w_31_0};
  wire signed [1:0] pp_32_0 = {1'b0, b_32 & w_32_0};
  wire signed [1:0] pp_33_0 = {1'b0, b_33 & w_33_0};
  wire signed [1:0] pp_34_0 = {1'b0, b_34 & w_34_0};
  wire signed [1:0] pp_35_0 = {1'b0, b_35 & w_35_0};
  wire signed [1:0] pp_36_0 = {1'b0, b_36 & w_36_0};
  wire signed [1:0] pp_37_0 = {1'b0, b_37 & w_37_0};
  wire signed [1:0] pp_38_0 = {1'b0, b_38 & w_38_0};
  wire signed [1:0] pp_39_0 = {1'b0, b_39 & w_39_0};
  wire signed [1:0] pp_40_0 = {1'b0, b_40 & w_40_0};
  wire signed [1:0] pp_41_0 = {1'b0, b_41 & w_41_0};
  wire signed [1:0] pp_42_0 = {1'b0, b_42 & w_42_0};
  wire signed [1:0] pp_43_0 = {1'b0, b_43 & w_43_0};
  wire signed [1:0] pp_44_0 = {1'b0, b_44 & w_44_0};
  wire signed [1:0] pp_45_0 = {1'b0, b_45 & w_45_0};
  wire signed [1:0] pp_46_0 = {1'b0, b_46 & w_46_0};
  wire signed [1:0] pp_47_0 = {1'b0, b_47 & w_47_0};
  wire signed [1:0] pp_48_0 = {1'b0, b_48 & w_48_0};
  wire signed [1:0] pp_49_0 = {1'b0, b_49 & w_49_0};
  wire signed [1:0] pp_50_0 = {1'b0, b_50 & w_50_0};
  wire signed [1:0] pp_51_0 = {1'b0, b_51 & w_51_0};
  wire signed [1:0] pp_52_0 = {1'b0, b_52 & w_52_0};
  wire signed [1:0] pp_53_0 = {1'b0, b_53 & w_53_0};
  wire signed [1:0] pp_54_0 = {1'b0, b_54 & w_54_0};
  wire signed [1:0] pp_55_0 = {1'b0, b_55 & w_55_0};
  wire signed [1:0] pp_56_0 = {1'b0, b_56 & w_56_0};
  wire signed [1:0] pp_57_0 = {1'b0, b_57 & w_57_0};
  wire signed [1:0] pp_58_0 = {1'b0, b_58 & w_58_0};
  wire signed [1:0] pp_59_0 = {1'b0, b_59 & w_59_0};
  wire signed [1:0] pp_60_0 = {1'b0, b_60 & w_60_0};
  wire signed [1:0] pp_61_0 = {1'b0, b_61 & w_61_0};
  wire signed [1:0] pp_62_0 = {1'b0, b_62 & w_62_0};
  wire signed [1:0] pp_63_0 = {1'b0, b_63 & w_63_0};
  wire signed [2:0] t0_l0_0;
  assign t0_l0_0 = $signed(pp_0_0) + $signed(pp_1_0);
  wire signed [2:0] t0_l0_1;
  assign t0_l0_1 = $signed(pp_2_0) + $signed(pp_3_0);
  wire signed [2:0] t0_l0_2;
  assign t0_l0_2 = $signed(pp_4_0) + $signed(pp_5_0);
  wire signed [2:0] t0_l0_3;
  assign t0_l0_3 = $signed(pp_6_0) + $signed(pp_7_0);
  wire signed [2:0] t0_l0_4;
  assign t0_l0_4 = $signed(pp_8_0) + $signed(pp_9_0);
  wire signed [2:0] t0_l0_5;
  assign t0_l0_5 = $signed(pp_10_0) + $signed(pp_11_0);
  wire signed [2:0] t0_l0_6;
  assign t0_l0_6 = $signed(pp_12_0) + $signed(pp_13_0);
  wire signed [2:0] t0_l0_7;
  assign t0_l0_7 = $signed(pp_14_0) + $signed(pp_15_0);
  wire signed [2:0] t0_l0_8;
  assign t0_l0_8 = $signed(pp_16_0) + $signed(pp_17_0);
  wire signed [2:0] t0_l0_9;
  assign t0_l0_9 = $signed(pp_18_0) + $signed(pp_19_0);
  wire signed [2:0] t0_l0_10;
  assign t0_l0_10 = $signed(pp_20_0) + $signed(pp_21_0);
  wire signed [2:0] t0_l0_11;
  assign t0_l0_11 = $signed(pp_22_0) + $signed(pp_23_0);
  wire signed [2:0] t0_l0_12;
  assign t0_l0_12 = $signed(pp_24_0) + $signed(pp_25_0);
  wire signed [2:0] t0_l0_13;
  assign t0_l0_13 = $signed(pp_26_0) + $signed(pp_27_0);
  wire signed [2:0] t0_l0_14;
  assign t0_l0_14 = $signed(pp_28_0) + $signed(pp_29_0);
  wire signed [2:0] t0_l0_15;
  assign t0_l0_15 = $signed(pp_30_0) + $signed(pp_31_0);
  wire signed [2:0] t0_l0_16;
  assign t0_l0_16 = $signed(pp_32_0) + $signed(pp_33_0);
  wire signed [2:0] t0_l0_17;
  assign t0_l0_17 = $signed(pp_34_0) + $signed(pp_35_0);
  wire signed [2:0] t0_l0_18;
  assign t0_l0_18 = $signed(pp_36_0) + $signed(pp_37_0);
  wire signed [2:0] t0_l0_19;
  assign t0_l0_19 = $signed(pp_38_0) + $signed(pp_39_0);
  wire signed [2:0] t0_l0_20;
  assign t0_l0_20 = $signed(pp_40_0) + $signed(pp_41_0);
  wire signed [2:0] t0_l0_21;
  assign t0_l0_21 = $signed(pp_42_0) + $signed(pp_43_0);
  wire signed [2:0] t0_l0_22;
  assign t0_l0_22 = $signed(pp_44_0) + $signed(pp_45_0);
  wire signed [2:0] t0_l0_23;
  assign t0_l0_23 = $signed(pp_46_0) + $signed(pp_47_0);
  wire signed [2:0] t0_l0_24;
  assign t0_l0_24 = $signed(pp_48_0) + $signed(pp_49_0);
  wire signed [2:0] t0_l0_25;
  assign t0_l0_25 = $signed(pp_50_0) + $signed(pp_51_0);
  wire signed [2:0] t0_l0_26;
  assign t0_l0_26 = $signed(pp_52_0) + $signed(pp_53_0);
  wire signed [2:0] t0_l0_27;
  assign t0_l0_27 = $signed(pp_54_0) + $signed(pp_55_0);
  wire signed [2:0] t0_l0_28;
  assign t0_l0_28 = $signed(pp_56_0) + $signed(pp_57_0);
  wire signed [2:0] t0_l0_29;
  assign t0_l0_29 = $signed(pp_58_0) + $signed(pp_59_0);
  wire signed [2:0] t0_l0_30;
  assign t0_l0_30 = $signed(pp_60_0) + $signed(pp_61_0);
  wire signed [2:0] t0_l0_31;
  assign t0_l0_31 = $signed(pp_62_0) + $signed(pp_63_0);
  wire signed [3:0] t0_l1_0;
  assign t0_l1_0 = $signed(t0_l0_0) + $signed(t0_l0_1);
  wire signed [3:0] t0_l1_1;
  assign t0_l1_1 = $signed(t0_l0_2) + $signed(t0_l0_3);
  wire signed [3:0] t0_l1_2;
  assign t0_l1_2 = $signed(t0_l0_4) + $signed(t0_l0_5);
  wire signed [3:0] t0_l1_3;
  assign t0_l1_3 = $signed(t0_l0_6) + $signed(t0_l0_7);
  wire signed [3:0] t0_l1_4;
  assign t0_l1_4 = $signed(t0_l0_8) + $signed(t0_l0_9);
  wire signed [3:0] t0_l1_5;
  assign t0_l1_5 = $signed(t0_l0_10) + $signed(t0_l0_11);
  wire signed [3:0] t0_l1_6;
  assign t0_l1_6 = $signed(t0_l0_12) + $signed(t0_l0_13);
  wire signed [3:0] t0_l1_7;
  assign t0_l1_7 = $signed(t0_l0_14) + $signed(t0_l0_15);
  wire signed [3:0] t0_l1_8;
  assign t0_l1_8 = $signed(t0_l0_16) + $signed(t0_l0_17);
  wire signed [3:0] t0_l1_9;
  assign t0_l1_9 = $signed(t0_l0_18) + $signed(t0_l0_19);
  wire signed [3:0] t0_l1_10;
  assign t0_l1_10 = $signed(t0_l0_20) + $signed(t0_l0_21);
  wire signed [3:0] t0_l1_11;
  assign t0_l1_11 = $signed(t0_l0_22) + $signed(t0_l0_23);
  wire signed [3:0] t0_l1_12;
  assign t0_l1_12 = $signed(t0_l0_24) + $signed(t0_l0_25);
  wire signed [3:0] t0_l1_13;
  assign t0_l1_13 = $signed(t0_l0_26) + $signed(t0_l0_27);
  wire signed [3:0] t0_l1_14;
  assign t0_l1_14 = $signed(t0_l0_28) + $signed(t0_l0_29);
  wire signed [3:0] t0_l1_15;
  assign t0_l1_15 = $signed(t0_l0_30) + $signed(t0_l0_31);
  wire signed [4:0] t0_l2_0;
  assign t0_l2_0 = $signed(t0_l1_0) + $signed(t0_l1_1);
  wire signed [4:0] t0_l2_1;
  assign t0_l2_1 = $signed(t0_l1_2) + $signed(t0_l1_3);
  wire signed [4:0] t0_l2_2;
  assign t0_l2_2 = $signed(t0_l1_4) + $signed(t0_l1_5);
  wire signed [4:0] t0_l2_3;
  assign t0_l2_3 = $signed(t0_l1_6) + $signed(t0_l1_7);
  wire signed [4:0] t0_l2_4;
  assign t0_l2_4 = $signed(t0_l1_8) + $signed(t0_l1_9);
  wire signed [4:0] t0_l2_5;
  assign t0_l2_5 = $signed(t0_l1_10) + $signed(t0_l1_11);
  wire signed [4:0] t0_l2_6;
  assign t0_l2_6 = $signed(t0_l1_12) + $signed(t0_l1_13);
  wire signed [4:0] t0_l2_7;
  assign t0_l2_7 = $signed(t0_l1_14) + $signed(t0_l1_15);
  reg signed [4:0] t0_l2_0_r;
  reg signed [4:0] t0_l2_1_r;
  reg signed [4:0] t0_l2_2_r;
  reg signed [4:0] t0_l2_3_r;
  reg signed [4:0] t0_l2_4_r;
  reg signed [4:0] t0_l2_5_r;
  reg signed [4:0] t0_l2_6_r;
  reg signed [4:0] t0_l2_7_r;
  wire signed [5:0] t0_l3_0;
  assign t0_l3_0 = $signed(t0_l2_0_r) + $signed(t0_l2_1_r);
  wire signed [5:0] t0_l3_1;
  assign t0_l3_1 = $signed(t0_l2_2_r) + $signed(t0_l2_3_r);
  wire signed [5:0] t0_l3_2;
  assign t0_l3_2 = $signed(t0_l2_4_r) + $signed(t0_l2_5_r);
  wire signed [5:0] t0_l3_3;
  assign t0_l3_3 = $signed(t0_l2_6_r) + $signed(t0_l2_7_r);
  wire signed [6:0] t0_l4_0;
  assign t0_l4_0 = $signed(t0_l3_0) + $signed(t0_l3_1);
  wire signed [6:0] t0_l4_1;
  assign t0_l4_1 = $signed(t0_l3_2) + $signed(t0_l3_3);
  wire signed [7:0] t0_l5_0;
  assign t0_l5_0 = $signed(t0_l4_0) + $signed(t0_l4_1);
  reg signed [12:0] acc_0;
  assign y_0 = acc_0;
  wire signed [1:0] pp_0_1 = {1'b0, b_0 & w_0_1};
  wire signed [1:0] pp_1_1 = {1'b0, b_1 & w_1_1};
  wire signed [1:0] pp_2_1 = {1'b0, b_2 & w_2_1};
  wire signed [1:0] pp_3_1 = {1'b0, b_3 & w_3_1};
  wire signed [1:0] pp_4_1 = {1'b0, b_4 & w_4_1};
  wire signed [1:0] pp_5_1 = {1'b0, b_5 & w_5_1};
  wire signed [1:0] pp_6_1 = {1'b0, b_6 & w_6_1};
  wire signed [1:0] pp_7_1 = {1'b0, b_7 & w_7_1};
  wire signed [1:0] pp_8_1 = {1'b0, b_8 & w_8_1};
  wire signed [1:0] pp_9_1 = {1'b0, b_9 & w_9_1};
  wire signed [1:0] pp_10_1 = {1'b0, b_10 & w_10_1};
  wire signed [1:0] pp_11_1 = {1'b0, b_11 & w_11_1};
  wire signed [1:0] pp_12_1 = {1'b0, b_12 & w_12_1};
  wire signed [1:0] pp_13_1 = {1'b0, b_13 & w_13_1};
  wire signed [1:0] pp_14_1 = {1'b0, b_14 & w_14_1};
  wire signed [1:0] pp_15_1 = {1'b0, b_15 & w_15_1};
  wire signed [1:0] pp_16_1 = {1'b0, b_16 & w_16_1};
  wire signed [1:0] pp_17_1 = {1'b0, b_17 & w_17_1};
  wire signed [1:0] pp_18_1 = {1'b0, b_18 & w_18_1};
  wire signed [1:0] pp_19_1 = {1'b0, b_19 & w_19_1};
  wire signed [1:0] pp_20_1 = {1'b0, b_20 & w_20_1};
  wire signed [1:0] pp_21_1 = {1'b0, b_21 & w_21_1};
  wire signed [1:0] pp_22_1 = {1'b0, b_22 & w_22_1};
  wire signed [1:0] pp_23_1 = {1'b0, b_23 & w_23_1};
  wire signed [1:0] pp_24_1 = {1'b0, b_24 & w_24_1};
  wire signed [1:0] pp_25_1 = {1'b0, b_25 & w_25_1};
  wire signed [1:0] pp_26_1 = {1'b0, b_26 & w_26_1};
  wire signed [1:0] pp_27_1 = {1'b0, b_27 & w_27_1};
  wire signed [1:0] pp_28_1 = {1'b0, b_28 & w_28_1};
  wire signed [1:0] pp_29_1 = {1'b0, b_29 & w_29_1};
  wire signed [1:0] pp_30_1 = {1'b0, b_30 & w_30_1};
  wire signed [1:0] pp_31_1 = {1'b0, b_31 & w_31_1};
  wire signed [1:0] pp_32_1 = {1'b0, b_32 & w_32_1};
  wire signed [1:0] pp_33_1 = {1'b0, b_33 & w_33_1};
  wire signed [1:0] pp_34_1 = {1'b0, b_34 & w_34_1};
  wire signed [1:0] pp_35_1 = {1'b0, b_35 & w_35_1};
  wire signed [1:0] pp_36_1 = {1'b0, b_36 & w_36_1};
  wire signed [1:0] pp_37_1 = {1'b0, b_37 & w_37_1};
  wire signed [1:0] pp_38_1 = {1'b0, b_38 & w_38_1};
  wire signed [1:0] pp_39_1 = {1'b0, b_39 & w_39_1};
  wire signed [1:0] pp_40_1 = {1'b0, b_40 & w_40_1};
  wire signed [1:0] pp_41_1 = {1'b0, b_41 & w_41_1};
  wire signed [1:0] pp_42_1 = {1'b0, b_42 & w_42_1};
  wire signed [1:0] pp_43_1 = {1'b0, b_43 & w_43_1};
  wire signed [1:0] pp_44_1 = {1'b0, b_44 & w_44_1};
  wire signed [1:0] pp_45_1 = {1'b0, b_45 & w_45_1};
  wire signed [1:0] pp_46_1 = {1'b0, b_46 & w_46_1};
  wire signed [1:0] pp_47_1 = {1'b0, b_47 & w_47_1};
  wire signed [1:0] pp_48_1 = {1'b0, b_48 & w_48_1};
  wire signed [1:0] pp_49_1 = {1'b0, b_49 & w_49_1};
  wire signed [1:0] pp_50_1 = {1'b0, b_50 & w_50_1};
  wire signed [1:0] pp_51_1 = {1'b0, b_51 & w_51_1};
  wire signed [1:0] pp_52_1 = {1'b0, b_52 & w_52_1};
  wire signed [1:0] pp_53_1 = {1'b0, b_53 & w_53_1};
  wire signed [1:0] pp_54_1 = {1'b0, b_54 & w_54_1};
  wire signed [1:0] pp_55_1 = {1'b0, b_55 & w_55_1};
  wire signed [1:0] pp_56_1 = {1'b0, b_56 & w_56_1};
  wire signed [1:0] pp_57_1 = {1'b0, b_57 & w_57_1};
  wire signed [1:0] pp_58_1 = {1'b0, b_58 & w_58_1};
  wire signed [1:0] pp_59_1 = {1'b0, b_59 & w_59_1};
  wire signed [1:0] pp_60_1 = {1'b0, b_60 & w_60_1};
  wire signed [1:0] pp_61_1 = {1'b0, b_61 & w_61_1};
  wire signed [1:0] pp_62_1 = {1'b0, b_62 & w_62_1};
  wire signed [1:0] pp_63_1 = {1'b0, b_63 & w_63_1};
  wire signed [2:0] t1_l0_0;
  assign t1_l0_0 = $signed(pp_0_1) + $signed(pp_1_1);
  wire signed [2:0] t1_l0_1;
  assign t1_l0_1 = $signed(pp_2_1) + $signed(pp_3_1);
  wire signed [2:0] t1_l0_2;
  assign t1_l0_2 = $signed(pp_4_1) + $signed(pp_5_1);
  wire signed [2:0] t1_l0_3;
  assign t1_l0_3 = $signed(pp_6_1) + $signed(pp_7_1);
  wire signed [2:0] t1_l0_4;
  assign t1_l0_4 = $signed(pp_8_1) + $signed(pp_9_1);
  wire signed [2:0] t1_l0_5;
  assign t1_l0_5 = $signed(pp_10_1) + $signed(pp_11_1);
  wire signed [2:0] t1_l0_6;
  assign t1_l0_6 = $signed(pp_12_1) + $signed(pp_13_1);
  wire signed [2:0] t1_l0_7;
  assign t1_l0_7 = $signed(pp_14_1) + $signed(pp_15_1);
  wire signed [2:0] t1_l0_8;
  assign t1_l0_8 = $signed(pp_16_1) + $signed(pp_17_1);
  wire signed [2:0] t1_l0_9;
  assign t1_l0_9 = $signed(pp_18_1) + $signed(pp_19_1);
  wire signed [2:0] t1_l0_10;
  assign t1_l0_10 = $signed(pp_20_1) + $signed(pp_21_1);
  wire signed [2:0] t1_l0_11;
  assign t1_l0_11 = $signed(pp_22_1) + $signed(pp_23_1);
  wire signed [2:0] t1_l0_12;
  assign t1_l0_12 = $signed(pp_24_1) + $signed(pp_25_1);
  wire signed [2:0] t1_l0_13;
  assign t1_l0_13 = $signed(pp_26_1) + $signed(pp_27_1);
  wire signed [2:0] t1_l0_14;
  assign t1_l0_14 = $signed(pp_28_1) + $signed(pp_29_1);
  wire signed [2:0] t1_l0_15;
  assign t1_l0_15 = $signed(pp_30_1) + $signed(pp_31_1);
  wire signed [2:0] t1_l0_16;
  assign t1_l0_16 = $signed(pp_32_1) + $signed(pp_33_1);
  wire signed [2:0] t1_l0_17;
  assign t1_l0_17 = $signed(pp_34_1) + $signed(pp_35_1);
  wire signed [2:0] t1_l0_18;
  assign t1_l0_18 = $signed(pp_36_1) + $signed(pp_37_1);
  wire signed [2:0] t1_l0_19;
  assign t1_l0_19 = $signed(pp_38_1) + $signed(pp_39_1);
  wire signed [2:0] t1_l0_20;
  assign t1_l0_20 = $signed(pp_40_1) + $signed(pp_41_1);
  wire signed [2:0] t1_l0_21;
  assign t1_l0_21 = $signed(pp_42_1) + $signed(pp_43_1);
  wire signed [2:0] t1_l0_22;
  assign t1_l0_22 = $signed(pp_44_1) + $signed(pp_45_1);
  wire signed [2:0] t1_l0_23;
  assign t1_l0_23 = $signed(pp_46_1) + $signed(pp_47_1);
  wire signed [2:0] t1_l0_24;
  assign t1_l0_24 = $signed(pp_48_1) + $signed(pp_49_1);
  wire signed [2:0] t1_l0_25;
  assign t1_l0_25 = $signed(pp_50_1) + $signed(pp_51_1);
  wire signed [2:0] t1_l0_26;
  assign t1_l0_26 = $signed(pp_52_1) + $signed(pp_53_1);
  wire signed [2:0] t1_l0_27;
  assign t1_l0_27 = $signed(pp_54_1) + $signed(pp_55_1);
  wire signed [2:0] t1_l0_28;
  assign t1_l0_28 = $signed(pp_56_1) + $signed(pp_57_1);
  wire signed [2:0] t1_l0_29;
  assign t1_l0_29 = $signed(pp_58_1) + $signed(pp_59_1);
  wire signed [2:0] t1_l0_30;
  assign t1_l0_30 = $signed(pp_60_1) + $signed(pp_61_1);
  wire signed [2:0] t1_l0_31;
  assign t1_l0_31 = $signed(pp_62_1) + $signed(pp_63_1);
  wire signed [3:0] t1_l1_0;
  assign t1_l1_0 = $signed(t1_l0_0) + $signed(t1_l0_1);
  wire signed [3:0] t1_l1_1;
  assign t1_l1_1 = $signed(t1_l0_2) + $signed(t1_l0_3);
  wire signed [3:0] t1_l1_2;
  assign t1_l1_2 = $signed(t1_l0_4) + $signed(t1_l0_5);
  wire signed [3:0] t1_l1_3;
  assign t1_l1_3 = $signed(t1_l0_6) + $signed(t1_l0_7);
  wire signed [3:0] t1_l1_4;
  assign t1_l1_4 = $signed(t1_l0_8) + $signed(t1_l0_9);
  wire signed [3:0] t1_l1_5;
  assign t1_l1_5 = $signed(t1_l0_10) + $signed(t1_l0_11);
  wire signed [3:0] t1_l1_6;
  assign t1_l1_6 = $signed(t1_l0_12) + $signed(t1_l0_13);
  wire signed [3:0] t1_l1_7;
  assign t1_l1_7 = $signed(t1_l0_14) + $signed(t1_l0_15);
  wire signed [3:0] t1_l1_8;
  assign t1_l1_8 = $signed(t1_l0_16) + $signed(t1_l0_17);
  wire signed [3:0] t1_l1_9;
  assign t1_l1_9 = $signed(t1_l0_18) + $signed(t1_l0_19);
  wire signed [3:0] t1_l1_10;
  assign t1_l1_10 = $signed(t1_l0_20) + $signed(t1_l0_21);
  wire signed [3:0] t1_l1_11;
  assign t1_l1_11 = $signed(t1_l0_22) + $signed(t1_l0_23);
  wire signed [3:0] t1_l1_12;
  assign t1_l1_12 = $signed(t1_l0_24) + $signed(t1_l0_25);
  wire signed [3:0] t1_l1_13;
  assign t1_l1_13 = $signed(t1_l0_26) + $signed(t1_l0_27);
  wire signed [3:0] t1_l1_14;
  assign t1_l1_14 = $signed(t1_l0_28) + $signed(t1_l0_29);
  wire signed [3:0] t1_l1_15;
  assign t1_l1_15 = $signed(t1_l0_30) + $signed(t1_l0_31);
  wire signed [4:0] t1_l2_0;
  assign t1_l2_0 = $signed(t1_l1_0) + $signed(t1_l1_1);
  wire signed [4:0] t1_l2_1;
  assign t1_l2_1 = $signed(t1_l1_2) + $signed(t1_l1_3);
  wire signed [4:0] t1_l2_2;
  assign t1_l2_2 = $signed(t1_l1_4) + $signed(t1_l1_5);
  wire signed [4:0] t1_l2_3;
  assign t1_l2_3 = $signed(t1_l1_6) + $signed(t1_l1_7);
  wire signed [4:0] t1_l2_4;
  assign t1_l2_4 = $signed(t1_l1_8) + $signed(t1_l1_9);
  wire signed [4:0] t1_l2_5;
  assign t1_l2_5 = $signed(t1_l1_10) + $signed(t1_l1_11);
  wire signed [4:0] t1_l2_6;
  assign t1_l2_6 = $signed(t1_l1_12) + $signed(t1_l1_13);
  wire signed [4:0] t1_l2_7;
  assign t1_l2_7 = $signed(t1_l1_14) + $signed(t1_l1_15);
  reg signed [4:0] t1_l2_0_r;
  reg signed [4:0] t1_l2_1_r;
  reg signed [4:0] t1_l2_2_r;
  reg signed [4:0] t1_l2_3_r;
  reg signed [4:0] t1_l2_4_r;
  reg signed [4:0] t1_l2_5_r;
  reg signed [4:0] t1_l2_6_r;
  reg signed [4:0] t1_l2_7_r;
  wire signed [5:0] t1_l3_0;
  assign t1_l3_0 = $signed(t1_l2_0_r) + $signed(t1_l2_1_r);
  wire signed [5:0] t1_l3_1;
  assign t1_l3_1 = $signed(t1_l2_2_r) + $signed(t1_l2_3_r);
  wire signed [5:0] t1_l3_2;
  assign t1_l3_2 = $signed(t1_l2_4_r) + $signed(t1_l2_5_r);
  wire signed [5:0] t1_l3_3;
  assign t1_l3_3 = $signed(t1_l2_6_r) + $signed(t1_l2_7_r);
  wire signed [6:0] t1_l4_0;
  assign t1_l4_0 = $signed(t1_l3_0) + $signed(t1_l3_1);
  wire signed [6:0] t1_l4_1;
  assign t1_l4_1 = $signed(t1_l3_2) + $signed(t1_l3_3);
  wire signed [7:0] t1_l5_0;
  assign t1_l5_0 = $signed(t1_l4_0) + $signed(t1_l4_1);
  reg signed [12:0] acc_1;
  assign y_1 = acc_1;
  always @(posedge clk) begin
    sr_0 <= load ? x_0 : {sr_0[4:0], 1'b0};
    sr_1 <= load ? x_1 : {sr_1[4:0], 1'b0};
    sr_2 <= load ? x_2 : {sr_2[4:0], 1'b0};
    sr_3 <= load ? x_3 : {sr_3[4:0], 1'b0};
    sr_4 <= load ? x_4 : {sr_4[4:0], 1'b0};
    sr_5 <= load ? x_5 : {sr_5[4:0], 1'b0};
    sr_6 <= load ? x_6 : {sr_6[4:0], 1'b0};
    sr_7 <= load ? x_7 : {sr_7[4:0], 1'b0};
    sr_8 <= load ? x_8 : {sr_8[4:0], 1'b0};
    sr_9 <= load ? x_9 : {sr_9[4:0], 1'b0};
    sr_10 <= load ? x_10 : {sr_10[4:0], 1'b0};
    sr_11 <= load ? x_11 : {sr_11[4:0], 1'b0};
    sr_12 <= load ? x_12 : {sr_12[4:0], 1'b0};
    sr_13 <= load ? x_13 : {sr_13[4:0], 1'b0};
    sr_14 <= load ? x_14 : {sr_14[4:0], 1'b0};
    sr_15 <= load ? x_15 : {sr_15[4:0], 1'b0};
    sr_16 <= load ? x_16 : {sr_16[4:0], 1'b0};
    sr_17 <= load ? x_17 : {sr_17[4:0], 1'b0};
    sr_18 <= load ? x_18 : {sr_18[4:0], 1'b0};
    sr_19 <= load ? x_19 : {sr_19[4:0], 1'b0};
    sr_20 <= load ? x_20 : {sr_20[4:0], 1'b0};
    sr_21 <= load ? x_21 : {sr_21[4:0], 1'b0};
    sr_22 <= load ? x_22 : {sr_22[4:0], 1'b0};
    sr_23 <= load ? x_23 : {sr_23[4:0], 1'b0};
    sr_24 <= load ? x_24 : {sr_24[4:0], 1'b0};
    sr_25 <= load ? x_25 : {sr_25[4:0], 1'b0};
    sr_26 <= load ? x_26 : {sr_26[4:0], 1'b0};
    sr_27 <= load ? x_27 : {sr_27[4:0], 1'b0};
    sr_28 <= load ? x_28 : {sr_28[4:0], 1'b0};
    sr_29 <= load ? x_29 : {sr_29[4:0], 1'b0};
    sr_30 <= load ? x_30 : {sr_30[4:0], 1'b0};
    sr_31 <= load ? x_31 : {sr_31[4:0], 1'b0};
    sr_32 <= load ? x_32 : {sr_32[4:0], 1'b0};
    sr_33 <= load ? x_33 : {sr_33[4:0], 1'b0};
    sr_34 <= load ? x_34 : {sr_34[4:0], 1'b0};
    sr_35 <= load ? x_35 : {sr_35[4:0], 1'b0};
    sr_36 <= load ? x_36 : {sr_36[4:0], 1'b0};
    sr_37 <= load ? x_37 : {sr_37[4:0], 1'b0};
    sr_38 <= load ? x_38 : {sr_38[4:0], 1'b0};
    sr_39 <= load ? x_39 : {sr_39[4:0], 1'b0};
    sr_40 <= load ? x_40 : {sr_40[4:0], 1'b0};
    sr_41 <= load ? x_41 : {sr_41[4:0], 1'b0};
    sr_42 <= load ? x_42 : {sr_42[4:0], 1'b0};
    sr_43 <= load ? x_43 : {sr_43[4:0], 1'b0};
    sr_44 <= load ? x_44 : {sr_44[4:0], 1'b0};
    sr_45 <= load ? x_45 : {sr_45[4:0], 1'b0};
    sr_46 <= load ? x_46 : {sr_46[4:0], 1'b0};
    sr_47 <= load ? x_47 : {sr_47[4:0], 1'b0};
    sr_48 <= load ? x_48 : {sr_48[4:0], 1'b0};
    sr_49 <= load ? x_49 : {sr_49[4:0], 1'b0};
    sr_50 <= load ? x_50 : {sr_50[4:0], 1'b0};
    sr_51 <= load ? x_51 : {sr_51[4:0], 1'b0};
    sr_52 <= load ? x_52 : {sr_52[4:0], 1'b0};
    sr_53 <= load ? x_53 : {sr_53[4:0], 1'b0};
    sr_54 <= load ? x_54 : {sr_54[4:0], 1'b0};
    sr_55 <= load ? x_55 : {sr_55[4:0], 1'b0};
    sr_56 <= load ? x_56 : {sr_56[4:0], 1'b0};
    sr_57 <= load ? x_57 : {sr_57[4:0], 1'b0};
    sr_58 <= load ? x_58 : {sr_58[4:0], 1'b0};
    sr_59 <= load ? x_59 : {sr_59[4:0], 1'b0};
    sr_60 <= load ? x_60 : {sr_60[4:0], 1'b0};
    sr_61 <= load ? x_61 : {sr_61[4:0], 1'b0};
    sr_62 <= load ? x_62 : {sr_62[4:0], 1'b0};
    sr_63 <= load ? x_63 : {sr_63[4:0], 1'b0};
    t0_l2_0_r <= t0_l2_0;
    t0_l2_1_r <= t0_l2_1;
    t0_l2_2_r <= t0_l2_2;
    t0_l2_3_r <= t0_l2_3;
    t0_l2_4_r <= t0_l2_4;
    t0_l2_5_r <= t0_l2_5;
    t0_l2_6_r <= t0_l2_6;
    t0_l2_7_r <= t0_l2_7;
    acc_0 <= first ? -$signed(t0_l5_0) : (acc_0 <<< 1) + $signed(t0_l5_0);
    t1_l2_0_r <= t1_l2_0;
    t1_l2_1_r <= t1_l2_1;
    t1_l2_2_r <= t1_l2_2;
    t1_l2_3_r <= t1_l2_3;
    t1_l2_4_r <= t1_l2_4;
    t1_l2_5_r <= t1_l2_5;
    t1_l2_6_r <= t1_l2_6;
    t1_l2_7_r <= t1_l2_7;
    acc_1 <= first ? -$signed(t1_l5_0) : (acc_1 <<< 1) + $signed(t1_l5_0);
  end
endmodule