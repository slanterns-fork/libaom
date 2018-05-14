#!/bin/bash
#
# template generated by genshtest
# This is bisect for nightly unittest-ubsan, integer
#
#



build_dir=~/bisectav1/build

cd $build_dir

#echo -n "Enter the testcase to be bisected: "
#read testcase  

testcase=AV1/ErrorResilienceTestLarge.ParseAbilityTest/1


cd $build_dir
rm -r -f *

cmake ../aom -DSANITIZE=integer -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_C_FLAGS=-O1 -DCMAKE_CXX_FLAGS=-O1 -DCMAKE_BUILD_TYPE=Debug '-DCMAKE_EXE_LINKER_FLAGS=-Wl,--start-group ' -DENABLE_CCACHE=1

make -j12 && make testdata

cd ~/bisect
cat testcase.txt > ~/bisectav1/build/case

cd ~/bisectav1/build

./test_libaom --gtest_filter=case