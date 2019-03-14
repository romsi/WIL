IB_TOOL=ibtool
PROJECT_EXTENSION=playground
PROTOTYPING_PATH=Prototyping.$(PROJECT_EXTENSION)/Resources
VPATH=$(PROTOTYPING_PATH)

%.storyboardc : %.storyboard
	$(IB_TOOL) --compile $(shell dirname $^)/$@ $^

all: Main.storyboardc

clean:
	rm -rf $(PROTOTYPING_PATH)/*.storyboardc

.PHONY: clean