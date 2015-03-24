#!/bin/sh

xcodebuild test -workspace NSDate-Escort.xcworkspace \
-scheme 'Test' \
-sdk iphonesimulator \
-destination 'platform=iOS Simulator,OS=8.1,name=iPhone 6' \
GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES \
GCC_GENERATE_TEST_COVERAGE_FILES=YES
