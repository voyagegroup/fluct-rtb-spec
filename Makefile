ARTIFACT := version2.req-examples.md

all: $(ARTIFACT)

version2.%.md: $(DLV)/rtb/version2.%.md
	cp $< $@

clean:
	rm -f $(ARTIFACT)

.PHONY: all
