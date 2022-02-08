#################################################################################
# zgen plugin manager
#################################################################################
# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then

  # specify plugins here
    zgen oh-my-zsh
    zgen load 'wfxr/forgit'
    zgen oh-my-zsh 'powerlevel10k/powerlevel10k'
  # generate the init script from plugins above
  zgen save
fi

#################################################################################
# omz
#################################################################################
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/$USER/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# =======================================================================
# ==Alias
# =======================================================================
alias r="ranger"
alias g='googler -n 7 -c jp -l jp'
alias gvim='goneovim --maximized --nvim=/opt/homebrew/bin/nvim'
alias srch="ag --filename --hidden . ./ | fzf | sed -E 's/([^:]+):([[:digit:]]+).+/\+\2 \1/' | xargs vim"
alias pandoc="pandoc --markdown-heading=atx"
alias ri="history | fzf --tiebreak=begin,index --tac | awk '{$1=\"\"; print $0}' | zsh"
alias ls="exa"
alias wgetall="wget -m -k -p -nc -E"
alias ftcount="fd -t f . | rg '.*\\.[a-zA-Z0-9]*$' | sed -e 's/.*\\(\\.[a-zA-Z0-9]*\\)$/\\1/' | sort | uniq -c | sort -n"
alias ytdl='yt-dlp --throttled-rate 1M --user-agent "Mozilla/5.0 (Macintosh; Intel Mac OS X 12_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36"'
alias ytdlm='yt-dlp --throttled-rate 1M --user-agent "Mozilla/5.0 (Macintosh; Intel Mac OS X 12_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36" -f ba -x --audio-format mp3 --download-archive audio.txt -o '"'"'%(channel)s/%(title)s.%(ext)s'"'" 
alias dlm='yt-dlp -f ba -x --audio-format mp3 '
alias o='fileopen.sh'
alias h="showhelp.sh"
alias deepascii="~/Projects/github/DeepAA/deepascii.py"
# =======================================================================
# ==Anaconda
# =======================================================================
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH=/opt/homebrew/anaconda3/bin:"$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/akirakoizumi/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/akirakoizumi/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/akirakoizumi/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/akirakoizumi/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# =======================================================================
# ==Env Var Configs
# =======================================================================
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"
#Path to run my own script
export PATH="$PATH:/Users/$USER/bin"
export PYTHONPATH="/Users/$USER/Projects/lib"
#updated vim installed via Homebrew
export vim="/opt/homebrew/bin/vim"
#Ranger Configs
export PAGER=bat
export PROJDIR="$HOME/Projects"
export MPLBACKEND="module://matplotlib-backend-kitty"
export WEECHAT_HOME="$HOME/.weechat/plugins"
export weechat_data_dir="$HOME/.weechat"
export BAT_THEME="nord"
#
# =======================================================================
# ==FZF Configs
# =======================================================================

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--extended --tiebreak=length,begin"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g .'" ."
export FZF_CTRL_T_COMMAND="fd -t f -E '\.git/' -i -H -a . ./"
export FZF_CTRL_T_OPTS="--tiebreak=length,end"
export FZF_ALT_C_COMMAND="fd -H -t directory --base-directory $HOME/ . $HOME/"
export FZF_ALT_C_OPTS="--tiebreak=length,begin,index"
export FZF_CTRL_R_OPTS="--tiebreak=begin,end,index"
# =======================================================================
# ==Search Browser History
# =======================================================================
ch() {
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  cp -f ~/Library/Application\ Support/BraveSoftware/Brave-Browser/Default/History /tmp/h

  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs open
}

# =======================================================================
# == FZF Search Epub
# =======================================================================
ff() {
    local file
    FD_PREFIX="fd -H -t file"
	file="$(
		FZF_DEFAULT_COMMAND="$FD_PREFIX '$1' ." \
			fzf --sort --preview="bat {}" \
                --phony -q "$1" \
				--bind "change:reload:$FD_PREFIX {q} . || true" \
				--preview-window="70%:wrap"
                --ansi
	)" &&
	echo "opening $file" &&
	open "$file"
}
fwf() {
    local file
    RG_PREFIX="ag -l"
	file="$(
        INITIAL_QUERY="."
		FZF_DEFAULT_COMMAND="$RG_PREFIX -G '$1' $INITIAL_QUERY 2>/dev/null" \
			fzf --multi --sort --preview="[[ ! -z {} ]] && rg -A 5 -N -p {q} {}" \
                --phony \
                -q $INITIAL_QUERY \
				--bind "change:reload:$RG_PREFIX -G '$1' {q} || true" \
				--preview-window="70%:wrap" \
                --ansi
                #--bind "change:select-all" \
	)" &&
	echo "opening $file" &&
	open "$file" 2>/dev/null
}
fif() {
    local file
    RG_PREFIX="ag -l"
	file="$(
		FZF_DEFAULT_COMMAND="$RG_PREFIX '$1' 2>/dev/null" \
			fzf --multi --sort --preview="[[ ! -z {} ]] && rg -A 5 -N -p {q} {}" \
                --phony \
                -q $1 \
				--bind "change:reload:$RG_PREFIX {q} || true" \
				--preview-window="70%:wrap" \
                --ansi
	)" &&
	echo "opening $file" &&
	open "$file" 2>/dev/null
}

source /Users/akirakoizumi/.config/broot/launcher/bash/br
eval "$(zoxide init zsh)"

#################################################################################
# DBUS config for Signal Cli
#################################################################################
#brew services restart dbus
export DBUS_LAUNCHD_SESSION_BUS_SOCKET=$(launchctl getenv DBUS_LAUNCHD_SESSION_BUS_SOCKET)
export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/usr/local/var/run/dbus/system_bus_socket
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/library/
export MYPUBKEY="age1nxgxw604kl0ymdyk0q6ltdst2j2kdykjg3s8nguxav00k75j8a3qpjuz4q"

#################################################################################
# The Fuck
#################################################################################
eval $(thefuck --alias)


# JINA_CLI_BEGIN

## autocomplete
if [[ ! -o interactive ]]; then
    return
fi

compctl -K _jina jina

_jina() {
  local words completions
  read -cA words

  if [ "${#words}" -eq 2 ]; then
    completions="$(jina commands)"
  else
    completions="$(jina completions ${words[2,-2]})"
  fi

  reply=(${(ps:\n:)completions})
}

# session-wise fix
ulimit -n 4096
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# JINA_CLI_END
