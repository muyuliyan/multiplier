//signed num multiplier

module mult_gen_0(
    input CLK,
    input [31:0]A,
    input [31:0]B,
    output [31:0]P,
    input SCLR,
)

reg [31:0] multipiler;
integer i;

always @(*)begin
        P = 0;
        multipiler = B;

        for( i = 0; i < 31; i = i + 1) begin
            if(multiplier[0] == 1) begin
                P = P + (a << i);
            end
            multiplier = multiplier >> 1;
        end
        if(multiplier[0] == 1) begin
            P = P - (a << 31)
        end
    end
endmodule
