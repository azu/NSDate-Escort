test-en:
	osascript -e 'tell app "iPhone Simulator" to quit'
	ios-sim-locale -sdk 6.1 -language en -locale en_US
	xctool test
test-ja:
	osascript -e 'tell app "iPhone Simulator" to quit'
	ios-sim-locale -sdk 6.1 -language ja -locale ja_JP
	xctool test