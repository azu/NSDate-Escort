#!/bin/sh

xcodebuild test -workspace NSDate-Escort.xcworkspace \
-scheme 'Test' \
-sdk iphonesimulator \
-destination 'platform=iOS Simulator,OS=8.0,name=iPhone 6' | xcpretty -c && exit ${PIPESTATUS[0]}
