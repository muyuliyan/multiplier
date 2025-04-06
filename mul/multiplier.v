/* x*y  */

module multiplier(
    input mul_clk;
    input reset;
    input mul;
    output complete;
    input [31:0] x,y,
    output [63:0]result
);

reg x_31_buffer;
reg y_31_buffer;
reg [6:0]count;
reg [62:0] temp_x;
reg [62:0] temp_y;
reg [125:0]temp_r;

always @(posedge mul_clk) begin 
    if(reset) begin
        x_31_buffer <= 1'b0;
        y_31_buffer <= 1'b0;
        count <= 7'b0;
    end
    else begin
        x_31_buffer <= x[31];
        y_31_buffer <= y[31];
        count <= 1'b0;
    end
end

always @(posedge mul_clk) begin
    case({x_31_buffer, y_31_buffer})
        2'b00: temp_x <= {31'b0, x[31:0]},temp_y <= {31'b0, y[31:0]};
        2'b01: temp_x <= {31'b0, x[31:0]},temp_y <= {31'b1, y[31:0]};
        2'b10: temp_x <= {31'b1, x[31:0]},temp_y <= {31'b0, y[31:0]};
        2'b11: temp_x <= {31'b1, x[31:0]},temp_y <= {31'b1, y[31:0]};
        default: temp_x <= 1'bx,temp_y <= 1'bx;
    endcase
end

always @(posedge mul_clk) begin
    if(temp_y[0]){
        temp_r <= temp_r + temp_x << count;
        count <= count + 1;
        temp_y <= temp_y >> 1;
    }
    else{
        count <= count + 1;
        temp_y <= temp_y >> 1;
    }
end

assign result = temp_r[62:0];
assign complete = (count == 7'd63);

endmodule