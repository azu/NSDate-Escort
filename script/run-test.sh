#!/bin/sh

xcodebuild test -workspace NSDate-Escort.xcworkspace -scheme 'Test'\
 -destination 'platform=iOS Simulator,name=iPhone Retina (4-inch)' | xcpretty -c
