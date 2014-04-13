all: escript | erl.mk

erl.mk:
	wget -nv -O $@ 'https://raw.github.com/fenollp/erl-mk/master/erl.mk' || rm $@

dep_encurses = https://github.com/jzellner/encurses.git
dep_strings_attached = https://github.com/fenollp/strings_attached.git

include erl.mk

# Your targets after this line.

distclean: clean clean-docs
	$(if $(wildcard deps/ ), rm -rf deps/)
	$(if $(wildcard erl.mk), rm erl.mk   )
.PHONY: distclean

debug: all
	erl -pa ebin/ -pa deps/*/ebin/ -eval 'c:l($(APP)).'
