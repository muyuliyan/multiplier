module PartialGen (
    input [32:0] A,
    input zero,
    input one,
    input two,
    input neg1,
    input neg2,
    outout [65:0] partial
);
    
    reg [65:0] partial_reg;

    always @(*mul_clk) begin
        if (zero) begin
            partial_reg = 65'd0;
        end
        else if (one) begin
            partial_reg = {{33{A[32]}}, A};
        end
        else if (two) begin
            partial_reg = {{32{A[32]}}, A, 1'b0};
        end
        else if (neg1) begin
            partial_reg = ~{{32{A[32]}}, A, 1'b0} + 1'b1;
        end
        else begin
            partial_reg = 65'b0;
        end
    end

    assign partial = partial_reg;

endmodule