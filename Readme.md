z.vim
=====

This repo is fork from [hkjels](https://github.com/hkjels/z.vim)  

Z.vim is a wrapper around the CLI `z`. It will allow you to jump
between your projects with ease. If your not familiar with
[z](https://github.com/rupa/z), you should have a look.


## Installation

You'll need to have `z` installed and use your login shell with vim.
I recommend installing `z.vim` using vundle.

    bundle 'tenfyzhong/z.vim'


## Usage

    :Z regex [regex, ..]

Will cd into the directory specified.

    :Zl [regex]

Same as calling `z -l` from the command-line except the list is
interactive. You can navigate the list like a normal buffer. However:

* `enter` Sets directory as CWD
* `s` Opens the directory in a new window
* `v` Opens the directory in a new vertically-split window


## License

(The MIT License)

Copyright (c) 2013 Henrik Kjelsberg &lt;hkjels@me.com&gt;

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

