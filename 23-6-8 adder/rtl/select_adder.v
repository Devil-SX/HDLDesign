module select_adder 
#(
  parameter COUNT = 4
)(
  input [COUNT-1:0] A,
  input [COUNT-1:0] B,
  input Cin,
  output[COUNT-1:0] S,
  output Cout
);

  wire Cout_wire0;
  wire Cout_wire1;

  wire [COUNT-1:0] S0;
  wire [COUNT-1:0] S1;

  full_adder #(COUNT) fa0(
            .A(A[COUNT-1:0]), .B(B[COUNT-1:0]), .Cin(1'b0),
        .S(S0[COUNT-1:0]), .Cout(Cout_wire0)
  );

  full_adder #(COUNT) fa1(
            .A(A[COUNT-1:0]), .B(B[COUNT-1:0]), .Cin(1'b1),
        .S(S1[COUNT-1:0]), .Cout(Cout_wire1)
  );

  assign Cout = Cin? Cout_wire1 : Cout_wire0;
  assign S = Cin? S1 : S0;

endmodule
