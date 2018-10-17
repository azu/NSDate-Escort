#!/bin/sh

xcodebuild test -workspace NSDate-Escort.xcworkspace \
-scheme 'Test' \
-sdk iphonesimulator \
-destination 'platform=iOS Simulator,OS=12.0,name=iPhone XS' \
GCC_GENERATE_TEST_COVERAGE_FILES=YES
