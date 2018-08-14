`timescale 1ns / 1ps
//2-input and-gate using gate level modelling.
module and_gate(o,i);
parameter inputs = 2;
input [inputs:1] i;
output o;
generate case(inputs)
2: and a2 (o,i[2],i[1]);
3: and a3 (o,i[3],i[2],i[1]);
4: and a4 (o,i[4],i[3],i[2],i[1]);
5: and a5 (o,i[5],i[4],i[3],i[2],i[1]);
6: and a6 (o,i[6],i[5],i[4],i[3],i[2],i[1]);
7: and a7 (o,i[7],i[6],i[5],i[4],i[3],i[2],i[1]);
8: and a8 (o,i[8],i[7],i[6],i[5],i[4],i[3],i[2],i[1]);
9: and a9 (o,i[9],i[8],i[7],i[6],i[5],i[4],i[3],i[2],i[1]);
10: and a10 (o,i[10],i[9],i[8],i[7],i[6],i[5],i[4],i[3],i[2],i[1]);
endcase
endgenerate
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
