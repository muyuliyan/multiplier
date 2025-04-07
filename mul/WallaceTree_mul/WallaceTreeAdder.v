module WallaceTreeAdder (
    input [65:0] partial_in0,
    input [65:0] partial_in1,
    input [65:0] partial_in2,
    input [65:0] partial_in3,
    input [65:0] partial_in4,
    input [65:0] partial_in5,
    input [65:0] partial_in6,
    input [65:0] partial_in7,
    input [65:0] partial_in8,
    input [65:0] partial_in9,
    input [65:0] partial_in10,
    input [65:0] partial_in11,
    input [65:0] partial_in12,
    input [65:0] partial_in13,
    input [65:0] partial_in14,
    input [65:0] partial_in15,
    input [65:0] partial_in16,
    input [65:0] partial_in17,
    output [65:0] product_out
);
localparam CSA_WIDTH = 66;

wire [65:0] partial_shift_0;
wire [65:0] partial_shift_1;
wire [65:0] partial_shift_2;
wire [65:0] partial_shift_3;
wire [65:0] partial_shift_4;
wire [65:0] partial_shift_5;
wire [65:0] partial_shift_6;
wire [65:0] partial_shift_7;
wire [65:0] partial_shift_8;
wire [65:0] partial_shift_9;
wire [65:0] partial_shift_10;
wire [65:0] partial_shift_11;
wire [65:0] partial_shift_12;
wire [65:0] partial_shift_13;
wire [65:0] partial_shift_14;
wire [65:0] partial_shift_15;
wire [65:0] partial_shift_16;
wire [65:0] S_L0_0,C_L0_0;
wire [65:0] S_L0_1,C_L0_1;
wire [65:0] S_L0_2,C_L0_2;
wire [65:0] S_L0_3,C_L0_3;
wire [65:0] S_L0_4,C_L0_4;
wire [65:0] S_L1_5,C_L1_5;
wire [65:0] S_L1_6,C_L1_6;
wire [65:0] S_L1_7,C_L1_7;
wire [65:0] S_L1_8,C_L1_8;
wire [65:0] S_L2_9,C_L2_9;
wire [65:0] S_L2_10,C_L2_10;
wire [65:0] S_L3_11,C_L3_11;
wire [65:0] S_L3_12,C_L3_12;
wire [65:0] S_L4_13,C_L4_13;
wire [65:0] S_L5_14,C_L5_14;
wire [66:0] Sum;

assign partial_shift_0 = partial_in0;
assign partial_shift_1 = partial_in1 << 2;
assign partial_shift_2 = partial_in1 << 4;
assign partial_shift_3 = partial_in1 << 6;
assign partial_shift_4 = partial_in1 << 8;
assign partial_shift_5 = partial_in1 << 10;
assign partial_shift_6 = partial_in1 << 12;
assign partial_shift_7 = partial_in1 << 14;
assign partial_shift_8 = partial_in1 << 16;
assign partial_shift_9 = partial_in1 << 18;
assign partial_shift_10 = partial_in1 << 20;
assign partial_shift_11 = partial_in1 << 22;
assign partial_shift_12 = partial_in1 << 24;
assign partial_shift_13 = partial_in1 << 26;
assign partial_shift_14 = partial_in1 << 28;
assign partial_shift_15 = partial_in1 << 30;
assign partial_shift_16 = partial_in1 << 32;

//CarrySerialAdder
//Level 0
CarrySerialAdder # (
    .WIDTH(CSA_WIDTH)
)CarrySerialAdder_l0_1(
    .op1(partial_shift_4),
    .op2(partial_shift_3),
    .op3(partial_shift_2),
    .S(S_L0_0),
    .C(C_L0_0)
);

CarrySerialAdder # (
    .WIDTH(CSA_WIDTH)
)CarrySerialAdder_l0_1(
    .op1(partial_shift_7),
    .op2(partial_shift_6),
    .op3(partial_shift_5),
    .S(S_L0_1),
    .C(C_L0_1)
);

CarrySerialAdder # (
    .WIDTH(CSA_WIDTH)
)CarrySerialAdder_l0_1(
    .op1(partial_shift_10),
    .op2(partial_shift_9),
    .op3(partial_shift_8),
    .S(S_L0_2),
    .C(C_L0_2)
);

CarrySerialAdder # (
    .WIDTH(CSA_WIDTH)
)CarrySerialAdder_l0_1(
    .op1(partial_shift_13),
    .op2(partial_shift_12),
    .op3(partial_shift_11),
    .S(S_L0_3),
    .C(C_L0_3)
);

CarrySerialAdder # (
    .WIDTH(CSA_WIDTH)
)CarrySerialAdder_l0_1(
    .op1(partial_shift_16),
    .op2(partial_shift_15),
    .op3(partial_shift_14),
    .S(S_L0_4),
    .C(C_L0_4)
);

//Level 1
CarrySerialAdder # (
    .WIDTH(CSA_WIDTH)
)CarrySerialAdder_l0_1(
    .op1(C_L0_2),
    .op2(C_L0_1),
    .op3(C_L0_0),
    .S(S_L1_5),
    .C(C_L1_5)
);

CarrySerialAdder # (
    .WIDTH(CSA_WIDTH)
)CarrySerialAdder_l0_1(
    .op1(partial_shift_0),
    .op2(C_L0_4),
    .op3(C_L0_3),
    .S(S_L1_6),
    .C(C_L1_6)
);

CarrySerialAdder # (
    .WIDTH(CSA_WIDTH)
)CarrySerialAdder_l0_1(
    .op1(S_L0_1),
    .op2(S_L0_0),
    .op3(partial_shift_1),
    .S(S_L1_7),
    .C(C_L1_7)
);

CarrySerialAdder # (
    .WIDTH(CSA_WIDTH)
)CarrySerialAdder_l0_1(
    .op1(S_L0_4),
    .op2(S_L0_3),
    .op3(S_L0_2),
    .S(S_L1_8),
    .C(C_L1_8)
);

//Level 2
CarrySerialAdder # (
    .WIDTH(CSA_WIDTH)
)CarrySerialAdder_l0_1(
    .op1(S_L1_5),
    .op2(C_L1_6),
    .op3(C_L1_5),
    .S(S_L2_9),
    .C(C_L2_9)
);

CarrySerialAdder # (
    .WIDTH(CSA_WIDTH)
)CarrySerialAdder_l0_1(
    .op1(S_L1_8),
    .op2(S_L1_7),
    .op3(S_L1_6),
    .S(S_L2_10),
    .C(C_L2_10)
);

//Level 3
CarrySerialAdder # (
    .WIDTH(CSA_WIDTH)
)CarrySerialAdder_l0_1(
    .op1(C_L2_9),
    .op2(C_L1_8),
    .op3(C_L1_7),
    .S(S_L3_11),
    .C(C_L3_11)
);

CarrySerialAdder # (
    .WIDTH(CSA_WIDTH)
)CarrySerialAdder_l0_1(
    .op1(S_L2_10),
    .op2(S_L2_9),
    .op3(C_L2_10),
    .S(S_L3_12),
    .C(C_L3_12)
);

//Level 4
CarrySerialAdder # (
    .WIDTH(CSA_WIDTH)
)CarrySerialAdder_l0_1(
    .op1(S_L3_12),
    .op2(S_L3_11),
    .op3(C_L3_11),
    .S(S_L4_13),
    .C(C_L4_13)
);

//Level 5
CarrySerialAdder # (
    .WIDTH(CSA_WIDTH)
)CarrySerialAdder_l0_1(
    .op1(S_L4_13),
    .op2(C_L4_13),
    .op3(C_L3_12),
    .S(S_L5_14),
    .C(C_L5_14)
);

//CarryLookHeadAdder
CarryLookHeadAdder CarryLookHeadAdder_inst(
    .A(S_L5_14),
    .B(C_L5_14[64:0], 1'b0),
    .Sum(Sum)
)

assign product_out = Sum[63:0];

endmodule