#!/bin/bash

TARGET_SH_AND_ARGS=$@

nohup sh $TARGET_SH_AND_ARGS > /dev/null 2>&1 &

