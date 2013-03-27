---
layout: post
title: Installing tsung with homebrew on osx
author: ben@coshx.com
---
##Update 2012-09-07##
Tsung 1.4.2 is compiling fine for me with Erlang R15B01 on Mountain Lion, so this post is out of date.

### Problem

I recently tried installing [tsung](http://tsung.erlang-projects.org) via homebrew on OSX Lion, but got the following error:

```bash
% brew install tsung
==> Downloading http://tsung.erlang-projects.org/dist/tsung-1.4.1.tar.gz
File already downloaded in /Users/btaitelb/Library/Caches/Homebrew
==> ./configure --prefix=/usr/local/Cellar/tsung/1.4.1
==> make
==> make install
make -C doc
make[1]: Nothing to be done for `all'.
-n build main app boot script ... 
make: *** [priv/tsung.boot] Error 1
==> Exit Status: 2
http://github.com/mxcl/homebrew/blob/master/Library/Formula/tsung.rb#L15
==> Environment
[edit: environment ommitted]

Error: Failed executing: make install 
If `brew doctor' does not help diagnose the issue, please report the bug:
    https://github.com/mxcl/homebrew/wiki/checklist-before-filing-a-new-issue
```

### Solution

I was using the latest version of erlang (R15B), so uninstalled that and rolled back to a previous version:

```bash
% brew rm erlang
Uninstalling /usr/local/Cellar/erlang/R15B...

% brew versions erlang
R15B     git checkout 12b8d77 /usr/local/Library/Formula/erlang.rb
R14B04   git checkout aedacdf /usr/local/Library/Formula/erlang.rb
R14B03   git checkout 9332ca9 /usr/local/Library/Formula/erlang.rb
R14B02   git checkout b782d9d /usr/local/Library/Formula/erlang.rb
R14B01   git checkout 0476235 /usr/local/Library/Formula/erlang.rb
R14B     git checkout 7871a99 /usr/local/Library/Formula/erlang.rb
R13B04   git checkout 31f1fab /usr/local/Library/Formula/erlang.rb
R13B03   git checkout 729f3fa /usr/local/Library/Formula/erlang.rb
R13B02-1 git checkout 0d673c6 /usr/local/Library/Formula/erlang.rb
5.7.2    git checkout e60e1d7 /usr/local/Library/Formula/erlang.rb
02       git checkout 5d7cab9 /usr/local/Library/Formula/erlang.rb
01       git checkout 1038860 /usr/local/Library/Formula/erlang.rb
R13B     git checkout d1539e3 /usr/local/Library/Formula/erlang.rb

% cd /usr/local/Library/Formula
% git checkout aedacdf /usr/local/Library/Formula/erlang.rb
% brew install erlang
% brew install tsung
==> Downloading http://tsung.erlang-projects.org/dist/tsung-1.4.1.tar.gz
File already downloaded in /Users/btaitelb/Library/Caches/Homebrew
==> ./configure --prefix=/usr/local/Cellar/tsung/1.4.1
==> make
==> make install
/usr/local/Cellar/tsung/1.4.1: 280 files, 2.8M, built in 114 seconds

```
