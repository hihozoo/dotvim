#!/bin/bash

SRC_PATH=$1

ctags -R $SRC_PATH

mv ./tags $SRC_PATH

