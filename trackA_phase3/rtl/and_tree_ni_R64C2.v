module and_tree_ni (
  input clk,
  input signed [5:0] x_0,
  input signed [5:0] x_1,
  input signed [5:0] x_2,
  input signed [5:0] x_3,
  input signed [5:0] x_4,
  input signed [5:0] x_5,
  input signed [5:0] x_6,
  input signed [5:0] x_7,
  input signed [5:0] x_8,
  input signed [5:0] x_9,
  input signed [5:0] x_10,
  input signed [5:0] x_11,
  input signed [5:0] x_12,
  input signed [5:0] x_13,
  input signed [5:0] x_14,
  input signed [5:0] x_15,
  input signed [5:0] x_16,
  input signed [5:0] x_17,
  input signed [5:0] x_18,
  input signed [5:0] x_19,
  input signed [5:0] x_20,
  input signed [5:0] x_21,
  input signed [5:0] x_22,
  input signed [5:0] x_23,
  input signed [5:0] x_24,
  input signed [5:0] x_25,
  input signed [5:0] x_26,
  input signed [5:0] x_27,
  input signed [5:0] x_28,
  input signed [5:0] x_29,
  input signed [5:0] x_30,
  input signed [5:0] x_31,
  input signed [5:0] x_32,
  input signed [5:0] x_33,
  input signed [5:0] x_34,
  input signed [5:0] x_35,
  input signed [5:0] x_36,
  input signed [5:0] x_37,
  input signed [5:0] x_38,
  input signed [5:0] x_39,
  input signed [5:0] x_40,
  input signed [5:0] x_41,
  input signed [5:0] x_42,
  input signed [5:0] x_43,
  input signed [5:0] x_44,
  input signed [5:0] x_45,
  input signed [5:0] x_46,
  input signed [5:0] x_47,
  input signed [5:0] x_48,
  input signed [5:0] x_49,
  input signed [5:0] x_50,
  input signed [5:0] x_51,
  input signed [5:0] x_52,
  input signed [5:0] x_53,
  input signed [5:0] x_54,
  input signed [5:0] x_55,
  input signed [5:0] x_56,
  input signed [5:0] x_57,
  input signed [5:0] x_58,
  input signed [5:0] x_59,
  input signed [5:0] x_60,
  input signed [5:0] x_61,
  input signed [5:0] x_62,
  input signed [5:0] x_63,
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
  wire signed [5:0] pr_0_0 = w_0_0 ? x_0 : 6'sd0;
  wire signed [5:0] pr_1_0 = w_1_0 ? x_1 : 6'sd0;
  wire signed [5:0] pr_2_0 = w_2_0 ? x_2 : 6'sd0;
  wire signed [5:0] pr_3_0 = w_3_0 ? x_3 : 6'sd0;
  wire signed [5:0] pr_4_0 = w_4_0 ? x_4 : 6'sd0;
  wire signed [5:0] pr_5_0 = w_5_0 ? x_5 : 6'sd0;
  wire signed [5:0] pr_6_0 = w_6_0 ? x_6 : 6'sd0;
  wire signed [5:0] pr_7_0 = w_7_0 ? x_7 : 6'sd0;
  wire signed [5:0] pr_8_0 = w_8_0 ? x_8 : 6'sd0;
  wire signed [5:0] pr_9_0 = w_9_0 ? x_9 : 6'sd0;
  wire signed [5:0] pr_10_0 = w_10_0 ? x_10 : 6'sd0;
  wire signed [5:0] pr_11_0 = w_11_0 ? x_11 : 6'sd0;
  wire signed [5:0] pr_12_0 = w_12_0 ? x_12 : 6'sd0;
  wire signed [5:0] pr_13_0 = w_13_0 ? x_13 : 6'sd0;
  wire signed [5:0] pr_14_0 = w_14_0 ? x_14 : 6'sd0;
  wire signed [5:0] pr_15_0 = w_15_0 ? x_15 : 6'sd0;
  wire signed [5:0] pr_16_0 = w_16_0 ? x_16 : 6'sd0;
  wire signed [5:0] pr_17_0 = w_17_0 ? x_17 : 6'sd0;
  wire signed [5:0] pr_18_0 = w_18_0 ? x_18 : 6'sd0;
  wire signed [5:0] pr_19_0 = w_19_0 ? x_19 : 6'sd0;
  wire signed [5:0] pr_20_0 = w_20_0 ? x_20 : 6'sd0;
  wire signed [5:0] pr_21_0 = w_21_0 ? x_21 : 6'sd0;
  wire signed [5:0] pr_22_0 = w_22_0 ? x_22 : 6'sd0;
  wire signed [5:0] pr_23_0 = w_23_0 ? x_23 : 6'sd0;
  wire signed [5:0] pr_24_0 = w_24_0 ? x_24 : 6'sd0;
  wire signed [5:0] pr_25_0 = w_25_0 ? x_25 : 6'sd0;
  wire signed [5:0] pr_26_0 = w_26_0 ? x_26 : 6'sd0;
  wire signed [5:0] pr_27_0 = w_27_0 ? x_27 : 6'sd0;
  wire signed [5:0] pr_28_0 = w_28_0 ? x_28 : 6'sd0;
  wire signed [5:0] pr_29_0 = w_29_0 ? x_29 : 6'sd0;
  wire signed [5:0] pr_30_0 = w_30_0 ? x_30 : 6'sd0;
  wire signed [5:0] pr_31_0 = w_31_0 ? x_31 : 6'sd0;
  wire signed [5:0] pr_32_0 = w_32_0 ? x_32 : 6'sd0;
  wire signed [5:0] pr_33_0 = w_33_0 ? x_33 : 6'sd0;
  wire signed [5:0] pr_34_0 = w_34_0 ? x_34 : 6'sd0;
  wire signed [5:0] pr_35_0 = w_35_0 ? x_35 : 6'sd0;
  wire signed [5:0] pr_36_0 = w_36_0 ? x_36 : 6'sd0;
  wire signed [5:0] pr_37_0 = w_37_0 ? x_37 : 6'sd0;
  wire signed [5:0] pr_38_0 = w_38_0 ? x_38 : 6'sd0;
  wire signed [5:0] pr_39_0 = w_39_0 ? x_39 : 6'sd0;
  wire signed [5:0] pr_40_0 = w_40_0 ? x_40 : 6'sd0;
  wire signed [5:0] pr_41_0 = w_41_0 ? x_41 : 6'sd0;
  wire signed [5:0] pr_42_0 = w_42_0 ? x_42 : 6'sd0;
  wire signed [5:0] pr_43_0 = w_43_0 ? x_43 : 6'sd0;
  wire signed [5:0] pr_44_0 = w_44_0 ? x_44 : 6'sd0;
  wire signed [5:0] pr_45_0 = w_45_0 ? x_45 : 6'sd0;
  wire signed [5:0] pr_46_0 = w_46_0 ? x_46 : 6'sd0;
  wire signed [5:0] pr_47_0 = w_47_0 ? x_47 : 6'sd0;
  wire signed [5:0] pr_48_0 = w_48_0 ? x_48 : 6'sd0;
  wire signed [5:0] pr_49_0 = w_49_0 ? x_49 : 6'sd0;
  wire signed [5:0] pr_50_0 = w_50_0 ? x_50 : 6'sd0;
  wire signed [5:0] pr_51_0 = w_51_0 ? x_51 : 6'sd0;
  wire signed [5:0] pr_52_0 = w_52_0 ? x_52 : 6'sd0;
  wire signed [5:0] pr_53_0 = w_53_0 ? x_53 : 6'sd0;
  wire signed [5:0] pr_54_0 = w_54_0 ? x_54 : 6'sd0;
  wire signed [5:0] pr_55_0 = w_55_0 ? x_55 : 6'sd0;
  wire signed [5:0] pr_56_0 = w_56_0 ? x_56 : 6'sd0;
  wire signed [5:0] pr_57_0 = w_57_0 ? x_57 : 6'sd0;
  wire signed [5:0] pr_58_0 = w_58_0 ? x_58 : 6'sd0;
  wire signed [5:0] pr_59_0 = w_59_0 ? x_59 : 6'sd0;
  wire signed [5:0] pr_60_0 = w_60_0 ? x_60 : 6'sd0;
  wire signed [5:0] pr_61_0 = w_61_0 ? x_61 : 6'sd0;
  wire signed [5:0] pr_62_0 = w_62_0 ? x_62 : 6'sd0;
  wire signed [5:0] pr_63_0 = w_63_0 ? x_63 : 6'sd0;
  wire signed [6:0] t0_l0_0;
  assign t0_l0_0 = $signed(pr_0_0) + $signed(pr_1_0);
  wire signed [6:0] t0_l0_1;
  assign t0_l0_1 = $signed(pr_2_0) + $signed(pr_3_0);
  wire signed [6:0] t0_l0_2;
  assign t0_l0_2 = $signed(pr_4_0) + $signed(pr_5_0);
  wire signed [6:0] t0_l0_3;
  assign t0_l0_3 = $signed(pr_6_0) + $signed(pr_7_0);
  wire signed [6:0] t0_l0_4;
  assign t0_l0_4 = $signed(pr_8_0) + $signed(pr_9_0);
  wire signed [6:0] t0_l0_5;
  assign t0_l0_5 = $signed(pr_10_0) + $signed(pr_11_0);
  wire signed [6:0] t0_l0_6;
  assign t0_l0_6 = $signed(pr_12_0) + $signed(pr_13_0);
  wire signed [6:0] t0_l0_7;
  assign t0_l0_7 = $signed(pr_14_0) + $signed(pr_15_0);
  wire signed [6:0] t0_l0_8;
  assign t0_l0_8 = $signed(pr_16_0) + $signed(pr_17_0);
  wire signed [6:0] t0_l0_9;
  assign t0_l0_9 = $signed(pr_18_0) + $signed(pr_19_0);
  wire signed [6:0] t0_l0_10;
  assign t0_l0_10 = $signed(pr_20_0) + $signed(pr_21_0);
  wire signed [6:0] t0_l0_11;
  assign t0_l0_11 = $signed(pr_22_0) + $signed(pr_23_0);
  wire signed [6:0] t0_l0_12;
  assign t0_l0_12 = $signed(pr_24_0) + $signed(pr_25_0);
  wire signed [6:0] t0_l0_13;
  assign t0_l0_13 = $signed(pr_26_0) + $signed(pr_27_0);
  wire signed [6:0] t0_l0_14;
  assign t0_l0_14 = $signed(pr_28_0) + $signed(pr_29_0);
  wire signed [6:0] t0_l0_15;
  assign t0_l0_15 = $signed(pr_30_0) + $signed(pr_31_0);
  wire signed [6:0] t0_l0_16;
  assign t0_l0_16 = $signed(pr_32_0) + $signed(pr_33_0);
  wire signed [6:0] t0_l0_17;
  assign t0_l0_17 = $signed(pr_34_0) + $signed(pr_35_0);
  wire signed [6:0] t0_l0_18;
  assign t0_l0_18 = $signed(pr_36_0) + $signed(pr_37_0);
  wire signed [6:0] t0_l0_19;
  assign t0_l0_19 = $signed(pr_38_0) + $signed(pr_39_0);
  wire signed [6:0] t0_l0_20;
  assign t0_l0_20 = $signed(pr_40_0) + $signed(pr_41_0);
  wire signed [6:0] t0_l0_21;
  assign t0_l0_21 = $signed(pr_42_0) + $signed(pr_43_0);
  wire signed [6:0] t0_l0_22;
  assign t0_l0_22 = $signed(pr_44_0) + $signed(pr_45_0);
  wire signed [6:0] t0_l0_23;
  assign t0_l0_23 = $signed(pr_46_0) + $signed(pr_47_0);
  wire signed [6:0] t0_l0_24;
  assign t0_l0_24 = $signed(pr_48_0) + $signed(pr_49_0);
  wire signed [6:0] t0_l0_25;
  assign t0_l0_25 = $signed(pr_50_0) + $signed(pr_51_0);
  wire signed [6:0] t0_l0_26;
  assign t0_l0_26 = $signed(pr_52_0) + $signed(pr_53_0);
  wire signed [6:0] t0_l0_27;
  assign t0_l0_27 = $signed(pr_54_0) + $signed(pr_55_0);
  wire signed [6:0] t0_l0_28;
  assign t0_l0_28 = $signed(pr_56_0) + $signed(pr_57_0);
  wire signed [6:0] t0_l0_29;
  assign t0_l0_29 = $signed(pr_58_0) + $signed(pr_59_0);
  wire signed [6:0] t0_l0_30;
  assign t0_l0_30 = $signed(pr_60_0) + $signed(pr_61_0);
  wire signed [6:0] t0_l0_31;
  assign t0_l0_31 = $signed(pr_62_0) + $signed(pr_63_0);
  wire signed [7:0] t0_l1_0;
  assign t0_l1_0 = $signed(t0_l0_0) + $signed(t0_l0_1);
  wire signed [7:0] t0_l1_1;
  assign t0_l1_1 = $signed(t0_l0_2) + $signed(t0_l0_3);
  wire signed [7:0] t0_l1_2;
  assign t0_l1_2 = $signed(t0_l0_4) + $signed(t0_l0_5);
  wire signed [7:0] t0_l1_3;
  assign t0_l1_3 = $signed(t0_l0_6) + $signed(t0_l0_7);
  wire signed [7:0] t0_l1_4;
  assign t0_l1_4 = $signed(t0_l0_8) + $signed(t0_l0_9);
  wire signed [7:0] t0_l1_5;
  assign t0_l1_5 = $signed(t0_l0_10) + $signed(t0_l0_11);
  wire signed [7:0] t0_l1_6;
  assign t0_l1_6 = $signed(t0_l0_12) + $signed(t0_l0_13);
  wire signed [7:0] t0_l1_7;
  assign t0_l1_7 = $signed(t0_l0_14) + $signed(t0_l0_15);
  wire signed [7:0] t0_l1_8;
  assign t0_l1_8 = $signed(t0_l0_16) + $signed(t0_l0_17);
  wire signed [7:0] t0_l1_9;
  assign t0_l1_9 = $signed(t0_l0_18) + $signed(t0_l0_19);
  wire signed [7:0] t0_l1_10;
  assign t0_l1_10 = $signed(t0_l0_20) + $signed(t0_l0_21);
  wire signed [7:0] t0_l1_11;
  assign t0_l1_11 = $signed(t0_l0_22) + $signed(t0_l0_23);
  wire signed [7:0] t0_l1_12;
  assign t0_l1_12 = $signed(t0_l0_24) + $signed(t0_l0_25);
  wire signed [7:0] t0_l1_13;
  assign t0_l1_13 = $signed(t0_l0_26) + $signed(t0_l0_27);
  wire signed [7:0] t0_l1_14;
  assign t0_l1_14 = $signed(t0_l0_28) + $signed(t0_l0_29);
  wire signed [7:0] t0_l1_15;
  assign t0_l1_15 = $signed(t0_l0_30) + $signed(t0_l0_31);
  wire signed [8:0] t0_l2_0;
  assign t0_l2_0 = $signed(t0_l1_0) + $signed(t0_l1_1);
  wire signed [8:0] t0_l2_1;
  assign t0_l2_1 = $signed(t0_l1_2) + $signed(t0_l1_3);
  wire signed [8:0] t0_l2_2;
  assign t0_l2_2 = $signed(t0_l1_4) + $signed(t0_l1_5);
  wire signed [8:0] t0_l2_3;
  assign t0_l2_3 = $signed(t0_l1_6) + $signed(t0_l1_7);
  wire signed [8:0] t0_l2_4;
  assign t0_l2_4 = $signed(t0_l1_8) + $signed(t0_l1_9);
  wire signed [8:0] t0_l2_5;
  assign t0_l2_5 = $signed(t0_l1_10) + $signed(t0_l1_11);
  wire signed [8:0] t0_l2_6;
  assign t0_l2_6 = $signed(t0_l1_12) + $signed(t0_l1_13);
  wire signed [8:0] t0_l2_7;
  assign t0_l2_7 = $signed(t0_l1_14) + $signed(t0_l1_15);
  reg signed [8:0] t0_l2_0_r;
  reg signed [8:0] t0_l2_1_r;
  reg signed [8:0] t0_l2_2_r;
  reg signed [8:0] t0_l2_3_r;
  reg signed [8:0] t0_l2_4_r;
  reg signed [8:0] t0_l2_5_r;
  reg signed [8:0] t0_l2_6_r;
  reg signed [8:0] t0_l2_7_r;
  wire signed [9:0] t0_l3_0;
  assign t0_l3_0 = $signed(t0_l2_0_r) + $signed(t0_l2_1_r);
  wire signed [9:0] t0_l3_1;
  assign t0_l3_1 = $signed(t0_l2_2_r) + $signed(t0_l2_3_r);
  wire signed [9:0] t0_l3_2;
  assign t0_l3_2 = $signed(t0_l2_4_r) + $signed(t0_l2_5_r);
  wire signed [9:0] t0_l3_3;
  assign t0_l3_3 = $signed(t0_l2_6_r) + $signed(t0_l2_7_r);
  wire signed [10:0] t0_l4_0;
  assign t0_l4_0 = $signed(t0_l3_0) + $signed(t0_l3_1);
  wire signed [10:0] t0_l4_1;
  assign t0_l4_1 = $signed(t0_l3_2) + $signed(t0_l3_3);
  wire signed [11:0] t0_l5_0;
  assign t0_l5_0 = $signed(t0_l4_0) + $signed(t0_l4_1);
  reg signed [12:0] yo_0;
  assign y_0 = yo_0;
  wire signed [5:0] pr_0_1 = w_0_1 ? x_0 : 6'sd0;
  wire signed [5:0] pr_1_1 = w_1_1 ? x_1 : 6'sd0;
  wire signed [5:0] pr_2_1 = w_2_1 ? x_2 : 6'sd0;
  wire signed [5:0] pr_3_1 = w_3_1 ? x_3 : 6'sd0;
  wire signed [5:0] pr_4_1 = w_4_1 ? x_4 : 6'sd0;
  wire signed [5:0] pr_5_1 = w_5_1 ? x_5 : 6'sd0;
  wire signed [5:0] pr_6_1 = w_6_1 ? x_6 : 6'sd0;
  wire signed [5:0] pr_7_1 = w_7_1 ? x_7 : 6'sd0;
  wire signed [5:0] pr_8_1 = w_8_1 ? x_8 : 6'sd0;
  wire signed [5:0] pr_9_1 = w_9_1 ? x_9 : 6'sd0;
  wire signed [5:0] pr_10_1 = w_10_1 ? x_10 : 6'sd0;
  wire signed [5:0] pr_11_1 = w_11_1 ? x_11 : 6'sd0;
  wire signed [5:0] pr_12_1 = w_12_1 ? x_12 : 6'sd0;
  wire signed [5:0] pr_13_1 = w_13_1 ? x_13 : 6'sd0;
  wire signed [5:0] pr_14_1 = w_14_1 ? x_14 : 6'sd0;
  wire signed [5:0] pr_15_1 = w_15_1 ? x_15 : 6'sd0;
  wire signed [5:0] pr_16_1 = w_16_1 ? x_16 : 6'sd0;
  wire signed [5:0] pr_17_1 = w_17_1 ? x_17 : 6'sd0;
  wire signed [5:0] pr_18_1 = w_18_1 ? x_18 : 6'sd0;
  wire signed [5:0] pr_19_1 = w_19_1 ? x_19 : 6'sd0;
  wire signed [5:0] pr_20_1 = w_20_1 ? x_20 : 6'sd0;
  wire signed [5:0] pr_21_1 = w_21_1 ? x_21 : 6'sd0;
  wire signed [5:0] pr_22_1 = w_22_1 ? x_22 : 6'sd0;
  wire signed [5:0] pr_23_1 = w_23_1 ? x_23 : 6'sd0;
  wire signed [5:0] pr_24_1 = w_24_1 ? x_24 : 6'sd0;
  wire signed [5:0] pr_25_1 = w_25_1 ? x_25 : 6'sd0;
  wire signed [5:0] pr_26_1 = w_26_1 ? x_26 : 6'sd0;
  wire signed [5:0] pr_27_1 = w_27_1 ? x_27 : 6'sd0;
  wire signed [5:0] pr_28_1 = w_28_1 ? x_28 : 6'sd0;
  wire signed [5:0] pr_29_1 = w_29_1 ? x_29 : 6'sd0;
  wire signed [5:0] pr_30_1 = w_30_1 ? x_30 : 6'sd0;
  wire signed [5:0] pr_31_1 = w_31_1 ? x_31 : 6'sd0;
  wire signed [5:0] pr_32_1 = w_32_1 ? x_32 : 6'sd0;
  wire signed [5:0] pr_33_1 = w_33_1 ? x_33 : 6'sd0;
  wire signed [5:0] pr_34_1 = w_34_1 ? x_34 : 6'sd0;
  wire signed [5:0] pr_35_1 = w_35_1 ? x_35 : 6'sd0;
  wire signed [5:0] pr_36_1 = w_36_1 ? x_36 : 6'sd0;
  wire signed [5:0] pr_37_1 = w_37_1 ? x_37 : 6'sd0;
  wire signed [5:0] pr_38_1 = w_38_1 ? x_38 : 6'sd0;
  wire signed [5:0] pr_39_1 = w_39_1 ? x_39 : 6'sd0;
  wire signed [5:0] pr_40_1 = w_40_1 ? x_40 : 6'sd0;
  wire signed [5:0] pr_41_1 = w_41_1 ? x_41 : 6'sd0;
  wire signed [5:0] pr_42_1 = w_42_1 ? x_42 : 6'sd0;
  wire signed [5:0] pr_43_1 = w_43_1 ? x_43 : 6'sd0;
  wire signed [5:0] pr_44_1 = w_44_1 ? x_44 : 6'sd0;
  wire signed [5:0] pr_45_1 = w_45_1 ? x_45 : 6'sd0;
  wire signed [5:0] pr_46_1 = w_46_1 ? x_46 : 6'sd0;
  wire signed [5:0] pr_47_1 = w_47_1 ? x_47 : 6'sd0;
  wire signed [5:0] pr_48_1 = w_48_1 ? x_48 : 6'sd0;
  wire signed [5:0] pr_49_1 = w_49_1 ? x_49 : 6'sd0;
  wire signed [5:0] pr_50_1 = w_50_1 ? x_50 : 6'sd0;
  wire signed [5:0] pr_51_1 = w_51_1 ? x_51 : 6'sd0;
  wire signed [5:0] pr_52_1 = w_52_1 ? x_52 : 6'sd0;
  wire signed [5:0] pr_53_1 = w_53_1 ? x_53 : 6'sd0;
  wire signed [5:0] pr_54_1 = w_54_1 ? x_54 : 6'sd0;
  wire signed [5:0] pr_55_1 = w_55_1 ? x_55 : 6'sd0;
  wire signed [5:0] pr_56_1 = w_56_1 ? x_56 : 6'sd0;
  wire signed [5:0] pr_57_1 = w_57_1 ? x_57 : 6'sd0;
  wire signed [5:0] pr_58_1 = w_58_1 ? x_58 : 6'sd0;
  wire signed [5:0] pr_59_1 = w_59_1 ? x_59 : 6'sd0;
  wire signed [5:0] pr_60_1 = w_60_1 ? x_60 : 6'sd0;
  wire signed [5:0] pr_61_1 = w_61_1 ? x_61 : 6'sd0;
  wire signed [5:0] pr_62_1 = w_62_1 ? x_62 : 6'sd0;
  wire signed [5:0] pr_63_1 = w_63_1 ? x_63 : 6'sd0;
  wire signed [6:0] t1_l0_0;
  assign t1_l0_0 = $signed(pr_0_1) + $signed(pr_1_1);
  wire signed [6:0] t1_l0_1;
  assign t1_l0_1 = $signed(pr_2_1) + $signed(pr_3_1);
  wire signed [6:0] t1_l0_2;
  assign t1_l0_2 = $signed(pr_4_1) + $signed(pr_5_1);
  wire signed [6:0] t1_l0_3;
  assign t1_l0_3 = $signed(pr_6_1) + $signed(pr_7_1);
  wire signed [6:0] t1_l0_4;
  assign t1_l0_4 = $signed(pr_8_1) + $signed(pr_9_1);
  wire signed [6:0] t1_l0_5;
  assign t1_l0_5 = $signed(pr_10_1) + $signed(pr_11_1);
  wire signed [6:0] t1_l0_6;
  assign t1_l0_6 = $signed(pr_12_1) + $signed(pr_13_1);
  wire signed [6:0] t1_l0_7;
  assign t1_l0_7 = $signed(pr_14_1) + $signed(pr_15_1);
  wire signed [6:0] t1_l0_8;
  assign t1_l0_8 = $signed(pr_16_1) + $signed(pr_17_1);
  wire signed [6:0] t1_l0_9;
  assign t1_l0_9 = $signed(pr_18_1) + $signed(pr_19_1);
  wire signed [6:0] t1_l0_10;
  assign t1_l0_10 = $signed(pr_20_1) + $signed(pr_21_1);
  wire signed [6:0] t1_l0_11;
  assign t1_l0_11 = $signed(pr_22_1) + $signed(pr_23_1);
  wire signed [6:0] t1_l0_12;
  assign t1_l0_12 = $signed(pr_24_1) + $signed(pr_25_1);
  wire signed [6:0] t1_l0_13;
  assign t1_l0_13 = $signed(pr_26_1) + $signed(pr_27_1);
  wire signed [6:0] t1_l0_14;
  assign t1_l0_14 = $signed(pr_28_1) + $signed(pr_29_1);
  wire signed [6:0] t1_l0_15;
  assign t1_l0_15 = $signed(pr_30_1) + $signed(pr_31_1);
  wire signed [6:0] t1_l0_16;
  assign t1_l0_16 = $signed(pr_32_1) + $signed(pr_33_1);
  wire signed [6:0] t1_l0_17;
  assign t1_l0_17 = $signed(pr_34_1) + $signed(pr_35_1);
  wire signed [6:0] t1_l0_18;
  assign t1_l0_18 = $signed(pr_36_1) + $signed(pr_37_1);
  wire signed [6:0] t1_l0_19;
  assign t1_l0_19 = $signed(pr_38_1) + $signed(pr_39_1);
  wire signed [6:0] t1_l0_20;
  assign t1_l0_20 = $signed(pr_40_1) + $signed(pr_41_1);
  wire signed [6:0] t1_l0_21;
  assign t1_l0_21 = $signed(pr_42_1) + $signed(pr_43_1);
  wire signed [6:0] t1_l0_22;
  assign t1_l0_22 = $signed(pr_44_1) + $signed(pr_45_1);
  wire signed [6:0] t1_l0_23;
  assign t1_l0_23 = $signed(pr_46_1) + $signed(pr_47_1);
  wire signed [6:0] t1_l0_24;
  assign t1_l0_24 = $signed(pr_48_1) + $signed(pr_49_1);
  wire signed [6:0] t1_l0_25;
  assign t1_l0_25 = $signed(pr_50_1) + $signed(pr_51_1);
  wire signed [6:0] t1_l0_26;
  assign t1_l0_26 = $signed(pr_52_1) + $signed(pr_53_1);
  wire signed [6:0] t1_l0_27;
  assign t1_l0_27 = $signed(pr_54_1) + $signed(pr_55_1);
  wire signed [6:0] t1_l0_28;
  assign t1_l0_28 = $signed(pr_56_1) + $signed(pr_57_1);
  wire signed [6:0] t1_l0_29;
  assign t1_l0_29 = $signed(pr_58_1) + $signed(pr_59_1);
  wire signed [6:0] t1_l0_30;
  assign t1_l0_30 = $signed(pr_60_1) + $signed(pr_61_1);
  wire signed [6:0] t1_l0_31;
  assign t1_l0_31 = $signed(pr_62_1) + $signed(pr_63_1);
  wire signed [7:0] t1_l1_0;
  assign t1_l1_0 = $signed(t1_l0_0) + $signed(t1_l0_1);
  wire signed [7:0] t1_l1_1;
  assign t1_l1_1 = $signed(t1_l0_2) + $signed(t1_l0_3);
  wire signed [7:0] t1_l1_2;
  assign t1_l1_2 = $signed(t1_l0_4) + $signed(t1_l0_5);
  wire signed [7:0] t1_l1_3;
  assign t1_l1_3 = $signed(t1_l0_6) + $signed(t1_l0_7);
  wire signed [7:0] t1_l1_4;
  assign t1_l1_4 = $signed(t1_l0_8) + $signed(t1_l0_9);
  wire signed [7:0] t1_l1_5;
  assign t1_l1_5 = $signed(t1_l0_10) + $signed(t1_l0_11);
  wire signed [7:0] t1_l1_6;
  assign t1_l1_6 = $signed(t1_l0_12) + $signed(t1_l0_13);
  wire signed [7:0] t1_l1_7;
  assign t1_l1_7 = $signed(t1_l0_14) + $signed(t1_l0_15);
  wire signed [7:0] t1_l1_8;
  assign t1_l1_8 = $signed(t1_l0_16) + $signed(t1_l0_17);
  wire signed [7:0] t1_l1_9;
  assign t1_l1_9 = $signed(t1_l0_18) + $signed(t1_l0_19);
  wire signed [7:0] t1_l1_10;
  assign t1_l1_10 = $signed(t1_l0_20) + $signed(t1_l0_21);
  wire signed [7:0] t1_l1_11;
  assign t1_l1_11 = $signed(t1_l0_22) + $signed(t1_l0_23);
  wire signed [7:0] t1_l1_12;
  assign t1_l1_12 = $signed(t1_l0_24) + $signed(t1_l0_25);
  wire signed [7:0] t1_l1_13;
  assign t1_l1_13 = $signed(t1_l0_26) + $signed(t1_l0_27);
  wire signed [7:0] t1_l1_14;
  assign t1_l1_14 = $signed(t1_l0_28) + $signed(t1_l0_29);
  wire signed [7:0] t1_l1_15;
  assign t1_l1_15 = $signed(t1_l0_30) + $signed(t1_l0_31);
  wire signed [8:0] t1_l2_0;
  assign t1_l2_0 = $signed(t1_l1_0) + $signed(t1_l1_1);
  wire signed [8:0] t1_l2_1;
  assign t1_l2_1 = $signed(t1_l1_2) + $signed(t1_l1_3);
  wire signed [8:0] t1_l2_2;
  assign t1_l2_2 = $signed(t1_l1_4) + $signed(t1_l1_5);
  wire signed [8:0] t1_l2_3;
  assign t1_l2_3 = $signed(t1_l1_6) + $signed(t1_l1_7);
  wire signed [8:0] t1_l2_4;
  assign t1_l2_4 = $signed(t1_l1_8) + $signed(t1_l1_9);
  wire signed [8:0] t1_l2_5;
  assign t1_l2_5 = $signed(t1_l1_10) + $signed(t1_l1_11);
  wire signed [8:0] t1_l2_6;
  assign t1_l2_6 = $signed(t1_l1_12) + $signed(t1_l1_13);
  wire signed [8:0] t1_l2_7;
  assign t1_l2_7 = $signed(t1_l1_14) + $signed(t1_l1_15);
  reg signed [8:0] t1_l2_0_r;
  reg signed [8:0] t1_l2_1_r;
  reg signed [8:0] t1_l2_2_r;
  reg signed [8:0] t1_l2_3_r;
  reg signed [8:0] t1_l2_4_r;
  reg signed [8:0] t1_l2_5_r;
  reg signed [8:0] t1_l2_6_r;
  reg signed [8:0] t1_l2_7_r;
  wire signed [9:0] t1_l3_0;
  assign t1_l3_0 = $signed(t1_l2_0_r) + $signed(t1_l2_1_r);
  wire signed [9:0] t1_l3_1;
  assign t1_l3_1 = $signed(t1_l2_2_r) + $signed(t1_l2_3_r);
  wire signed [9:0] t1_l3_2;
  assign t1_l3_2 = $signed(t1_l2_4_r) + $signed(t1_l2_5_r);
  wire signed [9:0] t1_l3_3;
  assign t1_l3_3 = $signed(t1_l2_6_r) + $signed(t1_l2_7_r);
  wire signed [10:0] t1_l4_0;
  assign t1_l4_0 = $signed(t1_l3_0) + $signed(t1_l3_1);
  wire signed [10:0] t1_l4_1;
  assign t1_l4_1 = $signed(t1_l3_2) + $signed(t1_l3_3);
  wire signed [11:0] t1_l5_0;
  assign t1_l5_0 = $signed(t1_l4_0) + $signed(t1_l4_1);
  reg signed [12:0] yo_1;
  assign y_1 = yo_1;
  always @(posedge clk) begin
    t0_l2_0_r <= t0_l2_0;
    t0_l2_1_r <= t0_l2_1;
    t0_l2_2_r <= t0_l2_2;
    t0_l2_3_r <= t0_l2_3;
    t0_l2_4_r <= t0_l2_4;
    t0_l2_5_r <= t0_l2_5;
    t0_l2_6_r <= t0_l2_6;
    t0_l2_7_r <= t0_l2_7;
    yo_0 <= t0_l5_0;
    t1_l2_0_r <= t1_l2_0;
    t1_l2_1_r <= t1_l2_1;
    t1_l2_2_r <= t1_l2_2;
    t1_l2_3_r <= t1_l2_3;
    t1_l2_4_r <= t1_l2_4;
    t1_l2_5_r <= t1_l2_5;
    t1_l2_6_r <= t1_l2_6;
    t1_l2_7_r <= t1_l2_7;
    yo_1 <= t1_l5_0;
  end
endmodule