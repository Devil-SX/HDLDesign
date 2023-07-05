`timescale 1ns/1ps

module adder_tb (

);
  
reg[7:0] a;
reg[7:0] b;
wire[7:0] sum;

adder DUT (
  .a(a),
  .b(b),
  .sum(sum)
);

initial begin
  forever begin: loop
    #10 a = $random;
    #10 b = $random;
  end
end

initial begin
  #1000 $finish;
end

initial begin
  $dumpfile("wave.vcd");
  $dumpvars(0, adder_tb);
end

endmodule