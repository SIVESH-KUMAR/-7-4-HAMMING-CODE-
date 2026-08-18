// ======================= Hamming(7,4) Decoder =======================
module hamming74_decoder (
    input  [6:0] code_in,    // Received 7-bit code
    output [3:0] data_out,   // Corrected 4-bit data
    output reg error_flag    // 1 if error detected & corrected
);

    wire s1, s2, s3;
    wire [2:0] syndrome;
    reg  [6:0] corrected;

    // Syndrome calculation
    assign s1 = code_in[0] ^ code_in[2] ^ code_in[4] ^ code_in[6]; 
    assign s2 = code_in[1] ^ code_in[2] ^ code_in[5] ^ code_in[6]; 
    assign s3 = code_in[3] ^ code_in[4] ^ code_in[5] ^ code_in[6]; 

    assign syndrome = {s3, s2, s1}; // binary index of error bit

    always @(*) begin
        corrected   = code_in;
        error_flag  = 0;

        if (syndrome != 3'b000) begin
            error_flag = 1;  
            corrected[syndrome-1] = ~corrected[syndrome-1]; // flip error bit
        end
    end

    // Extract data bits [d1, d2, d3, d4]
    assign data_out = {corrected[6], corrected[5], corrected[4], corrected[2]};

endmodule
