#!/bin/sh

xcodebuild test -workspace NSDate-Escort.xcworkspace -scheme 'Test'\
 -destination 'platform=iOS Simulator,name=iPhone 6' | xcpretty -c
