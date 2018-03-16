#!/bin/bash

SRC_PATH=$1

find $SRC_PATH -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.py" > cscope.files

cscope -bkq -i ./cscope.files

rm ./cscope.files

mv ./cscope* $SRC_PATH

