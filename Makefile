test-all: test test-ja

test:
	xctool test GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES GCC_GENERATE_TEST_COVERAGE_FILES=YES

test-en:
	osascript -e 'tell app "iPhone Simulator" to quit'
	./script/bin/ios-sim-locale -sdk 6.1 -language en -locale en_US
	xctool test GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES GCC_GENERATE_TEST_COVERAGE_FILES=YES
test-ja:
	osascript -e 'tell app "iPhone Simulator" to quit'
	./script/bin/ios-sim-locale -sdk 6.1 -language ja -locale ja_JP
	xctool test GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES GCC_GENERATE_TEST_COVERAGE_FILES=YES