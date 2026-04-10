`define CLK_PRD 10

module testbench;

    logic clk;
    logic reset;

    single_cycle_top dut(
        .clk  (clk),
        .reset(reset)
    );

    // TODO: Generate a clock.
    // Suggested period: 10 time units.
    initial begin
        clk = 0;
        forever #(`CLK_PRD/2) clk = ~clk;
    end

    initial begin
        $dumpfile("trace.vcd");
        $dumpvars(0, testbench);

        // TODO: Apply reset.
        reset = 0;
        #(`CLK_PRD)
        reset = 1;

        // TODO: Load program.hex into dut.u_imem.mem_array using $readmemh.
        $readmemh("program.hex", dut.u_imem.mem_array); // load program

        // TODO: Release reset after a short delay.
        #(`CLK_PRD)
        reset = 0;
        #(`CLK_PRD)

        // TODO: Run long enough for the test program to complete.
        #(6*`CLK_PRD)

        // TODO: Display final register and/or memory values.
        // Suggested checks:
        // - x1, x2, x3, x8
        // - memory word 0
        // The provided example program should finish with x8 = 12.
        $display("%d", dut.u_regs.regs[1]);
        $display("%d", dut.u_regs.regs[2]);
        $display("%d", dut.u_regs.regs[3]);
        $display("%d", dut.u_regs.regs[8]);

        $display("%d", dut.u_dmem.mem_array[0]);

        $finish;
    end

endmodule
