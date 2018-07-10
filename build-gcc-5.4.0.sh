#!/bin/bash

# die if anything goes wrong
set -e 

BUILD=build
GCC_DIR=gcc-5.4.0
ISL=isl-0.15

rm -rf $BUILD 
mkdir -p $BUILD 
tar xf src/gcc-5.4.0.tar.xz -C $BUILD
tar xf src/$ISL.tar.bz2 -C build/gcc-5.4.0
mv $BUILD/$GCC_DIR/$ISL $BUILD/$GCC_DIR/isl

mkdir -p $BUILD/$GCC_DIR/gcc-build 
cd $BUILD/$GCC_DIR/gcc-build 

../configure --prefix=/usr/local/x86_64-local-$GCC_DIR \
         --disable-multilib \
         --enable-languages=c,c++ \
         --enable-libstdcxx-threads \
         --enable-libstdcxx-time \
         --enable-shared \
         --enable-__cxa_atexit \
         --disable-libunwind-exceptions \
         --disable-libada \
         --with-default-libstdcxx-abi=gcc4-compatible

make -j13
sudo make install 
