`timescale 1ns/1ps

 module sparse_adder64_tb();
 reg [63:0] A,B;
 wire [63:0] SUM;
 wire CO;

 reg [64:0] correct_s;
 integer run_times = 2000;

 sparse_adder64 DUT(.A(A), .B(B), .SUM(SUM), .CO(CO));

initial
 begin
	 repeat (run_times)
 	 begin
	 	A = $random;
	 	B = $random;
//	 	CIN = ($random) % 2;
		correct_s = A+B;
		
		#2 if({CO,SUM}==correct_s)
			$display ("Right! ");
		   else
			$display ("Wrong!\n {CO,SUM}=\t%b\n correct_s=\t%b", {CO,SUM}, correct_s);
	  end	
  end


endmodule


