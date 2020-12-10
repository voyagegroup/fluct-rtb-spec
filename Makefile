ARTIFACT := version2.req-examples.md native-ads-v1.req-examples.md

all: $(ARTIFACT)

%.req-examples.md: $(DLV)/rtb/%.req-examples.md
	cp $< $@

clean:
	rm -f $(ARTIFACT)

.PHONY: all clean
