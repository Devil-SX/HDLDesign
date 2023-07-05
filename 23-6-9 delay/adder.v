module adder(
    input [7:0] a,
    input [7:0] b,
    output [7:0] sum
);

    specify
      (a => sum) = 10 ;
      (b => sum) = 10;
    endspecify

    assign sum = a + b;
endmodule