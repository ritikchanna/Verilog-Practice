`timescale 1ns / 1ps
module tb();
wire o1,o2,o3;
reg i1,i2,i3;
and_behav 	#(3) a1(o1,{i1,i2,i3});
and_dataflow #(3) a2(o2,{i1,i2,i3});
and_gate	   #(3) a3(o3,{i1,i2,i3});
initial
	$monitor("%t  i1=%d ,i2=%d ,i3=%d ,o1=%d ,o2=%d ,o3=%d",$time,i1,i2,i3,o1,o2,o3);

initial
begin
	i1 = 0; i2 =0; i3=0;
#5 i1 = 0; i2 =0; i3=1;
#5 i1 = 0; i2 =1; i3=0;
#5 i1 = 0; i2 =1; i3=1;
#5 i1 = 1; i2 =0; i3=0;
#5 i1 = 1; i2 =0; i3=1;
#5 i1 = 1; i2 =1; i3=0;
#5 i1 = 1; i2 =1; i3=1;
end

endmodule
