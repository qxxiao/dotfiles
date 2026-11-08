# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# 主题设置
# 主题列表在 ~/.oh-my-zsh/themes/
# ZSH_THEME="robbyrussell"
ZSH_THEME="astro"

# 大小写敏感
# CASE_SENSITIVE="true"

# sensitive completion must be off. _ and - will be interchangeable.
# 如果想要连接符不敏感，可以取消注释下面的一行。_ 和 - 将可以互换
# HYPHEN_INSENSITIVE="true"

# 如果不想要自动更新，可以取消注释下面的一行
DISABLE_AUTO_UPDATE="true"

# 自动更新的时间间隔，单位是天，这里设置 30 天更新一次
# export UPDATE_ZSH_DAYS=30
DISABLE_MAGIC_FUNCTIONS="true"

# 如果不想要 ls 命令输出带颜色
# DISABLE_LS_COLORS="true"

# 是否禁止更改终端标题,不要禁止,不然所有终端tab只显示zsh了,而不随着目录的改变而改变显示
# DISABLE_AUTO_TITLE="true"

# 自动纠正命令,不启用,不怎么好用
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# 按tab键补全命令的时候,如果没什么可补全的就会出现三个红点
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# 历史命令日期显示格式
# 有三种方式: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"，
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git history history-substring-search web-search autojump pip npm sudo zsh-autosuggestions last-working-dir wd zsh-syntax-highlighting)

# for autojump plugin
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
source $ZSH/oh-my-zsh.sh

##################################################
# User configuration
#

# brew 源可以设置为国内腾讯云，阿里云;为了更新实效性采用原地址
# cd "$(brew --repo)"
# git remote set-url origin https://mirrors.aliyun.com/homebrew/brew.git
# cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
# git remote set-url origin https://mirrors.aliyun.com/homebrew/homebrew-core.git
# homebrew bottle
# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles


# terminal proxy
export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890

# export LANG=en_US.UTF-8

alias vi='nvim'
alias ll='ls -l'
alias la='ls -a'
alias gcc='gcc-11'
alias g++='g++-11'
# github md插入TOC, 注意需要添加下面两个注释
# <!--ts-->
# <!--te-->
alias md-toc="/usr/local/bin/md-toc --insert" # github md插入TOC
alias tnew="tmux new -s "
alias tatt="tmux attach -t "
alias grep="grep --color=auto"
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'


# go
export PATH=$PATH:/usr/local/Cellar/go@1.18.1/bin
export GOROOT="/usr/local/Cellar/go@1.18.1/libexec"
export GOPATH="/Users/xiao/go"
export GO111MODULE=on
export PATH=$PATH:/Users/xiao/go/bin

# idea goland ...
export PATH=$PATH:/Users/xiao/Documents/jetbrains_start_cmd

# sublime text
alias st='/Applications/Sublime\ Text.app/Contents/MacOS/sublime_text '

