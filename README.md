# ko31’s dotfiles

## Quick Setup Vim

1. Setup dotfiles:

    ```
    $ cd ~
    $ git clone https://github.com/ko31/dotfiles.git
    ```

2. Setup symbolic link:

    ```
    $ ln -s ~/dotfiles/vim/.vimrc ~/
    $ ln -s ~/dotfiles/vim/.vim ~/
    ```

3. Setup Vundle:

    ```
    $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    ```

4. Install configured bundles:

Launch `vim`, run `:BundleInstall` 

Thanks to...

* https://github.com/gmarik/vundle/
* http://vim-users.jp/2011/04/hack215/
