function WRITE() {
cat > ~/.zimrc <<EOF
#zim模块
zmodules=(directory environment history input utility custom \
          prompt syntax-highlighting history-substring-search )
#提示符
zprompt_theme='eriner black blue'
#终端标题
ztermtitle='%n@%m:%~'
#输入模式
zinput_mode='emacs'
#语法高亮
zhighlighters=(main brackets cursor)
EOF
mv ~/.zshrc ~/.local/yourzshrc
cat > ~/.zshrc <<EOF
export ZIM_HOME=\${PREFIX}/share/zimfw
#启用zim
[[ -s \${ZIM_HOME}/init.zsh ]]&&source \${ZIM_HOME}/init.zsh
EOF
}

function INSTALL() {
pkg in git zsh curl -y
rm -rf ${PREFIX}/share/zimfw 2> /dev/null
git clone --recursive https://github.com/zimfw/zimfw.git \
    ${PREFIX}/share/zimfw
#stylepac
tar -xzf style.tar.gz
#backup
mv ~/.termux ~/.local/termux
#enable
mv $PWD/.termux ~/.termux
$HOME/.termux/colors.sh
$HOME/.termux/fonts.sh
[ -d $PWD/.termux ]&&rm $PWD/.termux
chsh -s zsh	
}

eval INSTALL
eval WRITE
