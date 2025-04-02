//unsigned num multipiler

module mult_gen_1(
    input CLK,
    input mul,
    input [31:0] A,
    input [31:0] B,
    output [31:0] P,
    input SCLR,
)

reg  mul_unsigned_buffer; 
reg  a_31_buffer;
reg  b_31_buffer;
integer i;

always @(posedge CLK) begin 
    if (SCLR) begin 
        mul_unsigned_buffer <= 1'b0;
        a_31_buffer <= 1'b0;
        b_31_buffer <= 1'b0;
    end 
    else if (mul) begin 
        mul_unsigned_buffer <= mul_unsigned;   
        a_31_buffer <= A[31];
        b_31_buffer <= B[31];
    end
end

    always @(posedge CLK)begin
        P <= 32'b0;
        for( i = 0; i < 32; i = i + 1) begin
            if(b_31_buffer[0] == 1) begin
                P = P + (a_31_buffer << i);
            end

            b_31_buffer = b_31_buffer >> 1;
        end
    end
endmodule
