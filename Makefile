LIB_SOURCES := $(wildcard src/NanikaPlugin.*.coffee)
LIB_TARGETS = $(subst src/,lib/, $(LIB_SOURCES:.coffee=.js))

all: $(LIB_TARGETS) lib/NanikaDefaultPlugin.min.js

lib/NanikaDefaultPlugin.js: $(LIB_TARGETS)
	cat $^ > $@

lib/NanikaDefaultPlugin.min.js: lib/NanikaDefaultPlugin.js
	uglifyjs --preamble "/* (C) 2014 Narazaka : Licensed under The MIT License - http://narazaka.net/license/MIT?2014 */" --screw-ie8 $^ -o $@

lib/%.js: src/NanikaPlugin-prefix.coffee src/%.coffee src/NanikaPlugin-postfix.coffee
	cat $^ | coffee -c --stdio > $@
