" NeoBundleがなかったらインストール
if executable('git')

    if has('vim_starting')

        if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))

            echo "install neobundle..."
            call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")

        endif

    endif

endif

if has('vim_starting')

    set nocompatible               " vi互換を切る
    set runtimepath+=~/.vim/bundle/neobundle.vim/

endif
