#!/bin/bash

export KERNELNAME=Excalibur

export LOCALVERSION=

export KBUILD_BUILD_USER=BuildBott

export KBUILD_BUILD_HOST=Nothing

export TOOLCHAIN=clang

export DEVICES=surya

source helper

gen_toolchain

send_msg "⚔️ Mulai menempa ${KERNELNAME} kernel ⚔️
📝 $(git log --pretty=format:'%s' -5) 📝"

START=$(date +"%s")

for i in ${DEVICES//,/ }
do 

	build ${i} -OSS

done

END=$(date +"%s")
 
DIFF=$(( END - START ))
