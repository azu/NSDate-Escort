#!/bin/sh

OCLINT_HOME=~/local/oclint/bin
export PATH=$OCLINT_HOME/bin:$PATH
xctool -reporter json-compilation-database:compile_commands.json clean
xctool -reporter json-compilation-database:compile_commands.json test
# -i is include , -e is exclude
oclint-json-compilation-database -i Lib/ -e Tests/