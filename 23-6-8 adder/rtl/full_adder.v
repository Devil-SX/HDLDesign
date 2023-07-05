module full_adder 
#(
  parameter COUNT = 4
)(
  input [COUNT-1:0] A,
  input [COUNT-1:0] B,
  input Cin,
  output[COUNT-1:0] S,
  output Cout
);

  wire  Cout_wire;

  generate
    if (COUNT == 1) begin : single_bit
      assign Cout = (A[0] & B[0]) | (A[0] & Cin) | (B[0] & Cin);
      assign S[0] = A[0] ^ B[0] ^ Cin;
    end else begin : multi_bit
      full_adder #(COUNT-1) fa(
        .A(A[COUNT-2:0]), .B(B[COUNT-2:0]), .Cin(Cin),
        .S(S[COUNT-2:0]), .Cout(Cout_wire)
      );

      assign Cout = (A[COUNT-1] & B[COUNT-1]) | (A[COUNT-1] & Cout_wire) | (B[COUNT-1] & Cout_wire);
      assign S[COUNT-1] = A[COUNT-1] ^ B[COUNT-1] ^ Cout_wire;
    end
  endgenerate

endmodule
