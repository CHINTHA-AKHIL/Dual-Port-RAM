module dpram(clk,we,re,addr_wr,addr_rd,data_in,data_out);
input clk,re,we;
input [3:0]addr_rd;
input [3:0]addr_wr;
input [7:0]data_in;
output [7:0]data_out;
reg [7:0]data_out;
reg	[15:0]mem[7:0];
always @(posedge clk)
begin
	if(we)
	mem[addr_wr]=data_in;
end
always @(posedge clk)
begin
	if(re)
	data_out=mem[addr_rd];
end
endmodule