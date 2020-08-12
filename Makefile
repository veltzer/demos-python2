############
# includes #
############
# include /usr/share/templar/make/Makefile

##############
# parameters #
##############
# do you want to check python syntax?
DO_CHECK_SYNTAX:=1
# do you want to bring in tools?
DO_TOOLS:=0
# what is the tools.stamp file?
TOOLS:=tools.stamp

########
# code #
########
ALL:=
ALL_PY:=$(shell find src -name "*.py")
ALL_STAMP:=$(addsuffix .stamp, $(basename $(ALL_PY)))

ifeq ($(DO_CHECK_SYNTAX),1)
	ALL+=$(ALL_STAMP)
endif # DO_CHECK_SYNTAX

ALL_DEP:=Makefile

ifeq ($(DO_TOOLS),1)
	ALL_DEP+=$(TOOLS)
endif # DO_TOOLS

ifeq ($(DO_MKDBG),1)
Q=
# we are not silent in this branch
else # DO_MKDBG
Q=@
#.SILENT:
endif # DO_MKDBG

#########
# rules #
#########
.PHONY: all
all: $(ALL)

.PHONY: check_all
check_all: $(ALL_STAMP) $(ALL_DEP)

.PHONY: check
check: check_ws check_has_key check_no_python2

.PHONY: check_ws
check_ws: $(ALL_DEP)
	$(info doing [$@])
	$(Q)git grep -E "\s$$" -- '*.py' || exit 0

.PHONY: check_lint
check_lint: $(ALL_DEP)
	$(info doing [$@])
	$(Q)pylint3 --py3k --rcfile=support/pylint.conf `find src -name "*.py"`

# this is a bad check because returning tuples in python is perfectly legit
.PHONY: check_return
check_return: $(ALL_DEP)
	$(info doing [$@])
	$(Q)git grep -l -E "return\(.*\)$$" -- '*.py' || exit 0
	$(Q)git grep -l -E "return \(.*\)$$" -- '*.py' || exit 0

# this is a bad check because comparing tuples in python is perfectly legit
.PHONY: check_if
check_if: $(ALL_DEP)
	$(info doing [$@])
	$(Q)git grep -l -E "if \(" -- '*.py' || exit 0
	$(Q)git grep -l -E "if\(" -- '*.py' || exit 0

.PHONY: check_has_key
check_has_key: $(ALL_DEP)
	$(info doing [$@])
	$(Q)git grep -l "has_key" -- '*.py' || exit 0

.PHONY: check_no_python2
check_no_python2: $(ALL_DEP)
	$(info doing [$@])
	$(Q)git grep -E "^#!/usr/bin/python2" || exit 0

.PHONY: check_no_future
check_no_future: $(ALL_DEP)
	$(info doing [$@])
	$(Q)git grep "__future__" || exit 0

$(ALL_STAMP): %.stamp: %.py $(ALL_DEP)
	$(info doing [$@])
	$(Q)scripts/syntax_check.py $<
	$(Q)touch $@

.PHONY: debug_me
debug_me:
	$(Q)$(info ALL_STMAP is $(ALL_STAMP))
	$(Q)$(info ALL is $(ALL))
	$(Q)$(info ALL_DEP is $(ALL_DEP))

.PHONY: show_shbang
show_shbang:
	$(Q)find src -name "*.py" -and -executable -exec head -1 {} \; | sort | uniq

.PHONY: todo
todo:
	@git grep @TODO -- ':!/Makefile'

.PHONY: remove_stamp
remove_stamp:
	@find . -type f -and -name "*.stamp" -delete

.PHONY: clean
clean:
	find . -name "__pycache__" -type d -exec rm -r {} \;
	find . -name "*.pyc" -or -name "*.pyo" -delete
