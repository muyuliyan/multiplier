/*a 32 bit booth wallace tree multiplier*/

module multipiler(
    input mul_clk,
    input resetn,
    input mul_signed,
    input [31:0]x,
    input [31:0]y,
    output [63:0]result
);

reg [32:0]x_r;
reg [32:0]y_r;
reg mul_signed_buffer;

wire [2:0]code_0, code_1, code_2, code_3, code_4, code_5, code_6,
code_7, code_8, code_9, code_10, code_11, code_12, code_13, code_14,
code_15, code_16;
wire [65:0]partial_0, partial_1, partial_2, partial_3, partial_4,
partial_5, partial_6, partial_7, partial_8, partial_9, partial_10,
partial_11, partial_12, partial_13, partial_14, partial_15, partial_16;
wire zero_0, one_0, two_0, neg1_0, neg2_0;
wire zero_1, one_1, two_1, neg1_1, neg2_1;
wire zero_2, one_2, two_2, neg1_2, neg2_2;
wire zero_3, one_3, two_3, neg1_3, neg2_3;
wire zero_4, one_4, two_4, neg1_4, neg2_4;
wire zero_5, one_5, two_5, neg1_5, neg2_5;
wire zero_6, one_6, two_6, neg1_6, neg2_6;
wire zero_7, one_7, two_7, neg1_7, neg2_7;
wire zero_8, one_8, two_8, neg1_8, neg2_8;
wire zero_9, one_9, two_9, neg1_9, neg2_9;
wire zero_10, one_10, two_10, neg1_10, neg2_10;
wire zero_11, one_11, two_11, neg1_11, neg2_11;
wire zero_12, one_12, two_12, neg1_12, neg2_12;
wire zero_13, one_13, two_13, neg1_13, neg2_13;
wire zero_14, one_14, two_14, neg1_14, neg2_14;
wire zero_15, one_15, two_15, neg1_15, neg2_15;
wire zero_16, one_16, two_16, neg1_16, neg2_16;

always @(posedge mul_clk) begin
    if (resetn) begin
        mul_signed_buffer <= 1'b0;
        x_r <= 33'b0;
        y_r <= 33'b0;
    end
    else if (mul_signed) begin
        mul_signed_buffer <= mul_signed;
        x_r <= {x[31], x[31:0]};
        y_r <= {y[31], y[31:0]};
    end
    else if (~mul_signed) begin
        mul_signed_buffer <= mul_signed;
        x_r <= {1'b0, x[31:0]};
        y_r <= {1'b0, y[31:0]};
    end
    else begin
        mul_signed_buffer <= 1'b0;
        x_r <= 33'b0;
        y_r <= 33'b0;
    end
end

assign code_0 = {y_r[1:0], 1'b0};
assign code_1 = y_r[3:1];
assign code_2 = y_r[5:3];
assign code_3 = y_r[7:5];
assign code_4 = y_r[9:7];
assign code_5 = y_r[11:9];
assign code_6 = y_r[13:11];
assign code_7 = y_r[15:13];
assign code_8 = y_r[17:15];
assign code_9 = y_r[19:17];
assign code_10 = y_r[21:19];
assign code_11 = y_r[23:21];
assign code_12 = y_r[25:23];
assign code_13 = y_r[27:25];
assign code_14 = y_r[29:27];
assign code_15 = y_r[31:29];
assign code_16 = y_r[33:31];

always @(posedge mul_clk) begin
    //Booth编码
    BoothEncoder BoothEncoder_inst0(
        .code(code_0),
        .zero(zero_0),
        .one(one_0),
        .two(two_0),
        .neg1(neg1_0),
        .neg2(neg2_0),
    );

    BoothEncoder BoothEncoder_inst1(
        .code(code_1),
        .zero(zero_1),
        .one(one_1),
        .two(two_1),
        .neg1(neg1_1),
        .neg2(neg2_1),
    );

    BoothEncoder BoothEncoder_inst2(
        .code(code_2),
        .zero(zero_2),
        .one(one_2),
        .two(two_2),
        .neg1(neg1_2),
        .neg2(neg2_2),
    );

    BoothEncoder BoothEncoder_inst3(
        .code(code_3),
        .zero(zero_3),
        .one(one_3),
        .two(two_3),
        .neg1(neg1_3),
        .neg2(neg2_3),
    );

    BoothEncoder BoothEncoder_inst4(
        .code(code_4),
        .zero(zero_4),
        .one(one_4),
        .two(two_4),
        .neg1(neg1_4),
        .neg2(neg2_4),
    );

    BoothEncoder BoothEncoder_inst5(
        .code(code_5),
        .zero(zero_5),
        .one(one_5),
        .two(two_5),
        .neg1(neg1_5),
        .neg2(neg2_5),
    );

    BoothEncoder BoothEncoder_inst6(
        .code(code_6),
        .zero(zero_6),
        .one(one_6),
        .two(two_6),
        .neg1(neg1_6),
        .neg2(neg2_6),
    );

    BoothEncoder BoothEncoder_inst7(
        .code(code_7),
        .zero(zero_7),
        .one(one_7),
        .two(two_7),
        .neg1(neg1_7),
        .neg2(neg2_7),
    );

    BoothEncoder BoothEncoder_inst8(
        .code(code_8),
        .zero(zero_8),
        .one(one_8),
        .two(two_8),
        .neg1(neg1_8),
        .neg2(neg2_8),
    );

    BoothEncoder BoothEncoder_inst9(
        .code(code_9),
        .zero(zero_9),
        .one(one_9),
        .two(two_9),
        .neg1(neg1_9),
        .neg2(neg2_9),
    );

    BoothEncoder BoothEncoder_inst10(
        .code(code_10),
        .zero(zero_10),
        .one(one_10),
        .two(two_10),
        .neg1(neg1_10),
        .neg2(neg2_10),
    );

    BoothEncoder BoothEncoder_inst11(
        .code(code_11),
        .zero(zero_11),
        .one(one_11),
        .two(two_11),
        .neg1(neg1_11),
        .neg2(neg2_11),
    );

    BoothEncoder BoothEncoder_inst12(
        .code(code_12),
        .zero(zero_12),
        .one(one_12),
        .two(two_12),
        .neg1(neg1_12),
        .neg2(neg2_12),
    );

    BoothEncoder BoothEncoder_inst13(
        .code(code_13),
        .zero(zero_13),
        .one(one_13),
        .two(two_13),
        .neg1(neg1_13),
        .neg2(neg2_13),
    );

    BoothEncoder BoothEncoder_inst14(
        .code(code_14),
        .zero(zero_14),
        .one(one_14),
        .two(two_14),
        .neg1(neg1_14),
        .neg2(neg2_14),
    );

    BoothEncoder BoothEncoder_inst15(
        .code(code_15),
        .zero(zero_15),
        .one(one_15),
        .two(two_15),
        .neg1(neg1_15),
        .neg2(neg2_15),
    );

    BoothEncoder BoothEncoder_inst16(
        .code(code_16),
        .zero(zero_16),
        .one(one_16),
        .two(two_16),
        .neg1(neg1_16),
        .neg2(neg2_16),
    );
end

always @(posedge mul_clk) begin
    //部分积
    PartialGen PartialGen_inst0(
        .A(x_r),
        .zero(zero_0),
        .one(one_0),
        .two(two_0),
        .neg1(neg1_0),
        .neg2(neg2_0),
        .partial(partial_0),
    );

    PartialGen PartialGen_inst1(
        .A(x_r),
        .zero(zero_1),
        .one(one_1),
        .two(two_1),
        .neg1(neg1_1),
        .neg2(neg2_1),
        .partial(partial_1),
    );
    
    PartialGen PartialGen_inst2(
        .A(x_r),
        .zero(zero_2),
        .one(one_2),
        .two(two_2),
        .neg1(neg1_2),
        .neg2(neg2_2),
        .partial(partial_2),
    );
    
    PartialGen PartialGen_inst3(
        .A(x_r),
        .zero(zero_3),
        .one(one_3),
        .two(two_3),
        .neg1(neg1_3),
        .neg2(neg2_3),
        .partial(partial_3),
    );

    PartialGen PartialGen_inst4(
        .A(x_r),
        .zero(zero_4),
        .one(one_4),
        .two(two_4),
        .neg1(neg1_4),
        .neg2(neg2_4),
        .partial(partial_4),
    );
    
    PartialGen PartialGen_inst5(
        .A(x_r),
        .zero(zero_5),
        .one(one_5),
        .two(two_5),
        .neg1(neg1_5),
        .neg2(neg2_5),
        .partial(partial_5),
    );

    PartialGen PartialGen_inst6(
        .A(x_r),
        .zero(zero_6),
        .one(one_6),
        .two(two_6),
        .neg1(neg1_6),
        .neg2(neg2_6),
        .partial(partial_6),
    );

    PartialGen PartialGen_inst7(
        .A(x_r),
        .zero(zero_7),
        .one(one_7),
        .two(two_7),
        .neg1(neg1_7),
        .neg2(neg2_7),
        .partial(partial_7),
    );
    
    PartialGen PartialGen_inst8(
        .A(x_r),
        .zero(zero_8),
        .one(one_8),
        .two(two_8),
        .neg1(neg1_8),
        .neg2(neg2_8),
        .partial(partial_8),
    );

    PartialGen PartialGen_inst9(
        .A(x_r),
        .zero(zero_9),
        .one(one_9),
        .two(two_9),
        .neg1(neg1_9),
        .neg2(neg2_9),
        .partial(partial_9),
    );

    PartialGen PartialGen_inst10(
        .A(x_r),
        .zero(zero_10),
        .one(one_10),
        .two(two_10),
        .neg1(neg1_10),
        .neg2(neg2_10),
        .partial(partial_10),
    );
    
    PartialGen PartialGen_inst11(
        .A(x_r),
        .zero(zero_11),
        .one(one_11),
        .two(two_11),
        .neg1(neg1_11),
        .neg2(neg2_11),
        .partial(partial_11),
    );

    PartialGen PartialGen_inst12(
        .A(x_r),
        .zero(zero_12),
        .one(one_12),
        .two(two_12),
        .neg1(neg1_12),
        .neg2(neg2_12),
        .partial(partial_12),
    );
    
    PartialGen PartialGen_inst13(
        .A(x_r),
        .zero(zero_13),
        .one(one_13),
        .two(two_13),
        .neg1(neg1_13),
        .neg2(neg2_13),
        .partial(partial_13),
    );

    PartialGen PartialGen_inst14(
        .A(x_r),
        .zero(zero_14),
        .one(one_14),
        .two(two_14),
        .neg1(neg1_14),
        .neg2(neg2_14),
        .partial(partial_14),
    );

    PartialGen PartialGen_inst15(
        .A(x_r),
        .zero(zero_15),
        .one(one_15),
        .two(two_15),
        .neg1(neg1_15),
        .neg2(neg2_15),
        .partial(partial_15),
    );
    
    PartialGen PartialGen_inst16(
        .A(x_r),
        .zero(zero_16),
        .one(one_16),
        .two(two_16),
        .neg1(neg1_16),
        .neg2(neg2_16),
        .partial(partial_16),
    );
end

always @(posedge) begin
    WallaceTreeAdder WallaceTreeAdder_inst(
        .partial_in0(partial_0),
        .partial_in1(partial_1),
        .partial_in2(partial_2),
        .partial_in3(partial_3),
        .partial_in4(partial_4),
        .partial_in5(partial_5),
        .partial_in6(partial_6),
        .partial_in7(partial_7),
        .partial_in8(partial_8),
        .partial_in9(partial_9),
        .partial_in10(partial_10),
        .partial_in11(partial_11),
        .partial_in12(partial_12),
        .partial_in13(partial_13),
        .partial_in14(partial_14),
        .partial_in15(partial_15),
        .partial_in16(partial_16),
        .product_out(product)
    );
end

assign result = product_out[63:0];

endmodule