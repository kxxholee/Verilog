`timescale 1ns/1ps

module tb_adder;
    reg [3:0] a, b;
    wire [4:0] sum;

    adder uut (
        .a(a),
        .b(b),
        .sum(sum)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_adder);

        a = 4'b0011; b = 4'b0101; #10;
        a = 4'b1111; b = 4'b0001; #10;
        a = 4'b0110; b = 4'b0110; #10;

        $finish;
    end

    initial begin
        $monitor("time=%0t, a=%b, b=%b, sum=%b", $time, a, b, sum);
    end

endmodule
