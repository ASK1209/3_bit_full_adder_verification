// Code your testbench here
// or browse Examples
class adder_transaction;
    // 3-bit inputs and 1-bit carry-in
    rand bit [2:0] a;
    rand bit [2:0] b;
    rand bit cin;
endclass

module full_adder_tb;
    // Signals to connect to the DUT
    logic [2:0] a, b, sum;
    logic cin, cout;

    // Instantiate the 3-bit Full Adder
    full_adder_3bit dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // Coverage to ensure we test varied ranges
    covergroup cg;
        option.per_instance = 1;
        cp_a:   coverpoint a;
        cp_b:   coverpoint b;
        cp_cin: coverpoint cin;
        // Cross to ensure we test combinations that cause carry-out
        cross_all: cross cp_a, cp_b, cp_cin;
    endgroup

    initial begin
        adder_transaction trans = new();
        cg cov_inst = new();
        
        // EPWave setup
        $dumpfile("dump.vcd");
      $dumpvars(0, full_adder_tb);

        $display("Time\t A \t B \t Cin | Sum \t Cout");
        
        repeat (30) begin
            if (!trans.randomize()) $error("Randomization failed");
            
            // Apply randomized stimulus
            a = trans.a;
            b = trans.b;
            cin = trans.cin;
            
            #10; // Wait for logic to propagate

            // --- SEPARATE OUTPUT ASSERTION ---
            // We check the 3-bit sum and the 1-bit carry separately
            assert(sum  === ((a + b + cin) % 8)) else $error("Sum Mismatch!");
            assert(cout === ((a + b + cin) >= 8)) else $error("Carry Mismatch!");

            $display("%0t\t %d \t %d \t %b   | %d \t %b", $time, a, b, cin, sum, cout);
            cov_inst.sample();
        end

        $display("Final Functional Coverage: %.2f%%", cov_inst.get_inst_coverage());
        $finish;
    end
endmodule
