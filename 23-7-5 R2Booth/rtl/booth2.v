module booth2 #(
    parameter WIDTH = 4
) (
    input  [  WIDTH-1:0] q,
    input  [  WIDTH-1:0] m,
    output [WIDTH*2-1:0] p
);

  reg signed [WIDTH*2:0] aq;
  integer i;
  always @(*) begin
    aq = {{WIDTH{1'b0}}, q, 1'b0};
    $display("aq initial value = \t%b", aq);
    for (i = 0; i < WIDTH; i = i + 1) begin
      if (aq[1:0] == 2'b01) begin
        aq[WIDTH*2-:WIDTH] = aq[WIDTH*2-:WIDTH] + m;
      end else if (aq[1:0] == 2'b10) begin
        aq[WIDTH*2-:WIDTH] = aq[WIDTH*2-:WIDTH] - m;
      end
      $display("aq 移位前 = \t%b(%d)", aq, i);
      aq = aq >>> 1;
      $display("aq 移位后 = \t%b(%d)", aq, i);
    end
  end

  assign p = aq[WIDTH*2:1];

endmodule
