`timescale 1ns / 1ps
module uart_rx(
input enable,
input clock,
input serial_in,
output reg[0:7] data,
output reg done
    );
parameter idle_state = 2'b000;
parameter data_bits = 2'b010;
parameter stop_bit = 2'b011;
parameter cleanup_state = 2'b01;
reg[1:0] state = idle_state;
reg[3:0] bit_count;

always @(posedge clock)
begin
case(state)
idle_state:
begin
bit_count = 3'b0000;
if(enable == 1'b1)
if(serial_in == 1'b0)
state <= data_bits;
end
data_bits:
begin
data[bit_count] = serial_in;
bit_count <= bit_count + 1;
if(bit_count > 7)
state <= stop_bit;
end
stop_bit:
begin
done <= 1'b1;
state <= cleanup_state;
end
cleanup_state:
begin
done <= 1'b1;
state <= idle_state;
end
default:
begin
state <= idle_state;
end
endcase
end
endmodule
