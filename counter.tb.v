module test;
	reg clk = 0;
	reg reset = 0;
	reg enable = 1;
	reg [7:0] period = 'h0A;
	reg slope = 1;
	wire out;

	initial begin
		string dumpfile;

		if (!$value$plusargs("DUMPFILE=%s", dumpfile)) begin
			$fatal(1, "ERROR: No dumpfile supplied, please use +DUMPFILE=<dumpfile>");
		end

		$dumpfile(dumpfile);
		$dumpvars(0, test);
		
		# 14 reset  = 0;
		# 11 reset  = 1;
		# 5  enable = 0;
		# 19 enable = 1;
		# 5  reset  = 0;
		# 5  reset  = 1;
		# 29 enable = 0;
		# 29 enable = 1;
		# 29 enable = 0;
		# 29 slope  = 1;
		# 65 slope  = 0;
		# 0 period  = 'hBD;
		# 422 $finish;
	end

	always #1 clk = !clk;

	counter c1 (clk, reset, enable, period, slope, out);
endmodule
