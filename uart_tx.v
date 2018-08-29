`timescale 1ns / 1ps
module uart_tx(
input[0:7] data,
input ready,
input clock,
output reg serial_out,
output reg done
    );
parameter idle_state = 3'b000;
parameter start_bit = 3'b001;
parameter data_bits = 3'b010;
parameter stop_bit = 3'b011;
parameter cleanup_state = 3'b100;
reg[2:0] state = idle_state;
reg[3:0] bit_count;
always @(posedge clock)
begin
case(state)
idle_state:
begin
serial_out <= 1;
bit_count <= 3'b000;
done <= 0;
if(ready == 1'b1)
state <= start_bit;
end
start_bit:
begin
serial_out <= 1'b0;
state <= data_bits;
end
data_bits:
begin
serial_out = data[bit_count];
bit_count = bit_count + 1;
if(bit_count > 3'b111)
state = stop_bit;
end
stop_bit:
begin
serial_out <= 1'b1;
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