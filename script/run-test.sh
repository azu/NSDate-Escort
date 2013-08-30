#!/bin/sh

xctool test \
	-workspace NSDate-Escort.xcworkspace \
	-sdk iphonesimulator \
	-scheme Tests \
	-configuration Debug \
	ONLY_ACTIVE_ARCH=NO \
	GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES \
	GCC_GENERATE_TEST_COVERAGE_FILES=YES