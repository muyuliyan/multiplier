module CarryLookAheadAdder (
    input [65:0] A,
    input [65:0] B,
    output [65:0] Sum
);
    // 将66位分为16个4位组和1个2位组
    localparam NUM_4BIT_GROUPS = 16;
    localparam NUM_2BIT_GROUP = 1;
    localparam TOTAL_GROUPS = NUM_4BIT_GROUPS + NUM_2BIT_GROUP;
    
    wire [TOTAL_GROUPS:0] C;   // Carry between groups
    wire [TOTAL_GROUPS-1:0] GG, PG; // Group Generate/Propagate
    
    assign C[0] = 1'b0;  // Initial carry-in

    // 处理前64位（16个4位组）
    genvar i;
    generate
        for (i=0; i<NUM_4BIT_GROUPS; i=i+1) begin: group_4bit
            wire [3:0] A_part = A[i*4 +3 : i*4];
            wire [3:0] B_part = B[i*4 +3 : i*4];
            wire [3:0] G = A_part & B_part;
            wire [3:0] P = A_part ^ B_part;
            
            // Group Generate/Propagate
            assign GG[i] = G[3] | (P[3] & G[2]) | 
                         (P[3] & P[2] & G[1]) | 
                         (P[3] & P[2] & P[1] & G[0]);
            assign PG[i] = &P;  // P[3]&P[2]&P[1]&P[0]
            
            // Carry calculation within group
            wire c1 = G[0] | (P[0] & C[i]);
            wire c2 = G[1] | (P[1] & c1);
            wire c3 = G[2] | (P[2] & c2);
            
            // Sum generation
            assign Sum[i*4 +0] = P[0] ^ C[i];
            assign Sum[i*4 +1] = P[1] ^ c1;
            assign Sum[i*4 +2] = P[2] ^ c2;
            assign Sum[i*4 +3] = P[3] ^ c3;
        end
    endgenerate

    // 处理最后两位（64-65）
    wire [1:0] A_rest = A[65:64];
    wire [1:0] B_rest = B[65:64];
    wire [1:0] G_rest = A_rest & B_rest;
    wire [1:0] P_rest = A_rest ^ B_rest;
    
    // 最后一组的Generate/Propagate
    assign GG[16] = G_rest[1] | (P_rest[1] & G_rest[0]);
    assign PG[16] = &P_rest;
    
    // 最后一组的进位计算
    wire c_rest = G_rest[0] | (P_rest[0] & C[16]);
    assign Sum[64] = P_rest[0] ^ C[16];
    assign Sum[65] = P_rest[1] ^ c_rest;

    // 组间超前进位计算
    generate
        for (i=0; i<TOTAL_GROUPS; i=i+1) begin: carry_chain
            assign C[i+1] = GG[i] | (PG[i] & C[i]);
        end
    endgenerate
endmodule