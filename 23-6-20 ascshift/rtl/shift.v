module shift #(
  parameter WIDTH = 8
)(
  clk,
  rst_n,
  i_data,
  o_data,
  i_rsq_n,
  o_busy
);

input clk;
input rst_n;
input [WIDTH*8-1:0] i_data;
output [WIDTH-1:0] o_data;
input i_rsq_n;
output o_busy;

// FSM
localparam
  IDEL= 1'b0,
  PROCESS = 1'b1;
reg status;
reg[2:0] i;

// Status
always @(posedge clk or !rst_n) begin
  if(!rst_n) begin
    status <= IDEL;
    i <= 0;
  end else begin
    case(status)
      IDEL: begin
        if(!i_rsq_n) begin
          i <= 0;
          status <= PROCESS;
        end
      end
      PROCESS: begin
        if(i == 7) begin
          status <= IDEL;
        end else begin
          i <= i + 1;
        end
      end
    endcase
  end
end


// Data
reg [WIDTH*8-1:0] i_data_reg;
always @(posedge clk ) begin
  i_data_reg <= i_data;
end

assign o_data = i_data_reg[WIDTH*(i+1)-1-:WIDTH];
assign o_busy = (status == PROCESS); // busy

endmodule