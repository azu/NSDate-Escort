#!/bin/sh

xcodebuild test -workspace NSDate-Escort.xcworkspace \
-scheme 'Test' \
-sdk iphonesimulator \
-destination 'platform=iOS Simulator,OS=11.4,name=iPhone X' \
GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES \
GCC_GENERATE_TEST_COVERAGE_FILES=YES
