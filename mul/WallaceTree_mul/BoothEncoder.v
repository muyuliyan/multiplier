module BoothEncoder(
    input [2:0]code,
    output zero,
    output one,
    output two,
    output neg1,
    output neg2
);

assign zero = (code[2]&&code[1]&&code[0]) || ((!code[2])&&(!code[1])&&(!code[0]));
assign one = ((!code[2])&&(!code[1])&&code[0]) || ((!code[2])&&code[1]&&(!code[0]));
assign two = (!code[2])&&code[1]&&code[0];
assign neg1 = (code[2]&&(!code[1])&&code[0]) || (code[2]&&code[1]&&(!code[0]));
assign neg2 = code[2]&&(!code[1])&&(!code[0]);

endmodule