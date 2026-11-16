module sgn_tree (
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
  reg signed [5:0] xr_0;
  reg signed [5:0] xr_1;
  reg signed [5:0] xr_2;
  reg signed [5:0] xr_3;
  reg signed [5:0] xr_4;
  reg signed [5:0] xr_5;
  reg signed [5:0] xr_6;
  reg signed [5:0] xr_7;
  reg signed [5:0] xr_8;
  reg signed [5:0] xr_9;
  reg signed [5:0] xr_10;
  reg signed [5:0] xr_11;
  reg signed [5:0] xr_12;
  reg signed [5:0] xr_13;
  reg signed [5:0] xr_14;
  reg signed [5:0] xr_15;
  reg signed [5:0] xr_16;
  reg signed [5:0] xr_17;
  reg signed [5:0] xr_18;
  reg signed [5:0] xr_19;
  reg signed [5:0] xr_20;
  reg signed [5:0] xr_21;
  reg signed [5:0] xr_22;
  reg signed [5:0] xr_23;
  reg signed [5:0] xr_24;
  reg signed [5:0] xr_25;
  reg signed [5:0] xr_26;
  reg signed [5:0] xr_27;
  reg signed [5:0] xr_28;
  reg signed [5:0] xr_29;
  reg signed [5:0] xr_30;
  reg signed [5:0] xr_31;
  reg signed [5:0] xr_32;
  reg signed [5:0] xr_33;
  reg signed [5:0] xr_34;
  reg signed [5:0] xr_35;
  reg signed [5:0] xr_36;
  reg signed [5:0] xr_37;
  reg signed [5:0] xr_38;
  reg signed [5:0] xr_39;
  reg signed [5:0] xr_40;
  reg signed [5:0] xr_41;
  reg signed [5:0] xr_42;
  reg signed [5:0] xr_43;
  reg signed [5:0] xr_44;
  reg signed [5:0] xr_45;
  reg signed [5:0] xr_46;
  reg signed [5:0] xr_47;
  reg signed [5:0] xr_48;
  reg signed [5:0] xr_49;
  reg signed [5:0] xr_50;
  reg signed [5:0] xr_51;
  reg signed [5:0] xr_52;
  reg signed [5:0] xr_53;
  reg signed [5:0] xr_54;
  reg signed [5:0] xr_55;
  reg signed [5:0] xr_56;
  reg signed [5:0] xr_57;
  reg signed [5:0] xr_58;
  reg signed [5:0] xr_59;
  reg signed [5:0] xr_60;
  reg signed [5:0] xr_61;
  reg signed [5:0] xr_62;
  reg signed [5:0] xr_63;
  wire signed [6:0] pr_0_0 = w_0_0 ? $signed(xr_0) : -$signed(xr_0);
  wire signed [6:0] pr_1_0 = w_1_0 ? $signed(xr_1) : -$signed(xr_1);
  wire signed [6:0] pr_2_0 = w_2_0 ? $signed(xr_2) : -$signed(xr_2);
  wire signed [6:0] pr_3_0 = w_3_0 ? $signed(xr_3) : -$signed(xr_3);
  wire signed [6:0] pr_4_0 = w_4_0 ? $signed(xr_4) : -$signed(xr_4);
  wire signed [6:0] pr_5_0 = w_5_0 ? $signed(xr_5) : -$signed(xr_5);
  wire signed [6:0] pr_6_0 = w_6_0 ? $signed(xr_6) : -$signed(xr_6);
  wire signed [6:0] pr_7_0 = w_7_0 ? $signed(xr_7) : -$signed(xr_7);
  wire signed [6:0] pr_8_0 = w_8_0 ? $signed(xr_8) : -$signed(xr_8);
  wire signed [6:0] pr_9_0 = w_9_0 ? $signed(xr_9) : -$signed(xr_9);
  wire signed [6:0] pr_10_0 = w_10_0 ? $signed(xr_10) : -$signed(xr_10);
  wire signed [6:0] pr_11_0 = w_11_0 ? $signed(xr_11) : -$signed(xr_11);
  wire signed [6:0] pr_12_0 = w_12_0 ? $signed(xr_12) : -$signed(xr_12);
  wire signed [6:0] pr_13_0 = w_13_0 ? $signed(xr_13) : -$signed(xr_13);
  wire signed [6:0] pr_14_0 = w_14_0 ? $signed(xr_14) : -$signed(xr_14);
  wire signed [6:0] pr_15_0 = w_15_0 ? $signed(xr_15) : -$signed(xr_15);
  wire signed [6:0] pr_16_0 = w_16_0 ? $signed(xr_16) : -$signed(xr_16);
  wire signed [6:0] pr_17_0 = w_17_0 ? $signed(xr_17) : -$signed(xr_17);
  wire signed [6:0] pr_18_0 = w_18_0 ? $signed(xr_18) : -$signed(xr_18);
  wire signed [6:0] pr_19_0 = w_19_0 ? $signed(xr_19) : -$signed(xr_19);
  wire signed [6:0] pr_20_0 = w_20_0 ? $signed(xr_20) : -$signed(xr_20);
  wire signed [6:0] pr_21_0 = w_21_0 ? $signed(xr_21) : -$signed(xr_21);
  wire signed [6:0] pr_22_0 = w_22_0 ? $signed(xr_22) : -$signed(xr_22);
  wire signed [6:0] pr_23_0 = w_23_0 ? $signed(xr_23) : -$signed(xr_23);
  wire signed [6:0] pr_24_0 = w_24_0 ? $signed(xr_24) : -$signed(xr_24);
  wire signed [6:0] pr_25_0 = w_25_0 ? $signed(xr_25) : -$signed(xr_25);
  wire signed [6:0] pr_26_0 = w_26_0 ? $signed(xr_26) : -$signed(xr_26);
  wire signed [6:0] pr_27_0 = w_27_0 ? $signed(xr_27) : -$signed(xr_27);
  wire signed [6:0] pr_28_0 = w_28_0 ? $signed(xr_28) : -$signed(xr_28);
  wire signed [6:0] pr_29_0 = w_29_0 ? $signed(xr_29) : -$signed(xr_29);
  wire signed [6:0] pr_30_0 = w_30_0 ? $signed(xr_30) : -$signed(xr_30);
  wire signed [6:0] pr_31_0 = w_31_0 ? $signed(xr_31) : -$signed(xr_31);
  wire signed [6:0] pr_32_0 = w_32_0 ? $signed(xr_32) : -$signed(xr_32);
  wire signed [6:0] pr_33_0 = w_33_0 ? $signed(xr_33) : -$signed(xr_33);
  wire signed [6:0] pr_34_0 = w_34_0 ? $signed(xr_34) : -$signed(xr_34);
  wire signed [6:0] pr_35_0 = w_35_0 ? $signed(xr_35) : -$signed(xr_35);
  wire signed [6:0] pr_36_0 = w_36_0 ? $signed(xr_36) : -$signed(xr_36);
  wire signed [6:0] pr_37_0 = w_37_0 ? $signed(xr_37) : -$signed(xr_37);
  wire signed [6:0] pr_38_0 = w_38_0 ? $signed(xr_38) : -$signed(xr_38);
  wire signed [6:0] pr_39_0 = w_39_0 ? $signed(xr_39) : -$signed(xr_39);
  wire signed [6:0] pr_40_0 = w_40_0 ? $signed(xr_40) : -$signed(xr_40);
  wire signed [6:0] pr_41_0 = w_41_0 ? $signed(xr_41) : -$signed(xr_41);
  wire signed [6:0] pr_42_0 = w_42_0 ? $signed(xr_42) : -$signed(xr_42);
  wire signed [6:0] pr_43_0 = w_43_0 ? $signed(xr_43) : -$signed(xr_43);
  wire signed [6:0] pr_44_0 = w_44_0 ? $signed(xr_44) : -$signed(xr_44);
  wire signed [6:0] pr_45_0 = w_45_0 ? $signed(xr_45) : -$signed(xr_45);
  wire signed [6:0] pr_46_0 = w_46_0 ? $signed(xr_46) : -$signed(xr_46);
  wire signed [6:0] pr_47_0 = w_47_0 ? $signed(xr_47) : -$signed(xr_47);
  wire signed [6:0] pr_48_0 = w_48_0 ? $signed(xr_48) : -$signed(xr_48);
  wire signed [6:0] pr_49_0 = w_49_0 ? $signed(xr_49) : -$signed(xr_49);
  wire signed [6:0] pr_50_0 = w_50_0 ? $signed(xr_50) : -$signed(xr_50);
  wire signed [6:0] pr_51_0 = w_51_0 ? $signed(xr_51) : -$signed(xr_51);
  wire signed [6:0] pr_52_0 = w_52_0 ? $signed(xr_52) : -$signed(xr_52);
  wire signed [6:0] pr_53_0 = w_53_0 ? $signed(xr_53) : -$signed(xr_53);
  wire signed [6:0] pr_54_0 = w_54_0 ? $signed(xr_54) : -$signed(xr_54);
  wire signed [6:0] pr_55_0 = w_55_0 ? $signed(xr_55) : -$signed(xr_55);
  wire signed [6:0] pr_56_0 = w_56_0 ? $signed(xr_56) : -$signed(xr_56);
  wire signed [6:0] pr_57_0 = w_57_0 ? $signed(xr_57) : -$signed(xr_57);
  wire signed [6:0] pr_58_0 = w_58_0 ? $signed(xr_58) : -$signed(xr_58);
  wire signed [6:0] pr_59_0 = w_59_0 ? $signed(xr_59) : -$signed(xr_59);
  wire signed [6:0] pr_60_0 = w_60_0 ? $signed(xr_60) : -$signed(xr_60);
  wire signed [6:0] pr_61_0 = w_61_0 ? $signed(xr_61) : -$signed(xr_61);
  wire signed [6:0] pr_62_0 = w_62_0 ? $signed(xr_62) : -$signed(xr_62);
  wire signed [6:0] pr_63_0 = w_63_0 ? $signed(xr_63) : -$signed(xr_63);
  wire signed [7:0] t0_l0_0;
  assign t0_l0_0 = $signed(pr_0_0) + $signed(pr_1_0);
  wire signed [7:0] t0_l0_1;
  assign t0_l0_1 = $signed(pr_2_0) + $signed(pr_3_0);
  wire signed [7:0] t0_l0_2;
  assign t0_l0_2 = $signed(pr_4_0) + $signed(pr_5_0);
  wire signed [7:0] t0_l0_3;
  assign t0_l0_3 = $signed(pr_6_0) + $signed(pr_7_0);
  wire signed [7:0] t0_l0_4;
  assign t0_l0_4 = $signed(pr_8_0) + $signed(pr_9_0);
  wire signed [7:0] t0_l0_5;
  assign t0_l0_5 = $signed(pr_10_0) + $signed(pr_11_0);
  wire signed [7:0] t0_l0_6;
  assign t0_l0_6 = $signed(pr_12_0) + $signed(pr_13_0);
  wire signed [7:0] t0_l0_7;
  assign t0_l0_7 = $signed(pr_14_0) + $signed(pr_15_0);
  wire signed [7:0] t0_l0_8;
  assign t0_l0_8 = $signed(pr_16_0) + $signed(pr_17_0);
  wire signed [7:0] t0_l0_9;
  assign t0_l0_9 = $signed(pr_18_0) + $signed(pr_19_0);
  wire signed [7:0] t0_l0_10;
  assign t0_l0_10 = $signed(pr_20_0) + $signed(pr_21_0);
  wire signed [7:0] t0_l0_11;
  assign t0_l0_11 = $signed(pr_22_0) + $signed(pr_23_0);
  wire signed [7:0] t0_l0_12;
  assign t0_l0_12 = $signed(pr_24_0) + $signed(pr_25_0);
  wire signed [7:0] t0_l0_13;
  assign t0_l0_13 = $signed(pr_26_0) + $signed(pr_27_0);
  wire signed [7:0] t0_l0_14;
  assign t0_l0_14 = $signed(pr_28_0) + $signed(pr_29_0);
  wire signed [7:0] t0_l0_15;
  assign t0_l0_15 = $signed(pr_30_0) + $signed(pr_31_0);
  wire signed [7:0] t0_l0_16;
  assign t0_l0_16 = $signed(pr_32_0) + $signed(pr_33_0);
  wire signed [7:0] t0_l0_17;
  assign t0_l0_17 = $signed(pr_34_0) + $signed(pr_35_0);
  wire signed [7:0] t0_l0_18;
  assign t0_l0_18 = $signed(pr_36_0) + $signed(pr_37_0);
  wire signed [7:0] t0_l0_19;
  assign t0_l0_19 = $signed(pr_38_0) + $signed(pr_39_0);
  wire signed [7:0] t0_l0_20;
  assign t0_l0_20 = $signed(pr_40_0) + $signed(pr_41_0);
  wire signed [7:0] t0_l0_21;
  assign t0_l0_21 = $signed(pr_42_0) + $signed(pr_43_0);
  wire signed [7:0] t0_l0_22;
  assign t0_l0_22 = $signed(pr_44_0) + $signed(pr_45_0);
  wire signed [7:0] t0_l0_23;
  assign t0_l0_23 = $signed(pr_46_0) + $signed(pr_47_0);
  wire signed [7:0] t0_l0_24;
  assign t0_l0_24 = $signed(pr_48_0) + $signed(pr_49_0);
  wire signed [7:0] t0_l0_25;
  assign t0_l0_25 = $signed(pr_50_0) + $signed(pr_51_0);
  wire signed [7:0] t0_l0_26;
  assign t0_l0_26 = $signed(pr_52_0) + $signed(pr_53_0);
  wire signed [7:0] t0_l0_27;
  assign t0_l0_27 = $signed(pr_54_0) + $signed(pr_55_0);
  wire signed [7:0] t0_l0_28;
  assign t0_l0_28 = $signed(pr_56_0) + $signed(pr_57_0);
  wire signed [7:0] t0_l0_29;
  assign t0_l0_29 = $signed(pr_58_0) + $signed(pr_59_0);
  wire signed [7:0] t0_l0_30;
  assign t0_l0_30 = $signed(pr_60_0) + $signed(pr_61_0);
  wire signed [7:0] t0_l0_31;
  assign t0_l0_31 = $signed(pr_62_0) + $signed(pr_63_0);
  wire signed [8:0] t0_l1_0;
  assign t0_l1_0 = $signed(t0_l0_0) + $signed(t0_l0_1);
  wire signed [8:0] t0_l1_1;
  assign t0_l1_1 = $signed(t0_l0_2) + $signed(t0_l0_3);
  wire signed [8:0] t0_l1_2;
  assign t0_l1_2 = $signed(t0_l0_4) + $signed(t0_l0_5);
  wire signed [8:0] t0_l1_3;
  assign t0_l1_3 = $signed(t0_l0_6) + $signed(t0_l0_7);
  wire signed [8:0] t0_l1_4;
  assign t0_l1_4 = $signed(t0_l0_8) + $signed(t0_l0_9);
  wire signed [8:0] t0_l1_5;
  assign t0_l1_5 = $signed(t0_l0_10) + $signed(t0_l0_11);
  wire signed [8:0] t0_l1_6;
  assign t0_l1_6 = $signed(t0_l0_12) + $signed(t0_l0_13);
  wire signed [8:0] t0_l1_7;
  assign t0_l1_7 = $signed(t0_l0_14) + $signed(t0_l0_15);
  wire signed [8:0] t0_l1_8;
  assign t0_l1_8 = $signed(t0_l0_16) + $signed(t0_l0_17);
  wire signed [8:0] t0_l1_9;
  assign t0_l1_9 = $signed(t0_l0_18) + $signed(t0_l0_19);
  wire signed [8:0] t0_l1_10;
  assign t0_l1_10 = $signed(t0_l0_20) + $signed(t0_l0_21);
  wire signed [8:0] t0_l1_11;
  assign t0_l1_11 = $signed(t0_l0_22) + $signed(t0_l0_23);
  wire signed [8:0] t0_l1_12;
  assign t0_l1_12 = $signed(t0_l0_24) + $signed(t0_l0_25);
  wire signed [8:0] t0_l1_13;
  assign t0_l1_13 = $signed(t0_l0_26) + $signed(t0_l0_27);
  wire signed [8:0] t0_l1_14;
  assign t0_l1_14 = $signed(t0_l0_28) + $signed(t0_l0_29);
  wire signed [8:0] t0_l1_15;
  assign t0_l1_15 = $signed(t0_l0_30) + $signed(t0_l0_31);
  wire signed [9:0] t0_l2_0;
  assign t0_l2_0 = $signed(t0_l1_0) + $signed(t0_l1_1);
  wire signed [9:0] t0_l2_1;
  assign t0_l2_1 = $signed(t0_l1_2) + $signed(t0_l1_3);
  wire signed [9:0] t0_l2_2;
  assign t0_l2_2 = $signed(t0_l1_4) + $signed(t0_l1_5);
  wire signed [9:0] t0_l2_3;
  assign t0_l2_3 = $signed(t0_l1_6) + $signed(t0_l1_7);
  wire signed [9:0] t0_l2_4;
  assign t0_l2_4 = $signed(t0_l1_8) + $signed(t0_l1_9);
  wire signed [9:0] t0_l2_5;
  assign t0_l2_5 = $signed(t0_l1_10) + $signed(t0_l1_11);
  wire signed [9:0] t0_l2_6;
  assign t0_l2_6 = $signed(t0_l1_12) + $signed(t0_l1_13);
  wire signed [9:0] t0_l2_7;
  assign t0_l2_7 = $signed(t0_l1_14) + $signed(t0_l1_15);
  reg signed [9:0] t0_l2_0_r;
  reg signed [9:0] t0_l2_1_r;
  reg signed [9:0] t0_l2_2_r;
  reg signed [9:0] t0_l2_3_r;
  reg signed [9:0] t0_l2_4_r;
  reg signed [9:0] t0_l2_5_r;
  reg signed [9:0] t0_l2_6_r;
  reg signed [9:0] t0_l2_7_r;
  wire signed [10:0] t0_l3_0;
  assign t0_l3_0 = $signed(t0_l2_0_r) + $signed(t0_l2_1_r);
  wire signed [10:0] t0_l3_1;
  assign t0_l3_1 = $signed(t0_l2_2_r) + $signed(t0_l2_3_r);
  wire signed [10:0] t0_l3_2;
  assign t0_l3_2 = $signed(t0_l2_4_r) + $signed(t0_l2_5_r);
  wire signed [10:0] t0_l3_3;
  assign t0_l3_3 = $signed(t0_l2_6_r) + $signed(t0_l2_7_r);
  wire signed [11:0] t0_l4_0;
  assign t0_l4_0 = $signed(t0_l3_0) + $signed(t0_l3_1);
  wire signed [11:0] t0_l4_1;
  assign t0_l4_1 = $signed(t0_l3_2) + $signed(t0_l3_3);
  wire signed [12:0] t0_l5_0;
  assign t0_l5_0 = $signed(t0_l4_0) + $signed(t0_l4_1);
  reg signed [12:0] yo_0;
  assign y_0 = yo_0;
  wire signed [6:0] pr_0_1 = w_0_1 ? $signed(xr_0) : -$signed(xr_0);
  wire signed [6:0] pr_1_1 = w_1_1 ? $signed(xr_1) : -$signed(xr_1);
  wire signed [6:0] pr_2_1 = w_2_1 ? $signed(xr_2) : -$signed(xr_2);
  wire signed [6:0] pr_3_1 = w_3_1 ? $signed(xr_3) : -$signed(xr_3);
  wire signed [6:0] pr_4_1 = w_4_1 ? $signed(xr_4) : -$signed(xr_4);
  wire signed [6:0] pr_5_1 = w_5_1 ? $signed(xr_5) : -$signed(xr_5);
  wire signed [6:0] pr_6_1 = w_6_1 ? $signed(xr_6) : -$signed(xr_6);
  wire signed [6:0] pr_7_1 = w_7_1 ? $signed(xr_7) : -$signed(xr_7);
  wire signed [6:0] pr_8_1 = w_8_1 ? $signed(xr_8) : -$signed(xr_8);
  wire signed [6:0] pr_9_1 = w_9_1 ? $signed(xr_9) : -$signed(xr_9);
  wire signed [6:0] pr_10_1 = w_10_1 ? $signed(xr_10) : -$signed(xr_10);
  wire signed [6:0] pr_11_1 = w_11_1 ? $signed(xr_11) : -$signed(xr_11);
  wire signed [6:0] pr_12_1 = w_12_1 ? $signed(xr_12) : -$signed(xr_12);
  wire signed [6:0] pr_13_1 = w_13_1 ? $signed(xr_13) : -$signed(xr_13);
  wire signed [6:0] pr_14_1 = w_14_1 ? $signed(xr_14) : -$signed(xr_14);
  wire signed [6:0] pr_15_1 = w_15_1 ? $signed(xr_15) : -$signed(xr_15);
  wire signed [6:0] pr_16_1 = w_16_1 ? $signed(xr_16) : -$signed(xr_16);
  wire signed [6:0] pr_17_1 = w_17_1 ? $signed(xr_17) : -$signed(xr_17);
  wire signed [6:0] pr_18_1 = w_18_1 ? $signed(xr_18) : -$signed(xr_18);
  wire signed [6:0] pr_19_1 = w_19_1 ? $signed(xr_19) : -$signed(xr_19);
  wire signed [6:0] pr_20_1 = w_20_1 ? $signed(xr_20) : -$signed(xr_20);
  wire signed [6:0] pr_21_1 = w_21_1 ? $signed(xr_21) : -$signed(xr_21);
  wire signed [6:0] pr_22_1 = w_22_1 ? $signed(xr_22) : -$signed(xr_22);
  wire signed [6:0] pr_23_1 = w_23_1 ? $signed(xr_23) : -$signed(xr_23);
  wire signed [6:0] pr_24_1 = w_24_1 ? $signed(xr_24) : -$signed(xr_24);
  wire signed [6:0] pr_25_1 = w_25_1 ? $signed(xr_25) : -$signed(xr_25);
  wire signed [6:0] pr_26_1 = w_26_1 ? $signed(xr_26) : -$signed(xr_26);
  wire signed [6:0] pr_27_1 = w_27_1 ? $signed(xr_27) : -$signed(xr_27);
  wire signed [6:0] pr_28_1 = w_28_1 ? $signed(xr_28) : -$signed(xr_28);
  wire signed [6:0] pr_29_1 = w_29_1 ? $signed(xr_29) : -$signed(xr_29);
  wire signed [6:0] pr_30_1 = w_30_1 ? $signed(xr_30) : -$signed(xr_30);
  wire signed [6:0] pr_31_1 = w_31_1 ? $signed(xr_31) : -$signed(xr_31);
  wire signed [6:0] pr_32_1 = w_32_1 ? $signed(xr_32) : -$signed(xr_32);
  wire signed [6:0] pr_33_1 = w_33_1 ? $signed(xr_33) : -$signed(xr_33);
  wire signed [6:0] pr_34_1 = w_34_1 ? $signed(xr_34) : -$signed(xr_34);
  wire signed [6:0] pr_35_1 = w_35_1 ? $signed(xr_35) : -$signed(xr_35);
  wire signed [6:0] pr_36_1 = w_36_1 ? $signed(xr_36) : -$signed(xr_36);
  wire signed [6:0] pr_37_1 = w_37_1 ? $signed(xr_37) : -$signed(xr_37);
  wire signed [6:0] pr_38_1 = w_38_1 ? $signed(xr_38) : -$signed(xr_38);
  wire signed [6:0] pr_39_1 = w_39_1 ? $signed(xr_39) : -$signed(xr_39);
  wire signed [6:0] pr_40_1 = w_40_1 ? $signed(xr_40) : -$signed(xr_40);
  wire signed [6:0] pr_41_1 = w_41_1 ? $signed(xr_41) : -$signed(xr_41);
  wire signed [6:0] pr_42_1 = w_42_1 ? $signed(xr_42) : -$signed(xr_42);
  wire signed [6:0] pr_43_1 = w_43_1 ? $signed(xr_43) : -$signed(xr_43);
  wire signed [6:0] pr_44_1 = w_44_1 ? $signed(xr_44) : -$signed(xr_44);
  wire signed [6:0] pr_45_1 = w_45_1 ? $signed(xr_45) : -$signed(xr_45);
  wire signed [6:0] pr_46_1 = w_46_1 ? $signed(xr_46) : -$signed(xr_46);
  wire signed [6:0] pr_47_1 = w_47_1 ? $signed(xr_47) : -$signed(xr_47);
  wire signed [6:0] pr_48_1 = w_48_1 ? $signed(xr_48) : -$signed(xr_48);
  wire signed [6:0] pr_49_1 = w_49_1 ? $signed(xr_49) : -$signed(xr_49);
  wire signed [6:0] pr_50_1 = w_50_1 ? $signed(xr_50) : -$signed(xr_50);
  wire signed [6:0] pr_51_1 = w_51_1 ? $signed(xr_51) : -$signed(xr_51);
  wire signed [6:0] pr_52_1 = w_52_1 ? $signed(xr_52) : -$signed(xr_52);
  wire signed [6:0] pr_53_1 = w_53_1 ? $signed(xr_53) : -$signed(xr_53);
  wire signed [6:0] pr_54_1 = w_54_1 ? $signed(xr_54) : -$signed(xr_54);
  wire signed [6:0] pr_55_1 = w_55_1 ? $signed(xr_55) : -$signed(xr_55);
  wire signed [6:0] pr_56_1 = w_56_1 ? $signed(xr_56) : -$signed(xr_56);
  wire signed [6:0] pr_57_1 = w_57_1 ? $signed(xr_57) : -$signed(xr_57);
  wire signed [6:0] pr_58_1 = w_58_1 ? $signed(xr_58) : -$signed(xr_58);
  wire signed [6:0] pr_59_1 = w_59_1 ? $signed(xr_59) : -$signed(xr_59);
  wire signed [6:0] pr_60_1 = w_60_1 ? $signed(xr_60) : -$signed(xr_60);
  wire signed [6:0] pr_61_1 = w_61_1 ? $signed(xr_61) : -$signed(xr_61);
  wire signed [6:0] pr_62_1 = w_62_1 ? $signed(xr_62) : -$signed(xr_62);
  wire signed [6:0] pr_63_1 = w_63_1 ? $signed(xr_63) : -$signed(xr_63);
  wire signed [7:0] t1_l0_0;
  assign t1_l0_0 = $signed(pr_0_1) + $signed(pr_1_1);
  wire signed [7:0] t1_l0_1;
  assign t1_l0_1 = $signed(pr_2_1) + $signed(pr_3_1);
  wire signed [7:0] t1_l0_2;
  assign t1_l0_2 = $signed(pr_4_1) + $signed(pr_5_1);
  wire signed [7:0] t1_l0_3;
  assign t1_l0_3 = $signed(pr_6_1) + $signed(pr_7_1);
  wire signed [7:0] t1_l0_4;
  assign t1_l0_4 = $signed(pr_8_1) + $signed(pr_9_1);
  wire signed [7:0] t1_l0_5;
  assign t1_l0_5 = $signed(pr_10_1) + $signed(pr_11_1);
  wire signed [7:0] t1_l0_6;
  assign t1_l0_6 = $signed(pr_12_1) + $signed(pr_13_1);
  wire signed [7:0] t1_l0_7;
  assign t1_l0_7 = $signed(pr_14_1) + $signed(pr_15_1);
  wire signed [7:0] t1_l0_8;
  assign t1_l0_8 = $signed(pr_16_1) + $signed(pr_17_1);
  wire signed [7:0] t1_l0_9;
  assign t1_l0_9 = $signed(pr_18_1) + $signed(pr_19_1);
  wire signed [7:0] t1_l0_10;
  assign t1_l0_10 = $signed(pr_20_1) + $signed(pr_21_1);
  wire signed [7:0] t1_l0_11;
  assign t1_l0_11 = $signed(pr_22_1) + $signed(pr_23_1);
  wire signed [7:0] t1_l0_12;
  assign t1_l0_12 = $signed(pr_24_1) + $signed(pr_25_1);
  wire signed [7:0] t1_l0_13;
  assign t1_l0_13 = $signed(pr_26_1) + $signed(pr_27_1);
  wire signed [7:0] t1_l0_14;
  assign t1_l0_14 = $signed(pr_28_1) + $signed(pr_29_1);
  wire signed [7:0] t1_l0_15;
  assign t1_l0_15 = $signed(pr_30_1) + $signed(pr_31_1);
  wire signed [7:0] t1_l0_16;
  assign t1_l0_16 = $signed(pr_32_1) + $signed(pr_33_1);
  wire signed [7:0] t1_l0_17;
  assign t1_l0_17 = $signed(pr_34_1) + $signed(pr_35_1);
  wire signed [7:0] t1_l0_18;
  assign t1_l0_18 = $signed(pr_36_1) + $signed(pr_37_1);
  wire signed [7:0] t1_l0_19;
  assign t1_l0_19 = $signed(pr_38_1) + $signed(pr_39_1);
  wire signed [7:0] t1_l0_20;
  assign t1_l0_20 = $signed(pr_40_1) + $signed(pr_41_1);
  wire signed [7:0] t1_l0_21;
  assign t1_l0_21 = $signed(pr_42_1) + $signed(pr_43_1);
  wire signed [7:0] t1_l0_22;
  assign t1_l0_22 = $signed(pr_44_1) + $signed(pr_45_1);
  wire signed [7:0] t1_l0_23;
  assign t1_l0_23 = $signed(pr_46_1) + $signed(pr_47_1);
  wire signed [7:0] t1_l0_24;
  assign t1_l0_24 = $signed(pr_48_1) + $signed(pr_49_1);
  wire signed [7:0] t1_l0_25;
  assign t1_l0_25 = $signed(pr_50_1) + $signed(pr_51_1);
  wire signed [7:0] t1_l0_26;
  assign t1_l0_26 = $signed(pr_52_1) + $signed(pr_53_1);
  wire signed [7:0] t1_l0_27;
  assign t1_l0_27 = $signed(pr_54_1) + $signed(pr_55_1);
  wire signed [7:0] t1_l0_28;
  assign t1_l0_28 = $signed(pr_56_1) + $signed(pr_57_1);
  wire signed [7:0] t1_l0_29;
  assign t1_l0_29 = $signed(pr_58_1) + $signed(pr_59_1);
  wire signed [7:0] t1_l0_30;
  assign t1_l0_30 = $signed(pr_60_1) + $signed(pr_61_1);
  wire signed [7:0] t1_l0_31;
  assign t1_l0_31 = $signed(pr_62_1) + $signed(pr_63_1);
  wire signed [8:0] t1_l1_0;
  assign t1_l1_0 = $signed(t1_l0_0) + $signed(t1_l0_1);
  wire signed [8:0] t1_l1_1;
  assign t1_l1_1 = $signed(t1_l0_2) + $signed(t1_l0_3);
  wire signed [8:0] t1_l1_2;
  assign t1_l1_2 = $signed(t1_l0_4) + $signed(t1_l0_5);
  wire signed [8:0] t1_l1_3;
  assign t1_l1_3 = $signed(t1_l0_6) + $signed(t1_l0_7);
  wire signed [8:0] t1_l1_4;
  assign t1_l1_4 = $signed(t1_l0_8) + $signed(t1_l0_9);
  wire signed [8:0] t1_l1_5;
  assign t1_l1_5 = $signed(t1_l0_10) + $signed(t1_l0_11);
  wire signed [8:0] t1_l1_6;
  assign t1_l1_6 = $signed(t1_l0_12) + $signed(t1_l0_13);
  wire signed [8:0] t1_l1_7;
  assign t1_l1_7 = $signed(t1_l0_14) + $signed(t1_l0_15);
  wire signed [8:0] t1_l1_8;
  assign t1_l1_8 = $signed(t1_l0_16) + $signed(t1_l0_17);
  wire signed [8:0] t1_l1_9;
  assign t1_l1_9 = $signed(t1_l0_18) + $signed(t1_l0_19);
  wire signed [8:0] t1_l1_10;
  assign t1_l1_10 = $signed(t1_l0_20) + $signed(t1_l0_21);
  wire signed [8:0] t1_l1_11;
  assign t1_l1_11 = $signed(t1_l0_22) + $signed(t1_l0_23);
  wire signed [8:0] t1_l1_12;
  assign t1_l1_12 = $signed(t1_l0_24) + $signed(t1_l0_25);
  wire signed [8:0] t1_l1_13;
  assign t1_l1_13 = $signed(t1_l0_26) + $signed(t1_l0_27);
  wire signed [8:0] t1_l1_14;
  assign t1_l1_14 = $signed(t1_l0_28) + $signed(t1_l0_29);
  wire signed [8:0] t1_l1_15;
  assign t1_l1_15 = $signed(t1_l0_30) + $signed(t1_l0_31);
  wire signed [9:0] t1_l2_0;
  assign t1_l2_0 = $signed(t1_l1_0) + $signed(t1_l1_1);
  wire signed [9:0] t1_l2_1;
  assign t1_l2_1 = $signed(t1_l1_2) + $signed(t1_l1_3);
  wire signed [9:0] t1_l2_2;
  assign t1_l2_2 = $signed(t1_l1_4) + $signed(t1_l1_5);
  wire signed [9:0] t1_l2_3;
  assign t1_l2_3 = $signed(t1_l1_6) + $signed(t1_l1_7);
  wire signed [9:0] t1_l2_4;
  assign t1_l2_4 = $signed(t1_l1_8) + $signed(t1_l1_9);
  wire signed [9:0] t1_l2_5;
  assign t1_l2_5 = $signed(t1_l1_10) + $signed(t1_l1_11);
  wire signed [9:0] t1_l2_6;
  assign t1_l2_6 = $signed(t1_l1_12) + $signed(t1_l1_13);
  wire signed [9:0] t1_l2_7;
  assign t1_l2_7 = $signed(t1_l1_14) + $signed(t1_l1_15);
  reg signed [9:0] t1_l2_0_r;
  reg signed [9:0] t1_l2_1_r;
  reg signed [9:0] t1_l2_2_r;
  reg signed [9:0] t1_l2_3_r;
  reg signed [9:0] t1_l2_4_r;
  reg signed [9:0] t1_l2_5_r;
  reg signed [9:0] t1_l2_6_r;
  reg signed [9:0] t1_l2_7_r;
  wire signed [10:0] t1_l3_0;
  assign t1_l3_0 = $signed(t1_l2_0_r) + $signed(t1_l2_1_r);
  wire signed [10:0] t1_l3_1;
  assign t1_l3_1 = $signed(t1_l2_2_r) + $signed(t1_l2_3_r);
  wire signed [10:0] t1_l3_2;
  assign t1_l3_2 = $signed(t1_l2_4_r) + $signed(t1_l2_5_r);
  wire signed [10:0] t1_l3_3;
  assign t1_l3_3 = $signed(t1_l2_6_r) + $signed(t1_l2_7_r);
  wire signed [11:0] t1_l4_0;
  assign t1_l4_0 = $signed(t1_l3_0) + $signed(t1_l3_1);
  wire signed [11:0] t1_l4_1;
  assign t1_l4_1 = $signed(t1_l3_2) + $signed(t1_l3_3);
  wire signed [12:0] t1_l5_0;
  assign t1_l5_0 = $signed(t1_l4_0) + $signed(t1_l4_1);
  reg signed [12:0] yo_1;
  assign y_1 = yo_1;
  always @(posedge clk) begin
    xr_0 <= x_0;
    xr_1 <= x_1;
    xr_2 <= x_2;
    xr_3 <= x_3;
    xr_4 <= x_4;
    xr_5 <= x_5;
    xr_6 <= x_6;
    xr_7 <= x_7;
    xr_8 <= x_8;
    xr_9 <= x_9;
    xr_10 <= x_10;
    xr_11 <= x_11;
    xr_12 <= x_12;
    xr_13 <= x_13;
    xr_14 <= x_14;
    xr_15 <= x_15;
    xr_16 <= x_16;
    xr_17 <= x_17;
    xr_18 <= x_18;
    xr_19 <= x_19;
    xr_20 <= x_20;
    xr_21 <= x_21;
    xr_22 <= x_22;
    xr_23 <= x_23;
    xr_24 <= x_24;
    xr_25 <= x_25;
    xr_26 <= x_26;
    xr_27 <= x_27;
    xr_28 <= x_28;
    xr_29 <= x_29;
    xr_30 <= x_30;
    xr_31 <= x_31;
    xr_32 <= x_32;
    xr_33 <= x_33;
    xr_34 <= x_34;
    xr_35 <= x_35;
    xr_36 <= x_36;
    xr_37 <= x_37;
    xr_38 <= x_38;
    xr_39 <= x_39;
    xr_40 <= x_40;
    xr_41 <= x_41;
    xr_42 <= x_42;
    xr_43 <= x_43;
    xr_44 <= x_44;
    xr_45 <= x_45;
    xr_46 <= x_46;
    xr_47 <= x_47;
    xr_48 <= x_48;
    xr_49 <= x_49;
    xr_50 <= x_50;
    xr_51 <= x_51;
    xr_52 <= x_52;
    xr_53 <= x_53;
    xr_54 <= x_54;
    xr_55 <= x_55;
    xr_56 <= x_56;
    xr_57 <= x_57;
    xr_58 <= x_58;
    xr_59 <= x_59;
    xr_60 <= x_60;
    xr_61 <= x_61;
    xr_62 <= x_62;
    xr_63 <= x_63;
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