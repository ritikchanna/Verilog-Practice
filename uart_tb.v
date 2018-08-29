`timescale 1ns / 1ps
module uart_tb;
reg[7:0] data_tx;
reg tx_data_ready;
wire serial_data;
wire tx_done;
reg clock = 0;
uart_tx tx(data_tx,tx_data_ready,clock,serial_data,tx_done);
uart_rx rx(rx_enable,clock,serial_data,rx_data, rx_done);
reg rx_enable = 0;
wire[0:7] rx_data;
wire rx_done;
always
    #5 clock <= !clock;
	 
initial
begin
data_tx <= 8'b11001100;
#15 tx_data_ready <= 1'b1;
rx_enable <= 1'b1;
#20 tx_data_ready <= 1'b0;
end
always@(posedge tx_data_ready)
$display("TX data is %b",data_tx);
always@(posedge rx_done)
$display("RX data is %b",rx_data);

endmodule
