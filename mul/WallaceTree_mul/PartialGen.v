module PartialGen (
    input [31:0] A,
    input zero,
    input one,
    input two,
    input neg1,
    input neg2,
    outout [63:0] partial
);
    
    reg [63:0] partial_reg;

    always @(*mul_clk) begin
        if (zero) begin
            partial_reg = 64'd0;
        end
        else if (one) begin
            partial_reg = {{32{A[31]}}, A};
        end
        else if (two) begin
            partial_reg = {{31{A[31]}}, A, 1'b0};
        end
        else if (neg1) begin
            partial_reg = ~{{31{A[31]}}, A, 1'b0} + 1'b1;
        end
        else begin
            partial_reg = 64'b0;
        end
    end

    assign partial = partial_reg;

endmodule