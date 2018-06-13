#!/bin/bash

SRC_PATH=$1

cd $SRC_PATH

ctags -R .
