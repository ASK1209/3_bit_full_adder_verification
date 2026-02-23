// Code your design here
module full_adder_3bit (
    input  logic [2:0] a,
    input  logic [2:0] b,
    input  logic       cin,
    output logic [2:0] sum,
    output logic       cout
);
    // 1. Create a 4-bit internal variable to hold the full result
    logic [3:0] full_result;

    // 2. Perform the addition
    assign full_result = a + b + cin;

    // 3. Separate the outputs manually
    assign sum  = full_result[2:0]; // The lower 3 bits are the sum
    assign cout = full_result[3];   // The 4th bit (MSB) is the carry-out
    
endmodule