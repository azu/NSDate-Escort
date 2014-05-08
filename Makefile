test-all: test-en test-ja

test:
	./script/run-test.sh

test-en:
	osascript -e 'tell app "iPhone Simulator" to quit'
	./script/bin/ios-sim-locale -sdk 6.1 -language en -locale en_US
	./script/run-test.sh
test-ja:
	osascript -e 'tell app "iPhone Simulator" to quit'
	./script/bin/ios-sim-locale -sdk 6.1 -language ja -locale ja_JP
	./script/run-test.sh
