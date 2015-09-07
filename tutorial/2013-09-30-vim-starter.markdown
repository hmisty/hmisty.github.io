# VIM Starter

In this article, you will learn how to:

* Check vim version
* Install necessary vim packages (a.k.a. bundles)
* Play with vim

## VIM Version

Login to the terminal of your Linux/MacOSX system, and execute the following command:

``` bash
vi --version
```

Lots of information, including the version number, features, etc, will be printed out, like this:

``` bash
VIM - Vi IMproved 7.4b BETA (2013 Jul 28, compiled Jul 28 2013 17:02:15)
MacOS X (unix) version
Compiled by Douglas Drumond <douglas@eee19.com>
Huge version with MacVim GUI.  Features included (+) or not (-):
+arabic          +find_in_path    -mouse_sysmouse  +tag_old_static
......
```

Ensure you have VIM with version > 6.

## Bundle Install

### Install Vundle

Download vundle -- the vim bundle manager:

``` bash
curl -L -O https://github.com/gmarik/vundle/archive/master.zip
```

Unpack the zip compressed file.

``` bash
unzip master.zip
```

And copy to install it to your VIM bundle folder.

```
mkdir -p ~/.vim/bundle
mv vundle-master ~/.vim/bundle/vundle
```

Done.

### Create Your .vimrc

~/.vimrc is the start-up script for vi. Everytime you start vi, it will execute ~/.vimrc first. Here is how to create it:

``` bash
cat > ~/.vimrc
```

Paste the content below:

```
set nocompatible
filetype off	"required by vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'ervandew/supertab'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

source $VIMRUNTIME/vimrc_example.vim

set nobackup
set viminfo+=!
set modelines=1
set nu
colo desert

au WinLeave ** set nocursorline nocursorcolumn
au WinEnter ** set cursorline cursorcolumn
set cursorline cursorcolumn
```

Press Ctrl + d to finalize and save the content to ~/.vimrc

### Install Bundles

Execute the following command once and only once:

``` bash
vi +BundleInstall +qall
```

Done.

## VIM ABC

### Start and Quit

Start vim by executing the command:

``` bash
vi FILENAME
```

To **q**uit immediately, type **:q**

To **w**rite and **q**uit, type **:wq**

### Modes

Vim has 3 basic modes: Normal mode, Insert mode, and Command-line mode (a.k.a. Cmd-line mode. The most bottom line of the vim window is the command line). When vim has started, you are in the **Normal mode**. Below illustrates how to switch between the modes:

{% digraph vim modes %}
n [label="Normal mode"];
i [label="Insert mode"];
c [label="CmdLine mode"];
n -> i [label="i"];
i -> n [label="ESC"];
n -> c [label=":"];
c -> n [label="ESC"];
{% enddigraph %}

**Tip**: Consider Normal mode as the primary mode, and you can always switch back to it by pressing **ESC** key no matter what mode are you in right now.

In Normal mode, you can:

* move the cursor around
* delete texts
* press **i** key to switch to Insert mode
* press **:** key to switch to Command-line mode

In Insert mode, you can:

* type in texts
* delete texts
* press **ESC** key to switch back to Normal mode

In Cmd-line mode, you can:

* type in command and press **ENTER** key to execute it
* press **ESC** key to switch back to Normal mode

Enjoy!
