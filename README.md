# ko31’s dotfiles

## Quick Setup Vim

1. Setup dotfiles:

    ```
    cd ~
    git clone https://github.com/ko31/dotfiles.git
    ```

2. Setup symbolic link:

    ```
    ln -s ~/dotfiles/vim/.vimrc ~/
    ln -s ~/dotfiles/vim/.vim ~/
    ```

3. Setup vim-plug:

    ```
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```

4. Install plugins:

Launch `vim`, run `:PlugInstall` 

Thanks to...

* [junegunn/vim-plug: Minimalist Vim Plugin Manager](https://github.com/junegunn/vim-plug)
