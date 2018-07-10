# GCC54-BUILD

A script to build gcc-5.4 from scratch.

## What This Does

This will try to build gcc-5.4 from scratch and install it in /usr/local/x86_64-local-gcc-5.4.0.

You could then use the executables found in /usr/local/x86_64-local-gcc-5.4.0/bin such as gcc.

## What You Need

A fairly recent Linux distribution.

Not sure which compiler is needed.

You could use your distro to install the needed toolchair or get a pre-built compiler.

## Use Linux Distro Packages

Debian users can try to run:

```
apt-get build-dep gcc
```

However, this did not work for me. It kinda creates a check and egg problem
because if your distro has the compiler you needed, why are you doing this?

## Pre-built Compiler

I actually used a pre-built compiler found here:

```
https://github.com/Zenfone2-Dev/x86_64-linaro-gcc-5.2.1.git
```

Follow the directions to install it.

I had an issue with the pre-built compiler when I used it for what I wanted it
for which was a Yocto build. This is why I decided to roll my own compiler.

However, it was good enough to build gcc-5.

## How to Use This

Read the build.sh script to make sure it does what you'd like it to do.

sh build.sh

You'll need to type in your root password at the end as we use sudo to install.

## Using


Once things are installed, you can use the tool-chain in different ways.

### Set Your Path

I like this method best. It's a simple command which allows one to use all the tools at once.

You can put this in your .bashrc file (or equivalent). Check with your shell
documentation to set this automatically.

```
export PATH=/usr/local/x86_64-local-gcc-5.4.0/bin:$PATH
```

### Call Directly

You can run the compiler directly by /usr/local/x86_64-local-gcc-5.4.0/bin/gcc
for example.

Advantage is that you can have many compilers side by side. 

Disadvantage is that you'd have to manually set all these in your build system
via a configure argument (autotools) or euqivalent.

### Symlinks

You have to be aware that if your distro installs gcc or g++ it will overwrite
your local compiler, and you'll have to restore symlinks. Also, you have to make a lot
of symlinks.

If I were going this route, I'd make the symlink step a separate, optional script.

However, I suggest setting the path, so I'll leave completing this an excercise
for the reader if they want to use more tools.

```
mv /usr/bin/gcc /usr/bin/g++ /tmp
ln -s /usr/local/x86_64-local-gcc-5.4.0/bin/gcc /usr/bin/gcc
ln -s /usr/local/x86_64-local-gcc-5.4.0/bin/g++ /usr/bin/g++
```

### Environmental Variables

Here I'm not sure if this will work with all build systems. Some might look for gcc, directly?

Also, like the symlink solution, you'll have to export variables for all the tools you'd like to use.

Use at your own risk.

```
export CC=/usr/local/x86_64-local-gcc-5.4.0/bin/gcc
```
