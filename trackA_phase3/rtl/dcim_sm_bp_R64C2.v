module dcim_sm_bp (
  input clk,
  input first,
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
  input g_0,
  input g_1,
  input g_2,
  input g_3,
  input g_4,
  input g_5,
  input g_6,
  input g_7,
  input g_8,
  input g_9,
  input g_10,
  input g_11,
  input g_12,
  input g_13,
  input g_14,
  input g_15,
  input g_16,
  input g_17,
  input g_18,
  input g_19,
  input g_20,
  input g_21,
  input g_22,
  input g_23,
  input g_24,
  input g_25,
  input g_26,
  input g_27,
  input g_28,
  input g_29,
  input g_30,
  input g_31,
  input g_32,
  input g_33,
  input g_34,
  input g_35,
  input g_36,
  input g_37,
  input g_38,
  input g_39,
  input g_40,
  input g_41,
  input g_42,
  input g_43,
  input g_44,
  input g_45,
  input g_46,
  input g_47,
  input g_48,
  input g_49,
  input g_50,
  input g_51,
  input g_52,
  input g_53,
  input g_54,
  input g_55,
  input g_56,
  input g_57,
  input g_58,
  input g_59,
  input g_60,
  input g_61,
  input g_62,
  input g_63,
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
  wire a_0_0 = b_0 & w_0_0;
  wire signed [1:0] pp_0_0 = {a_0_0 & g_0, a_0_0};
  wire a_1_0 = b_1 & w_1_0;
  wire signed [1:0] pp_1_0 = {a_1_0 & g_1, a_1_0};
  wire a_2_0 = b_2 & w_2_0;
  wire signed [1:0] pp_2_0 = {a_2_0 & g_2, a_2_0};
  wire a_3_0 = b_3 & w_3_0;
  wire signed [1:0] pp_3_0 = {a_3_0 & g_3, a_3_0};
  wire a_4_0 = b_4 & w_4_0;
  wire signed [1:0] pp_4_0 = {a_4_0 & g_4, a_4_0};
  wire a_5_0 = b_5 & w_5_0;
  wire signed [1:0] pp_5_0 = {a_5_0 & g_5, a_5_0};
  wire a_6_0 = b_6 & w_6_0;
  wire signed [1:0] pp_6_0 = {a_6_0 & g_6, a_6_0};
  wire a_7_0 = b_7 & w_7_0;
  wire signed [1:0] pp_7_0 = {a_7_0 & g_7, a_7_0};
  wire a_8_0 = b_8 & w_8_0;
  wire signed [1:0] pp_8_0 = {a_8_0 & g_8, a_8_0};
  wire a_9_0 = b_9 & w_9_0;
  wire signed [1:0] pp_9_0 = {a_9_0 & g_9, a_9_0};
  wire a_10_0 = b_10 & w_10_0;
  wire signed [1:0] pp_10_0 = {a_10_0 & g_10, a_10_0};
  wire a_11_0 = b_11 & w_11_0;
  wire signed [1:0] pp_11_0 = {a_11_0 & g_11, a_11_0};
  wire a_12_0 = b_12 & w_12_0;
  wire signed [1:0] pp_12_0 = {a_12_0 & g_12, a_12_0};
  wire a_13_0 = b_13 & w_13_0;
  wire signed [1:0] pp_13_0 = {a_13_0 & g_13, a_13_0};
  wire a_14_0 = b_14 & w_14_0;
  wire signed [1:0] pp_14_0 = {a_14_0 & g_14, a_14_0};
  wire a_15_0 = b_15 & w_15_0;
  wire signed [1:0] pp_15_0 = {a_15_0 & g_15, a_15_0};
  wire a_16_0 = b_16 & w_16_0;
  wire signed [1:0] pp_16_0 = {a_16_0 & g_16, a_16_0};
  wire a_17_0 = b_17 & w_17_0;
  wire signed [1:0] pp_17_0 = {a_17_0 & g_17, a_17_0};
  wire a_18_0 = b_18 & w_18_0;
  wire signed [1:0] pp_18_0 = {a_18_0 & g_18, a_18_0};
  wire a_19_0 = b_19 & w_19_0;
  wire signed [1:0] pp_19_0 = {a_19_0 & g_19, a_19_0};
  wire a_20_0 = b_20 & w_20_0;
  wire signed [1:0] pp_20_0 = {a_20_0 & g_20, a_20_0};
  wire a_21_0 = b_21 & w_21_0;
  wire signed [1:0] pp_21_0 = {a_21_0 & g_21, a_21_0};
  wire a_22_0 = b_22 & w_22_0;
  wire signed [1:0] pp_22_0 = {a_22_0 & g_22, a_22_0};
  wire a_23_0 = b_23 & w_23_0;
  wire signed [1:0] pp_23_0 = {a_23_0 & g_23, a_23_0};
  wire a_24_0 = b_24 & w_24_0;
  wire signed [1:0] pp_24_0 = {a_24_0 & g_24, a_24_0};
  wire a_25_0 = b_25 & w_25_0;
  wire signed [1:0] pp_25_0 = {a_25_0 & g_25, a_25_0};
  wire a_26_0 = b_26 & w_26_0;
  wire signed [1:0] pp_26_0 = {a_26_0 & g_26, a_26_0};
  wire a_27_0 = b_27 & w_27_0;
  wire signed [1:0] pp_27_0 = {a_27_0 & g_27, a_27_0};
  wire a_28_0 = b_28 & w_28_0;
  wire signed [1:0] pp_28_0 = {a_28_0 & g_28, a_28_0};
  wire a_29_0 = b_29 & w_29_0;
  wire signed [1:0] pp_29_0 = {a_29_0 & g_29, a_29_0};
  wire a_30_0 = b_30 & w_30_0;
  wire signed [1:0] pp_30_0 = {a_30_0 & g_30, a_30_0};
  wire a_31_0 = b_31 & w_31_0;
  wire signed [1:0] pp_31_0 = {a_31_0 & g_31, a_31_0};
  wire a_32_0 = b_32 & w_32_0;
  wire signed [1:0] pp_32_0 = {a_32_0 & g_32, a_32_0};
  wire a_33_0 = b_33 & w_33_0;
  wire signed [1:0] pp_33_0 = {a_33_0 & g_33, a_33_0};
  wire a_34_0 = b_34 & w_34_0;
  wire signed [1:0] pp_34_0 = {a_34_0 & g_34, a_34_0};
  wire a_35_0 = b_35 & w_35_0;
  wire signed [1:0] pp_35_0 = {a_35_0 & g_35, a_35_0};
  wire a_36_0 = b_36 & w_36_0;
  wire signed [1:0] pp_36_0 = {a_36_0 & g_36, a_36_0};
  wire a_37_0 = b_37 & w_37_0;
  wire signed [1:0] pp_37_0 = {a_37_0 & g_37, a_37_0};
  wire a_38_0 = b_38 & w_38_0;
  wire signed [1:0] pp_38_0 = {a_38_0 & g_38, a_38_0};
  wire a_39_0 = b_39 & w_39_0;
  wire signed [1:0] pp_39_0 = {a_39_0 & g_39, a_39_0};
  wire a_40_0 = b_40 & w_40_0;
  wire signed [1:0] pp_40_0 = {a_40_0 & g_40, a_40_0};
  wire a_41_0 = b_41 & w_41_0;
  wire signed [1:0] pp_41_0 = {a_41_0 & g_41, a_41_0};
  wire a_42_0 = b_42 & w_42_0;
  wire signed [1:0] pp_42_0 = {a_42_0 & g_42, a_42_0};
  wire a_43_0 = b_43 & w_43_0;
  wire signed [1:0] pp_43_0 = {a_43_0 & g_43, a_43_0};
  wire a_44_0 = b_44 & w_44_0;
  wire signed [1:0] pp_44_0 = {a_44_0 & g_44, a_44_0};
  wire a_45_0 = b_45 & w_45_0;
  wire signed [1:0] pp_45_0 = {a_45_0 & g_45, a_45_0};
  wire a_46_0 = b_46 & w_46_0;
  wire signed [1:0] pp_46_0 = {a_46_0 & g_46, a_46_0};
  wire a_47_0 = b_47 & w_47_0;
  wire signed [1:0] pp_47_0 = {a_47_0 & g_47, a_47_0};
  wire a_48_0 = b_48 & w_48_0;
  wire signed [1:0] pp_48_0 = {a_48_0 & g_48, a_48_0};
  wire a_49_0 = b_49 & w_49_0;
  wire signed [1:0] pp_49_0 = {a_49_0 & g_49, a_49_0};
  wire a_50_0 = b_50 & w_50_0;
  wire signed [1:0] pp_50_0 = {a_50_0 & g_50, a_50_0};
  wire a_51_0 = b_51 & w_51_0;
  wire signed [1:0] pp_51_0 = {a_51_0 & g_51, a_51_0};
  wire a_52_0 = b_52 & w_52_0;
  wire signed [1:0] pp_52_0 = {a_52_0 & g_52, a_52_0};
  wire a_53_0 = b_53 & w_53_0;
  wire signed [1:0] pp_53_0 = {a_53_0 & g_53, a_53_0};
  wire a_54_0 = b_54 & w_54_0;
  wire signed [1:0] pp_54_0 = {a_54_0 & g_54, a_54_0};
  wire a_55_0 = b_55 & w_55_0;
  wire signed [1:0] pp_55_0 = {a_55_0 & g_55, a_55_0};
  wire a_56_0 = b_56 & w_56_0;
  wire signed [1:0] pp_56_0 = {a_56_0 & g_56, a_56_0};
  wire a_57_0 = b_57 & w_57_0;
  wire signed [1:0] pp_57_0 = {a_57_0 & g_57, a_57_0};
  wire a_58_0 = b_58 & w_58_0;
  wire signed [1:0] pp_58_0 = {a_58_0 & g_58, a_58_0};
  wire a_59_0 = b_59 & w_59_0;
  wire signed [1:0] pp_59_0 = {a_59_0 & g_59, a_59_0};
  wire a_60_0 = b_60 & w_60_0;
  wire signed [1:0] pp_60_0 = {a_60_0 & g_60, a_60_0};
  wire a_61_0 = b_61 & w_61_0;
  wire signed [1:0] pp_61_0 = {a_61_0 & g_61, a_61_0};
  wire a_62_0 = b_62 & w_62_0;
  wire signed [1:0] pp_62_0 = {a_62_0 & g_62, a_62_0};
  wire a_63_0 = b_63 & w_63_0;
  wire signed [1:0] pp_63_0 = {a_63_0 & g_63, a_63_0};
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
  wire a_0_1 = b_0 & w_0_1;
  wire signed [1:0] pp_0_1 = {a_0_1 & g_0, a_0_1};
  wire a_1_1 = b_1 & w_1_1;
  wire signed [1:0] pp_1_1 = {a_1_1 & g_1, a_1_1};
  wire a_2_1 = b_2 & w_2_1;
  wire signed [1:0] pp_2_1 = {a_2_1 & g_2, a_2_1};
  wire a_3_1 = b_3 & w_3_1;
  wire signed [1:0] pp_3_1 = {a_3_1 & g_3, a_3_1};
  wire a_4_1 = b_4 & w_4_1;
  wire signed [1:0] pp_4_1 = {a_4_1 & g_4, a_4_1};
  wire a_5_1 = b_5 & w_5_1;
  wire signed [1:0] pp_5_1 = {a_5_1 & g_5, a_5_1};
  wire a_6_1 = b_6 & w_6_1;
  wire signed [1:0] pp_6_1 = {a_6_1 & g_6, a_6_1};
  wire a_7_1 = b_7 & w_7_1;
  wire signed [1:0] pp_7_1 = {a_7_1 & g_7, a_7_1};
  wire a_8_1 = b_8 & w_8_1;
  wire signed [1:0] pp_8_1 = {a_8_1 & g_8, a_8_1};
  wire a_9_1 = b_9 & w_9_1;
  wire signed [1:0] pp_9_1 = {a_9_1 & g_9, a_9_1};
  wire a_10_1 = b_10 & w_10_1;
  wire signed [1:0] pp_10_1 = {a_10_1 & g_10, a_10_1};
  wire a_11_1 = b_11 & w_11_1;
  wire signed [1:0] pp_11_1 = {a_11_1 & g_11, a_11_1};
  wire a_12_1 = b_12 & w_12_1;
  wire signed [1:0] pp_12_1 = {a_12_1 & g_12, a_12_1};
  wire a_13_1 = b_13 & w_13_1;
  wire signed [1:0] pp_13_1 = {a_13_1 & g_13, a_13_1};
  wire a_14_1 = b_14 & w_14_1;
  wire signed [1:0] pp_14_1 = {a_14_1 & g_14, a_14_1};
  wire a_15_1 = b_15 & w_15_1;
  wire signed [1:0] pp_15_1 = {a_15_1 & g_15, a_15_1};
  wire a_16_1 = b_16 & w_16_1;
  wire signed [1:0] pp_16_1 = {a_16_1 & g_16, a_16_1};
  wire a_17_1 = b_17 & w_17_1;
  wire signed [1:0] pp_17_1 = {a_17_1 & g_17, a_17_1};
  wire a_18_1 = b_18 & w_18_1;
  wire signed [1:0] pp_18_1 = {a_18_1 & g_18, a_18_1};
  wire a_19_1 = b_19 & w_19_1;
  wire signed [1:0] pp_19_1 = {a_19_1 & g_19, a_19_1};
  wire a_20_1 = b_20 & w_20_1;
  wire signed [1:0] pp_20_1 = {a_20_1 & g_20, a_20_1};
  wire a_21_1 = b_21 & w_21_1;
  wire signed [1:0] pp_21_1 = {a_21_1 & g_21, a_21_1};
  wire a_22_1 = b_22 & w_22_1;
  wire signed [1:0] pp_22_1 = {a_22_1 & g_22, a_22_1};
  wire a_23_1 = b_23 & w_23_1;
  wire signed [1:0] pp_23_1 = {a_23_1 & g_23, a_23_1};
  wire a_24_1 = b_24 & w_24_1;
  wire signed [1:0] pp_24_1 = {a_24_1 & g_24, a_24_1};
  wire a_25_1 = b_25 & w_25_1;
  wire signed [1:0] pp_25_1 = {a_25_1 & g_25, a_25_1};
  wire a_26_1 = b_26 & w_26_1;
  wire signed [1:0] pp_26_1 = {a_26_1 & g_26, a_26_1};
  wire a_27_1 = b_27 & w_27_1;
  wire signed [1:0] pp_27_1 = {a_27_1 & g_27, a_27_1};
  wire a_28_1 = b_28 & w_28_1;
  wire signed [1:0] pp_28_1 = {a_28_1 & g_28, a_28_1};
  wire a_29_1 = b_29 & w_29_1;
  wire signed [1:0] pp_29_1 = {a_29_1 & g_29, a_29_1};
  wire a_30_1 = b_30 & w_30_1;
  wire signed [1:0] pp_30_1 = {a_30_1 & g_30, a_30_1};
  wire a_31_1 = b_31 & w_31_1;
  wire signed [1:0] pp_31_1 = {a_31_1 & g_31, a_31_1};
  wire a_32_1 = b_32 & w_32_1;
  wire signed [1:0] pp_32_1 = {a_32_1 & g_32, a_32_1};
  wire a_33_1 = b_33 & w_33_1;
  wire signed [1:0] pp_33_1 = {a_33_1 & g_33, a_33_1};
  wire a_34_1 = b_34 & w_34_1;
  wire signed [1:0] pp_34_1 = {a_34_1 & g_34, a_34_1};
  wire a_35_1 = b_35 & w_35_1;
  wire signed [1:0] pp_35_1 = {a_35_1 & g_35, a_35_1};
  wire a_36_1 = b_36 & w_36_1;
  wire signed [1:0] pp_36_1 = {a_36_1 & g_36, a_36_1};
  wire a_37_1 = b_37 & w_37_1;
  wire signed [1:0] pp_37_1 = {a_37_1 & g_37, a_37_1};
  wire a_38_1 = b_38 & w_38_1;
  wire signed [1:0] pp_38_1 = {a_38_1 & g_38, a_38_1};
  wire a_39_1 = b_39 & w_39_1;
  wire signed [1:0] pp_39_1 = {a_39_1 & g_39, a_39_1};
  wire a_40_1 = b_40 & w_40_1;
  wire signed [1:0] pp_40_1 = {a_40_1 & g_40, a_40_1};
  wire a_41_1 = b_41 & w_41_1;
  wire signed [1:0] pp_41_1 = {a_41_1 & g_41, a_41_1};
  wire a_42_1 = b_42 & w_42_1;
  wire signed [1:0] pp_42_1 = {a_42_1 & g_42, a_42_1};
  wire a_43_1 = b_43 & w_43_1;
  wire signed [1:0] pp_43_1 = {a_43_1 & g_43, a_43_1};
  wire a_44_1 = b_44 & w_44_1;
  wire signed [1:0] pp_44_1 = {a_44_1 & g_44, a_44_1};
  wire a_45_1 = b_45 & w_45_1;
  wire signed [1:0] pp_45_1 = {a_45_1 & g_45, a_45_1};
  wire a_46_1 = b_46 & w_46_1;
  wire signed [1:0] pp_46_1 = {a_46_1 & g_46, a_46_1};
  wire a_47_1 = b_47 & w_47_1;
  wire signed [1:0] pp_47_1 = {a_47_1 & g_47, a_47_1};
  wire a_48_1 = b_48 & w_48_1;
  wire signed [1:0] pp_48_1 = {a_48_1 & g_48, a_48_1};
  wire a_49_1 = b_49 & w_49_1;
  wire signed [1:0] pp_49_1 = {a_49_1 & g_49, a_49_1};
  wire a_50_1 = b_50 & w_50_1;
  wire signed [1:0] pp_50_1 = {a_50_1 & g_50, a_50_1};
  wire a_51_1 = b_51 & w_51_1;
  wire signed [1:0] pp_51_1 = {a_51_1 & g_51, a_51_1};
  wire a_52_1 = b_52 & w_52_1;
  wire signed [1:0] pp_52_1 = {a_52_1 & g_52, a_52_1};
  wire a_53_1 = b_53 & w_53_1;
  wire signed [1:0] pp_53_1 = {a_53_1 & g_53, a_53_1};
  wire a_54_1 = b_54 & w_54_1;
  wire signed [1:0] pp_54_1 = {a_54_1 & g_54, a_54_1};
  wire a_55_1 = b_55 & w_55_1;
  wire signed [1:0] pp_55_1 = {a_55_1 & g_55, a_55_1};
  wire a_56_1 = b_56 & w_56_1;
  wire signed [1:0] pp_56_1 = {a_56_1 & g_56, a_56_1};
  wire a_57_1 = b_57 & w_57_1;
  wire signed [1:0] pp_57_1 = {a_57_1 & g_57, a_57_1};
  wire a_58_1 = b_58 & w_58_1;
  wire signed [1:0] pp_58_1 = {a_58_1 & g_58, a_58_1};
  wire a_59_1 = b_59 & w_59_1;
  wire signed [1:0] pp_59_1 = {a_59_1 & g_59, a_59_1};
  wire a_60_1 = b_60 & w_60_1;
  wire signed [1:0] pp_60_1 = {a_60_1 & g_60, a_60_1};
  wire a_61_1 = b_61 & w_61_1;
  wire signed [1:0] pp_61_1 = {a_61_1 & g_61, a_61_1};
  wire a_62_1 = b_62 & w_62_1;
  wire signed [1:0] pp_62_1 = {a_62_1 & g_62, a_62_1};
  wire a_63_1 = b_63 & w_63_1;
  wire signed [1:0] pp_63_1 = {a_63_1 & g_63, a_63_1};
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
    t0_l2_0_r <= t0_l2_0;
    t0_l2_1_r <= t0_l2_1;
    t0_l2_2_r <= t0_l2_2;
    t0_l2_3_r <= t0_l2_3;
    t0_l2_4_r <= t0_l2_4;
    t0_l2_5_r <= t0_l2_5;
    t0_l2_6_r <= t0_l2_6;
    t0_l2_7_r <= t0_l2_7;
    acc_0 <= first ? $signed(t0_l5_0) : (acc_0 <<< 1) + $signed(t0_l5_0);
    t1_l2_0_r <= t1_l2_0;
    t1_l2_1_r <= t1_l2_1;
    t1_l2_2_r <= t1_l2_2;
    t1_l2_3_r <= t1_l2_3;
    t1_l2_4_r <= t1_l2_4;
    t1_l2_5_r <= t1_l2_5;
    t1_l2_6_r <= t1_l2_6;
    t1_l2_7_r <= t1_l2_7;
    acc_1 <= first ? $signed(t1_l5_0) : (acc_1 <<< 1) + $signed(t1_l5_0);
  end
endmodule