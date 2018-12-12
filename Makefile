PROJ := counter
SRCS := $(wildcard *.v)
TBS := $(wildcard *.tb.v)
DUMPFILE := $(addsuffix .vcd, $(PROJ))
WAVEFILE := $(addsuffix .dsn, $(PROJ))

IVERILOG := iverilog
IVFLAGS := -g2012

VVP := vvp
VVFLAGS := +DUMPFILE="$(DUMPFILE)"

%.dsn: %.v
	$(IVERILOG) $(IVFLAGS) -o $@ $^

%.vcd: %.dsn
	$(VVP) $< $(VVFLAGS)

.PHONY: clean

$(DUMPFILE): $(WAVEFILE)

$(WAVEFILE): $(SRCS) $(TBS)

clean:
	@rm -f *.dsn *.vcd
