module counter(out, clk, reset, enable);

  	parameter WIDTH = 8;

  	output [WIDTH - 1 : 0] out;
  	input clk, reset, enable;

  	reg [WIDTH - 1 : 0] out = 0;
  	wire clk, reset, enable;

  	always @(posedge clk) begin
		if (reset && enable) begin
		  	out <= out + 1;
		end
	end

  	always @(negedge reset) begin
		out <= 0;
	end
	
endmodule
