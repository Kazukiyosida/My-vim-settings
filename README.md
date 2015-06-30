#dotfiles

## VIM

Vimの設定ファイル

###Windows用

・Windowsでプラグインのインストール、実行に失敗するとき

  システムのvimrcに
	let $HOME = "C:/VIM/"
  を追記することで解決。

・runpde.BATについて
:Quickrun用
PROCESSINGの.pdeファイルをコンパイルし、C:\libraly\processingに出力、実行するものです。processing-java.exeにパスが通ってないと失敗します。

###Unix用
  Ubuntuで動かす用

cmigemoが必要です。

## Emacs

Emacsの設定ファイル

　Ubuntu用なので特に制限なし

Emacs24.4以上とcmigemoとanything-c-moccurが必要です。

##License
MIT license
