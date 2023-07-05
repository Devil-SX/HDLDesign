module select_adder_tb;
  parameter COUNT = 4;

  reg [COUNT-1:0] A;
  reg [COUNT-1:0] B;
  reg Cin;
  wire [COUNT-1:0] S;
  wire Cout;
  
  select_adder #(COUNT) DUT(.A(A), .B(B), .Cin(Cin), .S(S), .Cout(Cout));

  initial begin
    $display("A\tB\tCin\t|\tS\tCout");
    $monitor("%b\t%b\t%b\t|\t%b\t%b", A, B, Cin, S, Cout);

    A = 4'b0000;
    B = 4'b0000;
    Cin = 0;
    
    #10;
    
    A = 4'b0000;
    B = 4'b0001;
    Cin = 0;
    
    #10;
    
    A = 4'b0001;
    B = 4'b0010;
    Cin = 0;
    
    #10;
    
    A = 4'b1111;
    B = 4'b0001;
    Cin = 1;
    
    #10;
    
    $finish;
  end
endmodule
