`timescale 1ns/1ps

module tb_hamming74;

    reg  [3:0] data_in;
    wire [6:0] code_out;

    reg  [6:0] noisy_code;   // Encoded data with/without error
    wire [3:0] data_out;
    wire error_flag;

    // Instantiate Encoder
    hamming74_encoder encoder (
        .data_in(data_in),
        .code_out(code_out)
    );

    // Instantiate Decoder
    hamming74_decoder decoder (
        .code_in(noisy_code),
        .data_out(data_out),
        .error_flag(error_flag)
    );

    initial begin
        $dumpfile("hamming74.vcd");  // For GTKWave (Icarus Verilog)
        $dumpvars(0, tb_hamming74);

        noisy_code = 7'b0; // Initialize

        // Test 1: Encode & Decode without error
        data_in = 4'b1011;
        #5;                 // wait for encoder to compute
        noisy_code = code_out; // no error
        #5;
        $display("Test1 -> Data: %4b | Encoded: %7b | Decoded: %4b | Error: %b",
                  data_in, code_out, data_out, error_flag);

        // Test 2: Introduce single-bit error
        data_in = 4'b1101;
        #5;
        noisy_code = code_out;
        noisy_code[3] = ~noisy_code[3]; // Flip bit at position 3
        #5;
        $display("Test2 -> Data: %4b | Encoded: %7b | Received: %7b | Corrected: %4b | Error: %b",
                  data_in, code_out, noisy_code, data_out, error_flag);

        // Test 3: Another error at MSB
        data_in = 4'b0110;
        #5;
        noisy_code = code_out;
        noisy_code[6] = ~noisy_code[6]; // Flip MSB
        #5;
        $display("Test3 -> Data: %4b | Encoded: %7b | Received: %7b | Corrected: %4b | Error: %b",
                  data_in, code_out, noisy_code, data_out, error_flag);

        $finish;
    end

endmodule
