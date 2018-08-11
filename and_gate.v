`timescale 1ns / 1ps

module and_gate(o,a,b);
input a,b;
output o;
and a1(o,a,b);
endmodule


module and_dataflow(o,a,b);
input a,b;
output o;
assign o = a & b;
endmodule


module and_behav(o,a,b);
input a,b;
output o;
reg o;
always @ (a,b)
o = a & b;
endmodule
