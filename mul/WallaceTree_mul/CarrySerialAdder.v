module CarrySerialAdder# (
    parameter WIDTH = 66
)(
    input [WIDTH-1:0]op1;
    input [WIDTH-1:0]op2;
    input [WIDTH-1:0]op3;
    output [WIDTH-1:0]s;
    output [WIDTH-1:0]C;
);

    genvar i;
    generate
        for (i = 0;i<WIDTH ;i=i+1 ) begin
            FullAdder FullAdder_inst(
                .A(op1[i]),
                .B(op2[i]),
                .C(op3[i]),
                .S(S[i]),
                .Cout(C[i]),
            )
        end
    endgenerate
    
endmodule