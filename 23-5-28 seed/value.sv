module moduleName (

);
  

initial begin
  string seed;
  
  $value$plusargs("seed=%s", seed);
  $display("seed=%s", seed);
end

endmodule