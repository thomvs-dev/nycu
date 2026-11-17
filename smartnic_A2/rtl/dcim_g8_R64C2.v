module dcim_g8 (
  input clk,
  input first,
  input [2:0] gsel,
  input b_0,
  input b_1,
  input b_2,
  input b_3,
  input b_4,
  input b_5,
  input b_6,
  input b_7,
  input b_8,
  input b_9,
  input b_10,
  input b_11,
  input b_12,
  input b_13,
  input b_14,
  input b_15,
  input b_16,
  input b_17,
  input b_18,
  input b_19,
  input b_20,
  input b_21,
  input b_22,
  input b_23,
  input b_24,
  input b_25,
  input b_26,
  input b_27,
  input b_28,
  input b_29,
  input b_30,
  input b_31,
  input b_32,
  input b_33,
  input b_34,
  input b_35,
  input b_36,
  input b_37,
  input b_38,
  input b_39,
  input b_40,
  input b_41,
  input b_42,
  input b_43,
  input b_44,
  input b_45,
  input b_46,
  input b_47,
  input b_48,
  input b_49,
  input b_50,
  input b_51,
  input b_52,
  input b_53,
  input b_54,
  input b_55,
  input b_56,
  input b_57,
  input b_58,
  input b_59,
  input b_60,
  input b_61,
  input b_62,
  input b_63,
  input [63:0] wv_0_0,
  input [63:0] wv_0_1,
  input [63:0] wv_1_0,
  input [63:0] wv_1_1,
  input [63:0] wv_2_0,
  input [63:0] wv_2_1,
  input [63:0] wv_3_0,
  input [63:0] wv_3_1,
  input [63:0] wv_4_0,
  input [63:0] wv_4_1,
  input [63:0] wv_5_0,
  input [63:0] wv_5_1,
  input [63:0] wv_6_0,
  input [63:0] wv_6_1,
  input [63:0] wv_7_0,
  input [63:0] wv_7_1,
  input [63:0] wv_8_0,
  input [63:0] wv_8_1,
  input [63:0] wv_9_0,
  input [63:0] wv_9_1,
  input [63:0] wv_10_0,
  input [63:0] wv_10_1,
  input [63:0] wv_11_0,
  input [63:0] wv_11_1,
  input [63:0] wv_12_0,
  input [63:0] wv_12_1,
  input [63:0] wv_13_0,
  input [63:0] wv_13_1,
  input [63:0] wv_14_0,
  input [63:0] wv_14_1,
  input [63:0] wv_15_0,
  input [63:0] wv_15_1,
  input [63:0] wv_16_0,
  input [63:0] wv_16_1,
  input [63:0] wv_17_0,
  input [63:0] wv_17_1,
  input [63:0] wv_18_0,
  input [63:0] wv_18_1,
  input [63:0] wv_19_0,
  input [63:0] wv_19_1,
  input [63:0] wv_20_0,
  input [63:0] wv_20_1,
  input [63:0] wv_21_0,
  input [63:0] wv_21_1,
  input [63:0] wv_22_0,
  input [63:0] wv_22_1,
  input [63:0] wv_23_0,
  input [63:0] wv_23_1,
  input [63:0] wv_24_0,
  input [63:0] wv_24_1,
  input [63:0] wv_25_0,
  input [63:0] wv_25_1,
  input [63:0] wv_26_0,
  input [63:0] wv_26_1,
  input [63:0] wv_27_0,
  input [63:0] wv_27_1,
  input [63:0] wv_28_0,
  input [63:0] wv_28_1,
  input [63:0] wv_29_0,
  input [63:0] wv_29_1,
  input [63:0] wv_30_0,
  input [63:0] wv_30_1,
  input [63:0] wv_31_0,
  input [63:0] wv_31_1,
  input [63:0] wv_32_0,
  input [63:0] wv_32_1,
  input [63:0] wv_33_0,
  input [63:0] wv_33_1,
  input [63:0] wv_34_0,
  input [63:0] wv_34_1,
  input [63:0] wv_35_0,
  input [63:0] wv_35_1,
  input [63:0] wv_36_0,
  input [63:0] wv_36_1,
  input [63:0] wv_37_0,
  input [63:0] wv_37_1,
  input [63:0] wv_38_0,
  input [63:0] wv_38_1,
  input [63:0] wv_39_0,
  input [63:0] wv_39_1,
  input [63:0] wv_40_0,
  input [63:0] wv_40_1,
  input [63:0] wv_41_0,
  input [63:0] wv_41_1,
  input [63:0] wv_42_0,
  input [63:0] wv_42_1,
  input [63:0] wv_43_0,
  input [63:0] wv_43_1,
  input [63:0] wv_44_0,
  input [63:0] wv_44_1,
  input [63:0] wv_45_0,
  input [63:0] wv_45_1,
  input [63:0] wv_46_0,
  input [63:0] wv_46_1,
  input [63:0] wv_47_0,
  input [63:0] wv_47_1,
  input [63:0] wv_48_0,
  input [63:0] wv_48_1,
  input [63:0] wv_49_0,
  input [63:0] wv_49_1,
  input [63:0] wv_50_0,
  input [63:0] wv_50_1,
  input [63:0] wv_51_0,
  input [63:0] wv_51_1,
  input [63:0] wv_52_0,
  input [63:0] wv_52_1,
  input [63:0] wv_53_0,
  input [63:0] wv_53_1,
  input [63:0] wv_54_0,
  input [63:0] wv_54_1,
  input [63:0] wv_55_0,
  input [63:0] wv_55_1,
  input [63:0] wv_56_0,
  input [63:0] wv_56_1,
  input [63:0] wv_57_0,
  input [63:0] wv_57_1,
  input [63:0] wv_58_0,
  input [63:0] wv_58_1,
  input [63:0] wv_59_0,
  input [63:0] wv_59_1,
  input [63:0] wv_60_0,
  input [63:0] wv_60_1,
  input [63:0] wv_61_0,
  input [63:0] wv_61_1,
  input [63:0] wv_62_0,
  input [63:0] wv_62_1,
  input [63:0] wv_63_0,
  input [63:0] wv_63_1,
  output signed [20:0] y_0,
  output signed [20:0] y_1
);
  wire signed [7:0] w_0_0 = wv_0_0[gsel*8 +: 8];
  wire signed [7:0] pp_0_0 = b_0 ? w_0_0 : 8'sd0;
  wire signed [7:0] w_1_0 = wv_1_0[gsel*8 +: 8];
  wire signed [7:0] pp_1_0 = b_1 ? w_1_0 : 8'sd0;
  wire signed [7:0] w_2_0 = wv_2_0[gsel*8 +: 8];
  wire signed [7:0] pp_2_0 = b_2 ? w_2_0 : 8'sd0;
  wire signed [7:0] w_3_0 = wv_3_0[gsel*8 +: 8];
  wire signed [7:0] pp_3_0 = b_3 ? w_3_0 : 8'sd0;
  wire signed [7:0] w_4_0 = wv_4_0[gsel*8 +: 8];
  wire signed [7:0] pp_4_0 = b_4 ? w_4_0 : 8'sd0;
  wire signed [7:0] w_5_0 = wv_5_0[gsel*8 +: 8];
  wire signed [7:0] pp_5_0 = b_5 ? w_5_0 : 8'sd0;
  wire signed [7:0] w_6_0 = wv_6_0[gsel*8 +: 8];
  wire signed [7:0] pp_6_0 = b_6 ? w_6_0 : 8'sd0;
  wire signed [7:0] w_7_0 = wv_7_0[gsel*8 +: 8];
  wire signed [7:0] pp_7_0 = b_7 ? w_7_0 : 8'sd0;
  wire signed [7:0] w_8_0 = wv_8_0[gsel*8 +: 8];
  wire signed [7:0] pp_8_0 = b_8 ? w_8_0 : 8'sd0;
  wire signed [7:0] w_9_0 = wv_9_0[gsel*8 +: 8];
  wire signed [7:0] pp_9_0 = b_9 ? w_9_0 : 8'sd0;
  wire signed [7:0] w_10_0 = wv_10_0[gsel*8 +: 8];
  wire signed [7:0] pp_10_0 = b_10 ? w_10_0 : 8'sd0;
  wire signed [7:0] w_11_0 = wv_11_0[gsel*8 +: 8];
  wire signed [7:0] pp_11_0 = b_11 ? w_11_0 : 8'sd0;
  wire signed [7:0] w_12_0 = wv_12_0[gsel*8 +: 8];
  wire signed [7:0] pp_12_0 = b_12 ? w_12_0 : 8'sd0;
  wire signed [7:0] w_13_0 = wv_13_0[gsel*8 +: 8];
  wire signed [7:0] pp_13_0 = b_13 ? w_13_0 : 8'sd0;
  wire signed [7:0] w_14_0 = wv_14_0[gsel*8 +: 8];
  wire signed [7:0] pp_14_0 = b_14 ? w_14_0 : 8'sd0;
  wire signed [7:0] w_15_0 = wv_15_0[gsel*8 +: 8];
  wire signed [7:0] pp_15_0 = b_15 ? w_15_0 : 8'sd0;
  wire signed [7:0] w_16_0 = wv_16_0[gsel*8 +: 8];
  wire signed [7:0] pp_16_0 = b_16 ? w_16_0 : 8'sd0;
  wire signed [7:0] w_17_0 = wv_17_0[gsel*8 +: 8];
  wire signed [7:0] pp_17_0 = b_17 ? w_17_0 : 8'sd0;
  wire signed [7:0] w_18_0 = wv_18_0[gsel*8 +: 8];
  wire signed [7:0] pp_18_0 = b_18 ? w_18_0 : 8'sd0;
  wire signed [7:0] w_19_0 = wv_19_0[gsel*8 +: 8];
  wire signed [7:0] pp_19_0 = b_19 ? w_19_0 : 8'sd0;
  wire signed [7:0] w_20_0 = wv_20_0[gsel*8 +: 8];
  wire signed [7:0] pp_20_0 = b_20 ? w_20_0 : 8'sd0;
  wire signed [7:0] w_21_0 = wv_21_0[gsel*8 +: 8];
  wire signed [7:0] pp_21_0 = b_21 ? w_21_0 : 8'sd0;
  wire signed [7:0] w_22_0 = wv_22_0[gsel*8 +: 8];
  wire signed [7:0] pp_22_0 = b_22 ? w_22_0 : 8'sd0;
  wire signed [7:0] w_23_0 = wv_23_0[gsel*8 +: 8];
  wire signed [7:0] pp_23_0 = b_23 ? w_23_0 : 8'sd0;
  wire signed [7:0] w_24_0 = wv_24_0[gsel*8 +: 8];
  wire signed [7:0] pp_24_0 = b_24 ? w_24_0 : 8'sd0;
  wire signed [7:0] w_25_0 = wv_25_0[gsel*8 +: 8];
  wire signed [7:0] pp_25_0 = b_25 ? w_25_0 : 8'sd0;
  wire signed [7:0] w_26_0 = wv_26_0[gsel*8 +: 8];
  wire signed [7:0] pp_26_0 = b_26 ? w_26_0 : 8'sd0;
  wire signed [7:0] w_27_0 = wv_27_0[gsel*8 +: 8];
  wire signed [7:0] pp_27_0 = b_27 ? w_27_0 : 8'sd0;
  wire signed [7:0] w_28_0 = wv_28_0[gsel*8 +: 8];
  wire signed [7:0] pp_28_0 = b_28 ? w_28_0 : 8'sd0;
  wire signed [7:0] w_29_0 = wv_29_0[gsel*8 +: 8];
  wire signed [7:0] pp_29_0 = b_29 ? w_29_0 : 8'sd0;
  wire signed [7:0] w_30_0 = wv_30_0[gsel*8 +: 8];
  wire signed [7:0] pp_30_0 = b_30 ? w_30_0 : 8'sd0;
  wire signed [7:0] w_31_0 = wv_31_0[gsel*8 +: 8];
  wire signed [7:0] pp_31_0 = b_31 ? w_31_0 : 8'sd0;
  wire signed [7:0] w_32_0 = wv_32_0[gsel*8 +: 8];
  wire signed [7:0] pp_32_0 = b_32 ? w_32_0 : 8'sd0;
  wire signed [7:0] w_33_0 = wv_33_0[gsel*8 +: 8];
  wire signed [7:0] pp_33_0 = b_33 ? w_33_0 : 8'sd0;
  wire signed [7:0] w_34_0 = wv_34_0[gsel*8 +: 8];
  wire signed [7:0] pp_34_0 = b_34 ? w_34_0 : 8'sd0;
  wire signed [7:0] w_35_0 = wv_35_0[gsel*8 +: 8];
  wire signed [7:0] pp_35_0 = b_35 ? w_35_0 : 8'sd0;
  wire signed [7:0] w_36_0 = wv_36_0[gsel*8 +: 8];
  wire signed [7:0] pp_36_0 = b_36 ? w_36_0 : 8'sd0;
  wire signed [7:0] w_37_0 = wv_37_0[gsel*8 +: 8];
  wire signed [7:0] pp_37_0 = b_37 ? w_37_0 : 8'sd0;
  wire signed [7:0] w_38_0 = wv_38_0[gsel*8 +: 8];
  wire signed [7:0] pp_38_0 = b_38 ? w_38_0 : 8'sd0;
  wire signed [7:0] w_39_0 = wv_39_0[gsel*8 +: 8];
  wire signed [7:0] pp_39_0 = b_39 ? w_39_0 : 8'sd0;
  wire signed [7:0] w_40_0 = wv_40_0[gsel*8 +: 8];
  wire signed [7:0] pp_40_0 = b_40 ? w_40_0 : 8'sd0;
  wire signed [7:0] w_41_0 = wv_41_0[gsel*8 +: 8];
  wire signed [7:0] pp_41_0 = b_41 ? w_41_0 : 8'sd0;
  wire signed [7:0] w_42_0 = wv_42_0[gsel*8 +: 8];
  wire signed [7:0] pp_42_0 = b_42 ? w_42_0 : 8'sd0;
  wire signed [7:0] w_43_0 = wv_43_0[gsel*8 +: 8];
  wire signed [7:0] pp_43_0 = b_43 ? w_43_0 : 8'sd0;
  wire signed [7:0] w_44_0 = wv_44_0[gsel*8 +: 8];
  wire signed [7:0] pp_44_0 = b_44 ? w_44_0 : 8'sd0;
  wire signed [7:0] w_45_0 = wv_45_0[gsel*8 +: 8];
  wire signed [7:0] pp_45_0 = b_45 ? w_45_0 : 8'sd0;
  wire signed [7:0] w_46_0 = wv_46_0[gsel*8 +: 8];
  wire signed [7:0] pp_46_0 = b_46 ? w_46_0 : 8'sd0;
  wire signed [7:0] w_47_0 = wv_47_0[gsel*8 +: 8];
  wire signed [7:0] pp_47_0 = b_47 ? w_47_0 : 8'sd0;
  wire signed [7:0] w_48_0 = wv_48_0[gsel*8 +: 8];
  wire signed [7:0] pp_48_0 = b_48 ? w_48_0 : 8'sd0;
  wire signed [7:0] w_49_0 = wv_49_0[gsel*8 +: 8];
  wire signed [7:0] pp_49_0 = b_49 ? w_49_0 : 8'sd0;
  wire signed [7:0] w_50_0 = wv_50_0[gsel*8 +: 8];
  wire signed [7:0] pp_50_0 = b_50 ? w_50_0 : 8'sd0;
  wire signed [7:0] w_51_0 = wv_51_0[gsel*8 +: 8];
  wire signed [7:0] pp_51_0 = b_51 ? w_51_0 : 8'sd0;
  wire signed [7:0] w_52_0 = wv_52_0[gsel*8 +: 8];
  wire signed [7:0] pp_52_0 = b_52 ? w_52_0 : 8'sd0;
  wire signed [7:0] w_53_0 = wv_53_0[gsel*8 +: 8];
  wire signed [7:0] pp_53_0 = b_53 ? w_53_0 : 8'sd0;
  wire signed [7:0] w_54_0 = wv_54_0[gsel*8 +: 8];
  wire signed [7:0] pp_54_0 = b_54 ? w_54_0 : 8'sd0;
  wire signed [7:0] w_55_0 = wv_55_0[gsel*8 +: 8];
  wire signed [7:0] pp_55_0 = b_55 ? w_55_0 : 8'sd0;
  wire signed [7:0] w_56_0 = wv_56_0[gsel*8 +: 8];
  wire signed [7:0] pp_56_0 = b_56 ? w_56_0 : 8'sd0;
  wire signed [7:0] w_57_0 = wv_57_0[gsel*8 +: 8];
  wire signed [7:0] pp_57_0 = b_57 ? w_57_0 : 8'sd0;
  wire signed [7:0] w_58_0 = wv_58_0[gsel*8 +: 8];
  wire signed [7:0] pp_58_0 = b_58 ? w_58_0 : 8'sd0;
  wire signed [7:0] w_59_0 = wv_59_0[gsel*8 +: 8];
  wire signed [7:0] pp_59_0 = b_59 ? w_59_0 : 8'sd0;
  wire signed [7:0] w_60_0 = wv_60_0[gsel*8 +: 8];
  wire signed [7:0] pp_60_0 = b_60 ? w_60_0 : 8'sd0;
  wire signed [7:0] w_61_0 = wv_61_0[gsel*8 +: 8];
  wire signed [7:0] pp_61_0 = b_61 ? w_61_0 : 8'sd0;
  wire signed [7:0] w_62_0 = wv_62_0[gsel*8 +: 8];
  wire signed [7:0] pp_62_0 = b_62 ? w_62_0 : 8'sd0;
  wire signed [7:0] w_63_0 = wv_63_0[gsel*8 +: 8];
  wire signed [7:0] pp_63_0 = b_63 ? w_63_0 : 8'sd0;
  wire signed [8:0] t0_l0_0;
  assign t0_l0_0 = $signed(pp_0_0) + $signed(pp_1_0);
  wire signed [8:0] t0_l0_1;
  assign t0_l0_1 = $signed(pp_2_0) + $signed(pp_3_0);
  wire signed [8:0] t0_l0_2;
  assign t0_l0_2 = $signed(pp_4_0) + $signed(pp_5_0);
  wire signed [8:0] t0_l0_3;
  assign t0_l0_3 = $signed(pp_6_0) + $signed(pp_7_0);
  wire signed [8:0] t0_l0_4;
  assign t0_l0_4 = $signed(pp_8_0) + $signed(pp_9_0);
  wire signed [8:0] t0_l0_5;
  assign t0_l0_5 = $signed(pp_10_0) + $signed(pp_11_0);
  wire signed [8:0] t0_l0_6;
  assign t0_l0_6 = $signed(pp_12_0) + $signed(pp_13_0);
  wire signed [8:0] t0_l0_7;
  assign t0_l0_7 = $signed(pp_14_0) + $signed(pp_15_0);
  wire signed [8:0] t0_l0_8;
  assign t0_l0_8 = $signed(pp_16_0) + $signed(pp_17_0);
  wire signed [8:0] t0_l0_9;
  assign t0_l0_9 = $signed(pp_18_0) + $signed(pp_19_0);
  wire signed [8:0] t0_l0_10;
  assign t0_l0_10 = $signed(pp_20_0) + $signed(pp_21_0);
  wire signed [8:0] t0_l0_11;
  assign t0_l0_11 = $signed(pp_22_0) + $signed(pp_23_0);
  wire signed [8:0] t0_l0_12;
  assign t0_l0_12 = $signed(pp_24_0) + $signed(pp_25_0);
  wire signed [8:0] t0_l0_13;
  assign t0_l0_13 = $signed(pp_26_0) + $signed(pp_27_0);
  wire signed [8:0] t0_l0_14;
  assign t0_l0_14 = $signed(pp_28_0) + $signed(pp_29_0);
  wire signed [8:0] t0_l0_15;
  assign t0_l0_15 = $signed(pp_30_0) + $signed(pp_31_0);
  wire signed [8:0] t0_l0_16;
  assign t0_l0_16 = $signed(pp_32_0) + $signed(pp_33_0);
  wire signed [8:0] t0_l0_17;
  assign t0_l0_17 = $signed(pp_34_0) + $signed(pp_35_0);
  wire signed [8:0] t0_l0_18;
  assign t0_l0_18 = $signed(pp_36_0) + $signed(pp_37_0);
  wire signed [8:0] t0_l0_19;
  assign t0_l0_19 = $signed(pp_38_0) + $signed(pp_39_0);
  wire signed [8:0] t0_l0_20;
  assign t0_l0_20 = $signed(pp_40_0) + $signed(pp_41_0);
  wire signed [8:0] t0_l0_21;
  assign t0_l0_21 = $signed(pp_42_0) + $signed(pp_43_0);
  wire signed [8:0] t0_l0_22;
  assign t0_l0_22 = $signed(pp_44_0) + $signed(pp_45_0);
  wire signed [8:0] t0_l0_23;
  assign t0_l0_23 = $signed(pp_46_0) + $signed(pp_47_0);
  wire signed [8:0] t0_l0_24;
  assign t0_l0_24 = $signed(pp_48_0) + $signed(pp_49_0);
  wire signed [8:0] t0_l0_25;
  assign t0_l0_25 = $signed(pp_50_0) + $signed(pp_51_0);
  wire signed [8:0] t0_l0_26;
  assign t0_l0_26 = $signed(pp_52_0) + $signed(pp_53_0);
  wire signed [8:0] t0_l0_27;
  assign t0_l0_27 = $signed(pp_54_0) + $signed(pp_55_0);
  wire signed [8:0] t0_l0_28;
  assign t0_l0_28 = $signed(pp_56_0) + $signed(pp_57_0);
  wire signed [8:0] t0_l0_29;
  assign t0_l0_29 = $signed(pp_58_0) + $signed(pp_59_0);
  wire signed [8:0] t0_l0_30;
  assign t0_l0_30 = $signed(pp_60_0) + $signed(pp_61_0);
  wire signed [8:0] t0_l0_31;
  assign t0_l0_31 = $signed(pp_62_0) + $signed(pp_63_0);
  wire signed [9:0] t0_l1_0;
  assign t0_l1_0 = $signed(t0_l0_0) + $signed(t0_l0_1);
  wire signed [9:0] t0_l1_1;
  assign t0_l1_1 = $signed(t0_l0_2) + $signed(t0_l0_3);
  wire signed [9:0] t0_l1_2;
  assign t0_l1_2 = $signed(t0_l0_4) + $signed(t0_l0_5);
  wire signed [9:0] t0_l1_3;
  assign t0_l1_3 = $signed(t0_l0_6) + $signed(t0_l0_7);
  wire signed [9:0] t0_l1_4;
  assign t0_l1_4 = $signed(t0_l0_8) + $signed(t0_l0_9);
  wire signed [9:0] t0_l1_5;
  assign t0_l1_5 = $signed(t0_l0_10) + $signed(t0_l0_11);
  wire signed [9:0] t0_l1_6;
  assign t0_l1_6 = $signed(t0_l0_12) + $signed(t0_l0_13);
  wire signed [9:0] t0_l1_7;
  assign t0_l1_7 = $signed(t0_l0_14) + $signed(t0_l0_15);
  wire signed [9:0] t0_l1_8;
  assign t0_l1_8 = $signed(t0_l0_16) + $signed(t0_l0_17);
  wire signed [9:0] t0_l1_9;
  assign t0_l1_9 = $signed(t0_l0_18) + $signed(t0_l0_19);
  wire signed [9:0] t0_l1_10;
  assign t0_l1_10 = $signed(t0_l0_20) + $signed(t0_l0_21);
  wire signed [9:0] t0_l1_11;
  assign t0_l1_11 = $signed(t0_l0_22) + $signed(t0_l0_23);
  wire signed [9:0] t0_l1_12;
  assign t0_l1_12 = $signed(t0_l0_24) + $signed(t0_l0_25);
  wire signed [9:0] t0_l1_13;
  assign t0_l1_13 = $signed(t0_l0_26) + $signed(t0_l0_27);
  wire signed [9:0] t0_l1_14;
  assign t0_l1_14 = $signed(t0_l0_28) + $signed(t0_l0_29);
  wire signed [9:0] t0_l1_15;
  assign t0_l1_15 = $signed(t0_l0_30) + $signed(t0_l0_31);
  wire signed [10:0] t0_l2_0;
  assign t0_l2_0 = $signed(t0_l1_0) + $signed(t0_l1_1);
  wire signed [10:0] t0_l2_1;
  assign t0_l2_1 = $signed(t0_l1_2) + $signed(t0_l1_3);
  wire signed [10:0] t0_l2_2;
  assign t0_l2_2 = $signed(t0_l1_4) + $signed(t0_l1_5);
  wire signed [10:0] t0_l2_3;
  assign t0_l2_3 = $signed(t0_l1_6) + $signed(t0_l1_7);
  wire signed [10:0] t0_l2_4;
  assign t0_l2_4 = $signed(t0_l1_8) + $signed(t0_l1_9);
  wire signed [10:0] t0_l2_5;
  assign t0_l2_5 = $signed(t0_l1_10) + $signed(t0_l1_11);
  wire signed [10:0] t0_l2_6;
  assign t0_l2_6 = $signed(t0_l1_12) + $signed(t0_l1_13);
  wire signed [10:0] t0_l2_7;
  assign t0_l2_7 = $signed(t0_l1_14) + $signed(t0_l1_15);
  reg signed [10:0] t0_l2_0_r;
  reg signed [10:0] t0_l2_1_r;
  reg signed [10:0] t0_l2_2_r;
  reg signed [10:0] t0_l2_3_r;
  reg signed [10:0] t0_l2_4_r;
  reg signed [10:0] t0_l2_5_r;
  reg signed [10:0] t0_l2_6_r;
  reg signed [10:0] t0_l2_7_r;
  wire signed [11:0] t0_l3_0;
  assign t0_l3_0 = $signed(t0_l2_0_r) + $signed(t0_l2_1_r);
  wire signed [11:0] t0_l3_1;
  assign t0_l3_1 = $signed(t0_l2_2_r) + $signed(t0_l2_3_r);
  wire signed [11:0] t0_l3_2;
  assign t0_l3_2 = $signed(t0_l2_4_r) + $signed(t0_l2_5_r);
  wire signed [11:0] t0_l3_3;
  assign t0_l3_3 = $signed(t0_l2_6_r) + $signed(t0_l2_7_r);
  wire signed [12:0] t0_l4_0;
  assign t0_l4_0 = $signed(t0_l3_0) + $signed(t0_l3_1);
  wire signed [12:0] t0_l4_1;
  assign t0_l4_1 = $signed(t0_l3_2) + $signed(t0_l3_3);
  wire signed [13:0] t0_l5_0;
  assign t0_l5_0 = $signed(t0_l4_0) + $signed(t0_l4_1);
  reg signed [20:0] acc_0;
  assign y_0 = acc_0;
  wire signed [7:0] w_0_1 = wv_0_1[gsel*8 +: 8];
  wire signed [7:0] pp_0_1 = b_0 ? w_0_1 : 8'sd0;
  wire signed [7:0] w_1_1 = wv_1_1[gsel*8 +: 8];
  wire signed [7:0] pp_1_1 = b_1 ? w_1_1 : 8'sd0;
  wire signed [7:0] w_2_1 = wv_2_1[gsel*8 +: 8];
  wire signed [7:0] pp_2_1 = b_2 ? w_2_1 : 8'sd0;
  wire signed [7:0] w_3_1 = wv_3_1[gsel*8 +: 8];
  wire signed [7:0] pp_3_1 = b_3 ? w_3_1 : 8'sd0;
  wire signed [7:0] w_4_1 = wv_4_1[gsel*8 +: 8];
  wire signed [7:0] pp_4_1 = b_4 ? w_4_1 : 8'sd0;
  wire signed [7:0] w_5_1 = wv_5_1[gsel*8 +: 8];
  wire signed [7:0] pp_5_1 = b_5 ? w_5_1 : 8'sd0;
  wire signed [7:0] w_6_1 = wv_6_1[gsel*8 +: 8];
  wire signed [7:0] pp_6_1 = b_6 ? w_6_1 : 8'sd0;
  wire signed [7:0] w_7_1 = wv_7_1[gsel*8 +: 8];
  wire signed [7:0] pp_7_1 = b_7 ? w_7_1 : 8'sd0;
  wire signed [7:0] w_8_1 = wv_8_1[gsel*8 +: 8];
  wire signed [7:0] pp_8_1 = b_8 ? w_8_1 : 8'sd0;
  wire signed [7:0] w_9_1 = wv_9_1[gsel*8 +: 8];
  wire signed [7:0] pp_9_1 = b_9 ? w_9_1 : 8'sd0;
  wire signed [7:0] w_10_1 = wv_10_1[gsel*8 +: 8];
  wire signed [7:0] pp_10_1 = b_10 ? w_10_1 : 8'sd0;
  wire signed [7:0] w_11_1 = wv_11_1[gsel*8 +: 8];
  wire signed [7:0] pp_11_1 = b_11 ? w_11_1 : 8'sd0;
  wire signed [7:0] w_12_1 = wv_12_1[gsel*8 +: 8];
  wire signed [7:0] pp_12_1 = b_12 ? w_12_1 : 8'sd0;
  wire signed [7:0] w_13_1 = wv_13_1[gsel*8 +: 8];
  wire signed [7:0] pp_13_1 = b_13 ? w_13_1 : 8'sd0;
  wire signed [7:0] w_14_1 = wv_14_1[gsel*8 +: 8];
  wire signed [7:0] pp_14_1 = b_14 ? w_14_1 : 8'sd0;
  wire signed [7:0] w_15_1 = wv_15_1[gsel*8 +: 8];
  wire signed [7:0] pp_15_1 = b_15 ? w_15_1 : 8'sd0;
  wire signed [7:0] w_16_1 = wv_16_1[gsel*8 +: 8];
  wire signed [7:0] pp_16_1 = b_16 ? w_16_1 : 8'sd0;
  wire signed [7:0] w_17_1 = wv_17_1[gsel*8 +: 8];
  wire signed [7:0] pp_17_1 = b_17 ? w_17_1 : 8'sd0;
  wire signed [7:0] w_18_1 = wv_18_1[gsel*8 +: 8];
  wire signed [7:0] pp_18_1 = b_18 ? w_18_1 : 8'sd0;
  wire signed [7:0] w_19_1 = wv_19_1[gsel*8 +: 8];
  wire signed [7:0] pp_19_1 = b_19 ? w_19_1 : 8'sd0;
  wire signed [7:0] w_20_1 = wv_20_1[gsel*8 +: 8];
  wire signed [7:0] pp_20_1 = b_20 ? w_20_1 : 8'sd0;
  wire signed [7:0] w_21_1 = wv_21_1[gsel*8 +: 8];
  wire signed [7:0] pp_21_1 = b_21 ? w_21_1 : 8'sd0;
  wire signed [7:0] w_22_1 = wv_22_1[gsel*8 +: 8];
  wire signed [7:0] pp_22_1 = b_22 ? w_22_1 : 8'sd0;
  wire signed [7:0] w_23_1 = wv_23_1[gsel*8 +: 8];
  wire signed [7:0] pp_23_1 = b_23 ? w_23_1 : 8'sd0;
  wire signed [7:0] w_24_1 = wv_24_1[gsel*8 +: 8];
  wire signed [7:0] pp_24_1 = b_24 ? w_24_1 : 8'sd0;
  wire signed [7:0] w_25_1 = wv_25_1[gsel*8 +: 8];
  wire signed [7:0] pp_25_1 = b_25 ? w_25_1 : 8'sd0;
  wire signed [7:0] w_26_1 = wv_26_1[gsel*8 +: 8];
  wire signed [7:0] pp_26_1 = b_26 ? w_26_1 : 8'sd0;
  wire signed [7:0] w_27_1 = wv_27_1[gsel*8 +: 8];
  wire signed [7:0] pp_27_1 = b_27 ? w_27_1 : 8'sd0;
  wire signed [7:0] w_28_1 = wv_28_1[gsel*8 +: 8];
  wire signed [7:0] pp_28_1 = b_28 ? w_28_1 : 8'sd0;
  wire signed [7:0] w_29_1 = wv_29_1[gsel*8 +: 8];
  wire signed [7:0] pp_29_1 = b_29 ? w_29_1 : 8'sd0;
  wire signed [7:0] w_30_1 = wv_30_1[gsel*8 +: 8];
  wire signed [7:0] pp_30_1 = b_30 ? w_30_1 : 8'sd0;
  wire signed [7:0] w_31_1 = wv_31_1[gsel*8 +: 8];
  wire signed [7:0] pp_31_1 = b_31 ? w_31_1 : 8'sd0;
  wire signed [7:0] w_32_1 = wv_32_1[gsel*8 +: 8];
  wire signed [7:0] pp_32_1 = b_32 ? w_32_1 : 8'sd0;
  wire signed [7:0] w_33_1 = wv_33_1[gsel*8 +: 8];
  wire signed [7:0] pp_33_1 = b_33 ? w_33_1 : 8'sd0;
  wire signed [7:0] w_34_1 = wv_34_1[gsel*8 +: 8];
  wire signed [7:0] pp_34_1 = b_34 ? w_34_1 : 8'sd0;
  wire signed [7:0] w_35_1 = wv_35_1[gsel*8 +: 8];
  wire signed [7:0] pp_35_1 = b_35 ? w_35_1 : 8'sd0;
  wire signed [7:0] w_36_1 = wv_36_1[gsel*8 +: 8];
  wire signed [7:0] pp_36_1 = b_36 ? w_36_1 : 8'sd0;
  wire signed [7:0] w_37_1 = wv_37_1[gsel*8 +: 8];
  wire signed [7:0] pp_37_1 = b_37 ? w_37_1 : 8'sd0;
  wire signed [7:0] w_38_1 = wv_38_1[gsel*8 +: 8];
  wire signed [7:0] pp_38_1 = b_38 ? w_38_1 : 8'sd0;
  wire signed [7:0] w_39_1 = wv_39_1[gsel*8 +: 8];
  wire signed [7:0] pp_39_1 = b_39 ? w_39_1 : 8'sd0;
  wire signed [7:0] w_40_1 = wv_40_1[gsel*8 +: 8];
  wire signed [7:0] pp_40_1 = b_40 ? w_40_1 : 8'sd0;
  wire signed [7:0] w_41_1 = wv_41_1[gsel*8 +: 8];
  wire signed [7:0] pp_41_1 = b_41 ? w_41_1 : 8'sd0;
  wire signed [7:0] w_42_1 = wv_42_1[gsel*8 +: 8];
  wire signed [7:0] pp_42_1 = b_42 ? w_42_1 : 8'sd0;
  wire signed [7:0] w_43_1 = wv_43_1[gsel*8 +: 8];
  wire signed [7:0] pp_43_1 = b_43 ? w_43_1 : 8'sd0;
  wire signed [7:0] w_44_1 = wv_44_1[gsel*8 +: 8];
  wire signed [7:0] pp_44_1 = b_44 ? w_44_1 : 8'sd0;
  wire signed [7:0] w_45_1 = wv_45_1[gsel*8 +: 8];
  wire signed [7:0] pp_45_1 = b_45 ? w_45_1 : 8'sd0;
  wire signed [7:0] w_46_1 = wv_46_1[gsel*8 +: 8];
  wire signed [7:0] pp_46_1 = b_46 ? w_46_1 : 8'sd0;
  wire signed [7:0] w_47_1 = wv_47_1[gsel*8 +: 8];
  wire signed [7:0] pp_47_1 = b_47 ? w_47_1 : 8'sd0;
  wire signed [7:0] w_48_1 = wv_48_1[gsel*8 +: 8];
  wire signed [7:0] pp_48_1 = b_48 ? w_48_1 : 8'sd0;
  wire signed [7:0] w_49_1 = wv_49_1[gsel*8 +: 8];
  wire signed [7:0] pp_49_1 = b_49 ? w_49_1 : 8'sd0;
  wire signed [7:0] w_50_1 = wv_50_1[gsel*8 +: 8];
  wire signed [7:0] pp_50_1 = b_50 ? w_50_1 : 8'sd0;
  wire signed [7:0] w_51_1 = wv_51_1[gsel*8 +: 8];
  wire signed [7:0] pp_51_1 = b_51 ? w_51_1 : 8'sd0;
  wire signed [7:0] w_52_1 = wv_52_1[gsel*8 +: 8];
  wire signed [7:0] pp_52_1 = b_52 ? w_52_1 : 8'sd0;
  wire signed [7:0] w_53_1 = wv_53_1[gsel*8 +: 8];
  wire signed [7:0] pp_53_1 = b_53 ? w_53_1 : 8'sd0;
  wire signed [7:0] w_54_1 = wv_54_1[gsel*8 +: 8];
  wire signed [7:0] pp_54_1 = b_54 ? w_54_1 : 8'sd0;
  wire signed [7:0] w_55_1 = wv_55_1[gsel*8 +: 8];
  wire signed [7:0] pp_55_1 = b_55 ? w_55_1 : 8'sd0;
  wire signed [7:0] w_56_1 = wv_56_1[gsel*8 +: 8];
  wire signed [7:0] pp_56_1 = b_56 ? w_56_1 : 8'sd0;
  wire signed [7:0] w_57_1 = wv_57_1[gsel*8 +: 8];
  wire signed [7:0] pp_57_1 = b_57 ? w_57_1 : 8'sd0;
  wire signed [7:0] w_58_1 = wv_58_1[gsel*8 +: 8];
  wire signed [7:0] pp_58_1 = b_58 ? w_58_1 : 8'sd0;
  wire signed [7:0] w_59_1 = wv_59_1[gsel*8 +: 8];
  wire signed [7:0] pp_59_1 = b_59 ? w_59_1 : 8'sd0;
  wire signed [7:0] w_60_1 = wv_60_1[gsel*8 +: 8];
  wire signed [7:0] pp_60_1 = b_60 ? w_60_1 : 8'sd0;
  wire signed [7:0] w_61_1 = wv_61_1[gsel*8 +: 8];
  wire signed [7:0] pp_61_1 = b_61 ? w_61_1 : 8'sd0;
  wire signed [7:0] w_62_1 = wv_62_1[gsel*8 +: 8];
  wire signed [7:0] pp_62_1 = b_62 ? w_62_1 : 8'sd0;
  wire signed [7:0] w_63_1 = wv_63_1[gsel*8 +: 8];
  wire signed [7:0] pp_63_1 = b_63 ? w_63_1 : 8'sd0;
  wire signed [8:0] t1_l0_0;
  assign t1_l0_0 = $signed(pp_0_1) + $signed(pp_1_1);
  wire signed [8:0] t1_l0_1;
  assign t1_l0_1 = $signed(pp_2_1) + $signed(pp_3_1);
  wire signed [8:0] t1_l0_2;
  assign t1_l0_2 = $signed(pp_4_1) + $signed(pp_5_1);
  wire signed [8:0] t1_l0_3;
  assign t1_l0_3 = $signed(pp_6_1) + $signed(pp_7_1);
  wire signed [8:0] t1_l0_4;
  assign t1_l0_4 = $signed(pp_8_1) + $signed(pp_9_1);
  wire signed [8:0] t1_l0_5;
  assign t1_l0_5 = $signed(pp_10_1) + $signed(pp_11_1);
  wire signed [8:0] t1_l0_6;
  assign t1_l0_6 = $signed(pp_12_1) + $signed(pp_13_1);
  wire signed [8:0] t1_l0_7;
  assign t1_l0_7 = $signed(pp_14_1) + $signed(pp_15_1);
  wire signed [8:0] t1_l0_8;
  assign t1_l0_8 = $signed(pp_16_1) + $signed(pp_17_1);
  wire signed [8:0] t1_l0_9;
  assign t1_l0_9 = $signed(pp_18_1) + $signed(pp_19_1);
  wire signed [8:0] t1_l0_10;
  assign t1_l0_10 = $signed(pp_20_1) + $signed(pp_21_1);
  wire signed [8:0] t1_l0_11;
  assign t1_l0_11 = $signed(pp_22_1) + $signed(pp_23_1);
  wire signed [8:0] t1_l0_12;
  assign t1_l0_12 = $signed(pp_24_1) + $signed(pp_25_1);
  wire signed [8:0] t1_l0_13;
  assign t1_l0_13 = $signed(pp_26_1) + $signed(pp_27_1);
  wire signed [8:0] t1_l0_14;
  assign t1_l0_14 = $signed(pp_28_1) + $signed(pp_29_1);
  wire signed [8:0] t1_l0_15;
  assign t1_l0_15 = $signed(pp_30_1) + $signed(pp_31_1);
  wire signed [8:0] t1_l0_16;
  assign t1_l0_16 = $signed(pp_32_1) + $signed(pp_33_1);
  wire signed [8:0] t1_l0_17;
  assign t1_l0_17 = $signed(pp_34_1) + $signed(pp_35_1);
  wire signed [8:0] t1_l0_18;
  assign t1_l0_18 = $signed(pp_36_1) + $signed(pp_37_1);
  wire signed [8:0] t1_l0_19;
  assign t1_l0_19 = $signed(pp_38_1) + $signed(pp_39_1);
  wire signed [8:0] t1_l0_20;
  assign t1_l0_20 = $signed(pp_40_1) + $signed(pp_41_1);
  wire signed [8:0] t1_l0_21;
  assign t1_l0_21 = $signed(pp_42_1) + $signed(pp_43_1);
  wire signed [8:0] t1_l0_22;
  assign t1_l0_22 = $signed(pp_44_1) + $signed(pp_45_1);
  wire signed [8:0] t1_l0_23;
  assign t1_l0_23 = $signed(pp_46_1) + $signed(pp_47_1);
  wire signed [8:0] t1_l0_24;
  assign t1_l0_24 = $signed(pp_48_1) + $signed(pp_49_1);
  wire signed [8:0] t1_l0_25;
  assign t1_l0_25 = $signed(pp_50_1) + $signed(pp_51_1);
  wire signed [8:0] t1_l0_26;
  assign t1_l0_26 = $signed(pp_52_1) + $signed(pp_53_1);
  wire signed [8:0] t1_l0_27;
  assign t1_l0_27 = $signed(pp_54_1) + $signed(pp_55_1);
  wire signed [8:0] t1_l0_28;
  assign t1_l0_28 = $signed(pp_56_1) + $signed(pp_57_1);
  wire signed [8:0] t1_l0_29;
  assign t1_l0_29 = $signed(pp_58_1) + $signed(pp_59_1);
  wire signed [8:0] t1_l0_30;
  assign t1_l0_30 = $signed(pp_60_1) + $signed(pp_61_1);
  wire signed [8:0] t1_l0_31;
  assign t1_l0_31 = $signed(pp_62_1) + $signed(pp_63_1);
  wire signed [9:0] t1_l1_0;
  assign t1_l1_0 = $signed(t1_l0_0) + $signed(t1_l0_1);
  wire signed [9:0] t1_l1_1;
  assign t1_l1_1 = $signed(t1_l0_2) + $signed(t1_l0_3);
  wire signed [9:0] t1_l1_2;
  assign t1_l1_2 = $signed(t1_l0_4) + $signed(t1_l0_5);
  wire signed [9:0] t1_l1_3;
  assign t1_l1_3 = $signed(t1_l0_6) + $signed(t1_l0_7);
  wire signed [9:0] t1_l1_4;
  assign t1_l1_4 = $signed(t1_l0_8) + $signed(t1_l0_9);
  wire signed [9:0] t1_l1_5;
  assign t1_l1_5 = $signed(t1_l0_10) + $signed(t1_l0_11);
  wire signed [9:0] t1_l1_6;
  assign t1_l1_6 = $signed(t1_l0_12) + $signed(t1_l0_13);
  wire signed [9:0] t1_l1_7;
  assign t1_l1_7 = $signed(t1_l0_14) + $signed(t1_l0_15);
  wire signed [9:0] t1_l1_8;
  assign t1_l1_8 = $signed(t1_l0_16) + $signed(t1_l0_17);
  wire signed [9:0] t1_l1_9;
  assign t1_l1_9 = $signed(t1_l0_18) + $signed(t1_l0_19);
  wire signed [9:0] t1_l1_10;
  assign t1_l1_10 = $signed(t1_l0_20) + $signed(t1_l0_21);
  wire signed [9:0] t1_l1_11;
  assign t1_l1_11 = $signed(t1_l0_22) + $signed(t1_l0_23);
  wire signed [9:0] t1_l1_12;
  assign t1_l1_12 = $signed(t1_l0_24) + $signed(t1_l0_25);
  wire signed [9:0] t1_l1_13;
  assign t1_l1_13 = $signed(t1_l0_26) + $signed(t1_l0_27);
  wire signed [9:0] t1_l1_14;
  assign t1_l1_14 = $signed(t1_l0_28) + $signed(t1_l0_29);
  wire signed [9:0] t1_l1_15;
  assign t1_l1_15 = $signed(t1_l0_30) + $signed(t1_l0_31);
  wire signed [10:0] t1_l2_0;
  assign t1_l2_0 = $signed(t1_l1_0) + $signed(t1_l1_1);
  wire signed [10:0] t1_l2_1;
  assign t1_l2_1 = $signed(t1_l1_2) + $signed(t1_l1_3);
  wire signed [10:0] t1_l2_2;
  assign t1_l2_2 = $signed(t1_l1_4) + $signed(t1_l1_5);
  wire signed [10:0] t1_l2_3;
  assign t1_l2_3 = $signed(t1_l1_6) + $signed(t1_l1_7);
  wire signed [10:0] t1_l2_4;
  assign t1_l2_4 = $signed(t1_l1_8) + $signed(t1_l1_9);
  wire signed [10:0] t1_l2_5;
  assign t1_l2_5 = $signed(t1_l1_10) + $signed(t1_l1_11);
  wire signed [10:0] t1_l2_6;
  assign t1_l2_6 = $signed(t1_l1_12) + $signed(t1_l1_13);
  wire signed [10:0] t1_l2_7;
  assign t1_l2_7 = $signed(t1_l1_14) + $signed(t1_l1_15);
  reg signed [10:0] t1_l2_0_r;
  reg signed [10:0] t1_l2_1_r;
  reg signed [10:0] t1_l2_2_r;
  reg signed [10:0] t1_l2_3_r;
  reg signed [10:0] t1_l2_4_r;
  reg signed [10:0] t1_l2_5_r;
  reg signed [10:0] t1_l2_6_r;
  reg signed [10:0] t1_l2_7_r;
  wire signed [11:0] t1_l3_0;
  assign t1_l3_0 = $signed(t1_l2_0_r) + $signed(t1_l2_1_r);
  wire signed [11:0] t1_l3_1;
  assign t1_l3_1 = $signed(t1_l2_2_r) + $signed(t1_l2_3_r);
  wire signed [11:0] t1_l3_2;
  assign t1_l3_2 = $signed(t1_l2_4_r) + $signed(t1_l2_5_r);
  wire signed [11:0] t1_l3_3;
  assign t1_l3_3 = $signed(t1_l2_6_r) + $signed(t1_l2_7_r);
  wire signed [12:0] t1_l4_0;
  assign t1_l4_0 = $signed(t1_l3_0) + $signed(t1_l3_1);
  wire signed [12:0] t1_l4_1;
  assign t1_l4_1 = $signed(t1_l3_2) + $signed(t1_l3_3);
  wire signed [13:0] t1_l5_0;
  assign t1_l5_0 = $signed(t1_l4_0) + $signed(t1_l4_1);
  reg signed [20:0] acc_1;
  assign y_1 = acc_1;
  always @(posedge clk) begin
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