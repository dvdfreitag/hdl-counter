module test;

	// Make a reset that pulses once.
	reg reset = 0;
	reg enable = 0;

	initial begin
		string dumpfile;

		if (!$value$plusargs("DUMPFILE=%s", dumpfile)) begin
			$fatal(1, "ERROR: No dumpfile supplied, please use +DUMPFILE=<dumpfile>");
		end

		$dumpfile(dumpfile);
		$dumpvars(0, test);
		
		# 14 reset = 0;
		# 11 reset = 1;
		# 5 enable = 1;
		# 19 enable = 0;
		# 5 reset = 0;
		# 5  reset = 1;
		# 29 enable = 1;
		# 29 enable = 0;
		# 29 enable = 1;
		# 480 $finish;
	end

	// Make a regular pulsing clock.
	reg clk = 0;
	always #1 clk = !clk;

	wire [7:0] value;
	counter c1 (value, clk, reset, enable);

	initial begin
		$monitor("At time %t, value = %h (%0d)", $time, value, value);
	end

endmodule
