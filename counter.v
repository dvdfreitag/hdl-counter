module counter(out, clk, reset, enable, period, control);

  	parameter WIDTH = 8;

  	output [WIDTH - 1 : 0] out;
	input [WIDTH - 1 : 0] period;
	input [7 : 0] control;
  	input clk, reset, enable;

  	reg [WIDTH - 1 : 0] out = 0;
	reg [7 : 0] status = 0;
  	wire clk, reset, enable;

  	always @(posedge clk) begin
		if (reset && enable) begin
			if ((status & 1) == 1) begin
				if ((control & 1) == 1) begin
					if (out == 1) begin
						out <= out - 1;
						status <= status & ~1;
					end
					else begin
						out <= out - 1;
					end
				end
				else begin
					out <= 0;
					status <= status & ~1;
				end
			end
			else begin
				if (out == (period - 1)) begin
					out <= out +1;
					status <= status | 1;
				end
				else begin
					out <= out + 1;
				end
			end
		end
	end

  	always @(negedge reset) begin
		out <= 0;
	end
	
endmodule
