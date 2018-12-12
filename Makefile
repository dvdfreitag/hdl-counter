PROJ := counter
SRCS := counter.v
BENCH := counter.tb.v
DUMPFILE := $(addsuffix .vcd, $(PROJ))
WAVEFILE := $(addsuffix .dsn, $(PROJ))

IVERILOG := iverilog
IVFLAGS := -g2012

VVP := vvp
VVFLAGS := +DUMPFILE="$(DUMPFILE)"

%.dsn: %.v
	$(IVERILOG) $(IVFLAGS) -o "$@" "$<" $(BENCH)

%.vcd: %.dsn
	$(VVP) "$<" $(VVFLAGS)

.PHONY: clean

$(DUMPFILE): $(WAVEFILE)

clean:
	@rm -f *.dsn *.vcd
