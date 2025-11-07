`timescale 1ns/1ps

module counter_test;
    // reg변수 선언
    reg clk, rst;
    reg [3:0] count;

    //
    always begin
        #5 clk = ~clk;
    end

    always @(posedge clk or negedge rst) begin
        if (!rst)
            count <= 0;
        else if (count == 9)
            count <= 0;
        else
            count <= count + 1;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, counter_test);

        clk = 0; rst = 0; count = 0;
        #12 rst = 1;

        repeat (25) @(posedge clk);
        $finish;
    end

    always @(posedge clk) begin
        $display("time=%0t, count=%d", $time, count);
    end
endmodule
