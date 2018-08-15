`timescale 1ns / 1ps

//module demultiplexer_gate(o,s,i);

//endmodule


module demultiplexer_dataflow(o,s,i);
parameter select_lines = 2;
output [2**(select_lines-1):0] o;
input [select_lines-1:0] s;
input i;
assign o[s] = i;
endmodule


module demultiplexer_behav(o,s,i);
parameter select_lines = 2;
input [select_lines-1:0] s;
output reg [2**(select_lines-1):0] o;
input i;
always @ (s,i)
begin
o[s] = i;
end
endmodule
