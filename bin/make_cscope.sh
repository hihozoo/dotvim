#!/bin/bash

SRC_PATH=$1

cd ${SRC_PATH}

find ./ -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.py" > cscope.files

cscope -Rbkq -i ./cscope.files

rm ./cscope.files
