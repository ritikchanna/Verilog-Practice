`timescale 1ns / 1ps

module full_adder_behav (sum,carry,a,b,c);
input a,b,c;
output reg sum,carry;
always @ (a,b,c)
begin
sum = a + b + c;
carry =  (a*b) + (b*c) + (a*c);
end
endmodule
