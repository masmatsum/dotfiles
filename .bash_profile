
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# Memo: 環境変数は、 .bashrc ではなく .bash_profile に書く。（そのほうが普通は妥当。 参考: https://qiita.com/magicant/items/d3bb7ea1192e63fba850 )

export PATH="${PATH}:${HOME}/bin"
export HISTIGNORE='pwd:ls:ls -l:ll'


# ----- Project Specific Settings -----

