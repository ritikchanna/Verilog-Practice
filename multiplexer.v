`timescale 1ns / 1ps

//module multiplexer_gate(o,s,i);

//endmodule


module multiplexer_dataflow(o,s,i);
output o;
parameter select_lines = 2;
input [select_lines-1:0] s;
input [2**(select_lines-1):0] i;
assign o = i[s];
endmodule


module multiplexer_behav(o,s,i);
output reg o;
parameter select_lines = 2;
input [select_lines-1:0] s;
input [2**(select_lines-1):0] i;
always @ (s,i)
begin
o = i[s];
end
endmodule
