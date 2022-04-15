module dpram_tb();
parameter T=100;
reg clk;
reg re;
reg we;
reg [3:0] addr_wr;
reg [3:0] addr_rd;
reg [7:0] data_in;
wire [7:0] data_out;
integer i,k;
dpram dut(clk,we,re,addr_wr,addr_rd,data_in,data_out);
task initialize();
begin
clk=0;
we=0;
re=0;
addr_wr=0;
addr_rd=0;
data_in=0;
#(T/2);
end
endtask
always
begin
clk=0;
#(T/2);
clk=1;
#(T/2);
end
task write(input [7:0] x,input [3:0] y);
begin
@(posedge clk)
we=1;
addr_wr=y;
data_in=x;
#(T/2);
end
endtask
task read(input [3:0] a);
begin
@(posedge clk)
re=1;
addr_rd=a;
#(T/2);
end
endtask
initial 
fork
initialize();
for(i=0;i<16;i=i+1)
	write(i,i);
#(100)for(k=0;k<16;k=k+1)
	read(k);
join
endmodule

