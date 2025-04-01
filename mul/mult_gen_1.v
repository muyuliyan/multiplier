//unsigned num multipiler

module mult_gen_1(
    input CLK,
    input [31:0] A,
    input [31:0] B,
    output [31:0] P,
    input SCLR,
)

    reg [31:0] multipiler;
    integer i;

    always @(*)begin
        P = 0;
        multipiler = B;

        for( i = 0; i < 32; i = i + 1) begin
            if(multiplier[0] == 1) begin
                P = P + (a << i);
            end

            multiplier = multiplier >> 1;
        end
    end
endmodule
