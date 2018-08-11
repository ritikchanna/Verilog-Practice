`timescale 1ns / 1ps
//2-input and-gate using gate level modelling.
module and_gate(o,a,b);
input a,b;
output o;
and a1(o,a,b);
endmodule

//n-input and-gate using dataflow modelling.
module and_dataflow(o,i);
parameter inputs = 2;
input [inputs:1] i;
output o;
assign o = &i;
endmodule

//n-input and-gate using behavioural modelling. 
module and_behav(o,i);
parameter inputs = 2;
input [inputs:1] i;
output reg o;
always @ (i)
o = &i;
endmodule
