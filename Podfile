source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '8.0'

target :Test do
	pod "NSDate-Escort", :path => "./"
	pod 'Kiwi'
	pod 'NLTQuickCheck'
	pod 'AZDateBuilder'
end

target :Benchmark do
end

target :SwiftTest do
	use_frameworks!
	pod "NSDate-Escort/Swift", :path => "./"
	pod 'AZDateBuilder'
	pod 'Quick'
	pod 'Nimble'
end