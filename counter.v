module counter(clk, reset, enable, period, slope, out);
	enum { init = 0, up = 1, down = 2 } states;
  	parameter WIDTH = 8;

	output out;
	input [WIDTH - 1 : 0] period;
	input clk, reset, enable, slope;

  	reg [WIDTH - 1 : 0] count = 0;
	reg [1:0] state = init;
  	wire clk, reset, enable, slope;
	reg out = 0;

  	always @(posedge clk) begin
	  	if (reset == 0) begin
			count <= 0;
			state <= init;
		end

		if (enable == 0) begin
			case (state)
				init: begin
					count <= 0;
					state <= up;
				end
				up: begin
					if ((count == (period - 1)) && (slope == 0)) begin
						count <= count + 1;
						state <= init;
						out <= !out;
					end
					else if ((count == (period - 1)) && (slope == 1)) begin
						count <= count + 1;
						state <= down;
						out <= !out;
					end
					else begin
						count <= count + 1;
					end
				end
				down: begin
					if (count == 1) begin
						count <= count - 1;
						state <= up;
					end
					else begin
						count <= count - 1;
					end
				end
			endcase
		end
	end
endmodule
