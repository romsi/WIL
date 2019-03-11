IB_TOOL=ibtool
PROJECT_EXTENSION=playground
PLAYGROUND_PATH=Playground.$(PROJECT_EXTENSION)/Resources
VPATH=$(PLAYGROUND_PATH)

%.storyboardc : %.storyboard
	$(IB_TOOL) --compile $(shell dirname $^)/$@ $^

all: Main.storyboardc

clean:
	rm -rf $(PLAYGROUND_PATH)/*.storyboardc

.PHONY: clean