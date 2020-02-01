#!/bin/zsh
# Path to your oh-my-zsh installation.{{{
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"
# Uncomment the following line to disable auto-setting terminal title.

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# Path to your oh-my-zsh installation.}}}
#slow plugins:
#plugins {{{
  # plugins=(command-not-found per-directory-history themes)
 if [[ ${skipohmyzsh:-0} -ne 1 ]]
 then
   plugins=(
     $plugins[@]
     brew
     osx
     git
     z
     extract
     docker
     globalias
     alias-tips
     zsh-syntax-highlighting
     zsh-completions
     zsh-history-substring-search
     zsh-autosuggestions
     zsh-navigation-tools
     sudo
     zsh_reload
     dirpersist
     copyfile
     fasd
   )
 fi
 source $ZSH/oh-my-zsh.sh
 #plugins }}}
 #powerlevel config {{{
 POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir newline vcs)
 POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time root_indicator background_jobs history time)
 #powerlevel config }}}

#zprezto {{{
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
   source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
#zprezto }}}

#autload zsh stuff - TODO read about it  {{{
autoload -Uz compinit && compinit
autoload -Uz run-help
autoload -Uz run-help-git
autoload -Uz run-help-svn
autoload -Uz run-help-svk
autoload -Uz zmv
#autload zsh stuff - TODO read about it  }}}

#custom plugins  {{{
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $ZSH/custom/plugins/zsh-syntax-highlighting-filetypes/zsh-syntax-highlighting-filetypes.zsh
source $ZSH/custom/plugins/fz/fz.plugin.zsh
#custom plugins  }}}

#Fasd init {{{
command -v fasd >/dev/null 2>&1 && eval "$(fasd --init auto)"
#Fasd init }}}

#plugin config {{{
export HISTORY_SUBSTRING_SEARCH_FUZZY=1
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_HIGHLIGHT_MAXLENGTH=300
export ZSH_THEME_TERM_TAB_TITLE_IDLE=-

#plugin config }}}

#unused{{{
# MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
  # if [[ -n $SSH_CONNECTION ]]; then
    #   EDITOR='vim'
    # else
      #   EDITOR='mvim'
      # fi

# Compilation flags
# ARCHFLAGS="-arch x86_64"

# ssh
# SSH_KEY_PATH="~/.ssh/rsa_id"

#eval $(thefuck --alias)
#unused}}}
#
#set paths{{{
for i in '/opt/local/bin' "$HOME/.rvm/bin" "$HOME/.npm-packages/bin" "$HOME/.cargo/bin" "$HOME/scripts"
do
  if ! echo $PATH | grep -q "$i"
  then
    PATH=$PATH:$i
  fi
done
#set paths}}}

#nvm {{{
NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
#nvm }}}

#dircolors  {{{
command -v gdircolors >/dev/null 2>&1 || alias gdircolors="dircolors"
eval "$(gdircolors -b ~/.dircolors)"
# source ~/LS_COLORS
#dircolors  }}}

#zsh options {{{
setopt clobber
unsetopt correct
#zsh options }}}

#key binds {{{
bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down
bindkey "^[l" clear-screen
#key binds }}}

#Colors {{{
red=$(tput setaf 1)
blue=$(tput setaf 4)
white=$(tput setaf 7)
green=$(tput setaf 10)
yellow=$(tput setaf 3)
purple=$(tput setaf 13)
#Colors }}}

#Zsh variables {{{
export NOTES=~/mynotes
export PAGER='less -FRX'
export OLDPAGER="$PAGER"
export MANPAGER="/bin/sh -c \"unset PAGER;col -b -x | \
		 vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
		 -c 'map <SPACE> <C-D>' -c 'map b <C-U>' -c 'nmap t /^\w/<cr>z<cr>'\
		 -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""
export HISTSIZE=20000
export SAVEHIST=20000
export DISABLE_AUTO_TITLE=false
export DEFAULT_USER=`whoami`
export EDITOR=vim
export VISUAL=vim
export SHELL=`which zsh`
export LESS='-iR'
export LESSOPEN='|~/.lessfilter %s'
export ENHANCD_FILTER=fzy:fzf:peco
export HOMEBREW_NO_AUTO_UPDATE=1

#fzf varaiables {{{
export FZF_DEFAULT_COMMAND='\fd -LHtf -E ".git/"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='-e'
#fzf varaiables }}}

#ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=1
#Zsh variables }}}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#disable aliases {{{
for i in mv gl cd cp rm run-help
do
  alias $i >/dev/null&& unalias $i
done
#disable aliases }}}

#aliases {{{
alias fzf='fzf -m --cycle --tiebreak index \
  --bind "alt-e:execute-silent(echo {+} >> ~/filelist),\
alt-f:execute-silent(~/finder.sh {+}),\
alt-s:execute(ls -lh {+}),\
alt-a:execute-silent(qlmanage -p {+}  >& /dev/null),\
alt-enter:execute-silent(open {+}),\
ctrl-b:execute-silent(open -a /Applications/MacVim.app {+}),\
alt-d:select-all,shift-down:page-down,shift-up:page-up,ctrl-d:preview-page-down,ctrl-u:preview-page-up" \
  --history ~/.fzf_history --preview ''[[ $(file --mime {}) =~ binary ]] &&
  echo {} is a binary file ||
  (pygmentize {} ||
   highlight -O ansi -l {} ||
   coderay {} ||
   rougify {} ||
   cat {}) 2> /dev/null | head -500'''
alias ffzf='fzf -e +s --no-preview'
alias 1='cd ~1'
alias 2='cd ~2'
alias 3='cd ~3'
alias 4='cd ~4'
alias 5='cd ~5'
alias fd='fd -IH'
alias bi='brew install'
alias glocate='glocate -i'
command -v gls    >/dev/null 2>&1 && alias ls='gls --color=tty -Ga'
command -v ggrep  >/dev/null 2>&1 && alias grep='ggrep -i --color=auto'
command -v gsed   >/dev/null 2>&1 && alias sed='gsed'
command -v nvim   >/dev/null 2>&1 && alias vi='nvim -p'
command -v nvim   >/dev/null 2>&1 && alias vim='nvim'
command -v gsleep >/dev/null 2>&1 && alias sleep='gsleep'
alias g='grep -i'
alias kkill='kill -9 $(ps -ef | ffzf -e| awk ''{print $2}'' | sed ''s?.*/??'')'
alias hgit='alias | grep git | fzf -e'
alias smb='smbutil lookup'
alias vrc='tmux_rename VRC ; vim -p ~/.zshrc ~/.tmux.conf ~/.vimrc'
#alias fd='fd -IH'
alias tm='tmuxinator start default -n aviasd'
alias ffd="fd -LHtf -d3  -E '.git/'"
alias 5fd="fd -LHtf -d5  -E '.git/'"
alias emoj="emoji-fzf preview | fzf --preview 'echo {1} | emoji-fzf get' | cut -d \" \" -f 1 | emoji-fzf get | pbcopy"
alias hgrep='history | grep'
alias aalert='alerter -timeout 30 -message'
alias ag='ag -i -f --hidden'
alias dfd="fd -LHtd -d3  -E  '.git/'"
alias bk='brew cask install'
alias bs='brew search'
alias history='history -3000'
alias rg='rg -iN --color=always'
alias mount_avi='~/scripts/mount_avi'
alias 2rg='rg --colors=match:fg:magenta'
alias 3rg='rg --colors=match:bg:yellow'
alias j='fasd_cd -d -i'
alias pse='ps -eo pid,command'
alias vt='vi ~/.tmux.conf'
alias help='run-help'
alias getextip='curl https://ipinfo.io/ip'
alias ll='exa -la -h -snewest'
alias lls='ll -ssize --group-directories-first'
alias resnet='sudo ifconfig en0 down ; sudo ifconfig en0 up'
alias zd=zdirs
alias zzd=zzdirs
alias gh='g --'
alias ld='ls -ad {.?,}*(/)'
alias reset_wifi='sudo ~/reset_wifi.sh'
alias zord='tmux_rename ZORDER ; cd ~/work*/tmux-zord*'
alias ztmux='tmux_rename TMUX ; cd ~/work*/.tmux'
alias tmlw='tmux list-windows -t aviasd -F "#{window_index} #W #T #{pane_current_command} #{window_panes} #{window_active}"'
alias tmlk='tmux list-keys'
alias adb='/Users/localadmin/Library/Android/sdk/platform-tools/adb'
#git
alias gcmg='git add .;git commit -m'
#aliases }}}

#suffix aliases {{{
alias -s md='vim'
alias -s mp4='open'
alias -s json='vim'
#alias -s py='vim'
alias -g XV='| xargs -I{}  vim "{}"'
alias -s vim='nvim'
#suffix aliases }}}

#functions {{{
# c - browse chrome history
c() {
  local cols sep google_history open
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  if [ "$(uname)" = "Darwin" ]; then
    google_history="$HOME/Library/Application Support/Google/Chrome/Default/History"
    open=open
  else
    google_history="$HOME/.config/google-chrome/Default/History"
    open=xdg-open
  fi
  cp -f "$google_history" /tmp/h
  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  ffzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs $open > /dev/null 2> /dev/null
}
# cookies - browse chrome history
cookies() {
  local cols sep google_history open
  cols=$(( COLUMNS / 3 ))
  sep=' '

  if [ "$(uname)" = "Darwin" ]; then
    google_cookies="/Users/localadmin/Library/Application Support/Google/Chrome/Default/Cookies"
    open=open
  else
    google_cookies="$HOME/.config/google-chrome/Default/History"
    open=xdg-open
  fi
  cp -f "$google_cookies" /tmp/h
  sqlite3 -separator $sep /tmp/h \
    "select datetime(creation_utc / 1000000 + (strftime('%s', '1601-01-01')), 'unixepoch'), host_key
     from cookies order by creation_utc desc" |
  awk '{printf "%s %-'$cols's  %s\n", $1, $2,$3}' |
  ffzf --ansi --multi
}


fv() {
  local file
  file="$(fasd -Rfl "$1" | fzf -1 -0 --no-sort +m)" && vi "${file}" || return 1
}

lnf() {
  s="$1"
  t="$2"
  [[ -f $t ]] && echo "Error $t already exists.." && return 1
  [[ -f $s ]] && ln -s "$s:a" $t || echo "Error: $s is not a file"
}

gpm() {
  : ${1:?Must enter commit message}
  git add .
  git commit -am "$1"
  gp
}

_choose_option() {
  [[ -z "$1" ]] && return 0
  list=(${(@f)1})
  first="$list[1]"
  lastans=${lastans:-none}
  [[ -f "$first" ]] && dir="$first:h" || dir="$first"
  cat <<EOF | awk '/'"${lastans}.*"'\./ {print $0,"('"${yellow}last${white}"')";next} {print}'

${purple}$1${white}

Choose from the following:
  ${blue}1${white}. Cd to ${purple}$dir${white}
  ${blue}2${white}. Open in Finder $#list items.
  ${blue}3${white}. Edit with vim (${yellow}default${white})
  ${blue}4${white}. Copy to clipboard (enter prefix/suffix to delimit item with input, e.g '3)
  ${blue}5${white}. File info
  ${blue}6${white}. Export to \$A variable
  ${blue}l${white}. Last used option (${yellow}$lastans${white}) 
EOF
  printf "Please Choose: "
  read ans
  [[ $ans == "l" ]] && ans=$lastans
  case $ans in
    1)
      fcd "$1"
      ;;
    2)
      finder_open "$list[@]"
      ;;
    *4*)
      copy=(${(@f)1})
      delim=$(echo $ans | sed 's/3//')
      copy=(${delim}${^copy}${delim})
      print -n "$copy[@]" | pbcopy
      echo Copied to clip
      ;;
    5)
      file "$list[@]"
      ls -lh "$list[@]"
      ;;
    6)
      add_var "$list[@]"
      ;;
    *)
      files=(${(@f)1})
      vim -p $files[@]
      ;;
  esac
  export lastans=$ans
}

#Search in google for whatever arguments. if no arguments use the clipboard
goog() {
  url='https://www.google.com/search?q='
  for i in "$@"
  do
    open "${url}${i}"
  done
  if [[ $# -eq 0 ]];
  then
    open ${url}$(pbpaste)
  fi
}

add_var() {
  var="$1"
  for var in "$@"
  do
    for i in {A..Z};
    do
      [[ -z "${(P)i}" ]] && export $i="$var" && printf "%-15s %s\n" "$i" "$var" && break
    done
  done
}
addtobin() {
  file=$1
  bin=/usr/local/bin
  [[ ! -f $file ]] && echo $file does not exist. && return -1
  fullpath=$(greadlink -e $file)
  ln -s $fullpath $bin/$file:t
}

mynotes() {
  [[ $1 == "" ]] && vim $NOTES && return
  comment=$(cat $NOTES | grep "^#comment" | grep $1 | ffzf -0 -1 -q $1)
  [[ ! -z $comment ]] && cat $NOTES| grep "$comment" -A7 | awk 'NR==1 {print;next} /#/{exit} 1'

}

gl() {
  [[ ! -t 1 ]] && SILENT=1
  [[ $1 == "-f" ]] && shift && 1="/${1}$"
  [[ $1 == "-p" ]] && shift && 1="/${1}"
  [[ $1 == "-s" ]] && shift && 1="\.${1}$"
  1=${1:-.}
  [[ $2 == "." ]] && 2="-q `pwd`"
  aud="aac|ac3|aif|aifc|aiff|au|cda|dts|fla|flac|it|m1a|m2a|m3u|m4a|mid|midi|mka|mod|mp2|mp3|mpa|ogg|ra|rmi|spc|rmi|snd|umx|voc|wav|wma|xm"
  zip="7z|ace|arj|bz2|cab|gz|gzip|r00|r01|r02|r03|r04|r05|r06|r07|r08|r09|r10|r11|r12|r13|r14|r15|r16|r17|r18|r19|r20|r21|r22|r23|r24|r25|r26|r27|r28|r29|rar|tar|tgz|z|zip"
  doc="c|chm|cxx|doc|docm|docx|dot|dotm|dotx|pdf|potx|potm|ppam|ppsm|ppsx|pps|ppt|pptm|pptx|rtf|sldm|sldx|thmx|txt|vsd|wpd|wps|wri|xlam|xls|xlsb|xlsm|xlsx|xltm|xltx|xml"
  vid="3g2|3gp|3gp2|3gpp|amr|asf|avi|flc|flv|m1v|m2ts|m2v|m4b|m4p|m4v|mkv|mp2v|mp4|mpe|mpeg|mpg|mpv2|mov|ogm|vob|vp6|wm|wmp|wmv"
  pic="ani|bmp|gif|ico|jpe|jpeg|jpg|pcx|png|psd|tga|tif|tiff|wmf"
  case $1 in
    "aud"|"zip"|"doc"|"vid"|"pic") ARG="\.(${(P)1})$" ;;
    ".")                           ARG="`pwd`" ;;
    "dl")                          ARG="$HOME/Downloads"  ;;
    "adm")                         ARG="$HOME/"  ;;
    *)                             ARG="$1"  ;;
  esac
  shift
  RES=$(\rg -Ni $ARG ~/mydb | ffzf  $@)
  [[ -z $SILENT ]] &&
    _choose_option "$RES" ||
    echo "$RES"
  }

positional() {
  POSITIONAL=()
  while [[ $# -gt 0 ]]
  do
    key="$1"

    case $key in
      -e|--extension)
        EXTENSION="$2"
        shift # past argument
        shift # past value
        ;;
      -s|--searchpath)
        SEARCHPATH="$2"
        shift # past argument
        shift # past value
        ;;
      -l|--lib)
        LIBPATH="$2"
        shift # past argument
        shift # past value
        ;;
      --default)
        DEFAULT=YES
        shift # past argument
        ;;
      *)    # unknown option
        POSITIONAL+=("$1") # save it in an array for later
        shift # past argument
        ;;
    esac
  done
  set -- "${POSITIONAL[@]}" # restore positional parameters
}

fcd() {
  [[ $1 == "-f" ]] && finder=1 && shift
  1="$(echo "$1" | tr -d "\n" | sed 's/>//'| sed 's/^\s\+//' )"
  echo "$1"
  [[ -f "$1" ]] &&
    cd "$1:h" ||
    cd "$1"
  [[ $finder -eq 1 ]] && finder_open "$1"
}

finder_open() {
  echo Opening finder
  for i in "$@"
  do
    osascript -e "tell application \"Finder\"" -e activate -e "reveal POSIX file \""$i"\"" -e end tell
  done
}

dj() {
  RES=$(cat ~/drivej| ffzf -q "apps/mac/apps $@")
  _choose_option $RES
}

updj() {
  [[ -d /Volumes/j\$ ]] &&
    \fd  -IH --color=never . /Volumes/j\$ | LC_ALL=c gsort -f > ~/drivej ||
    echo "Error: Drive J not mounted"
  }

tmux_resource() {
  # session=$(tmux list-sessions | cut -d: -f1)
  message="src"
  tmux list-windows -F '#{window_index} #{pane_current_command}'|grep -E "zsh|tmux" | \
    cut -d\  -f1|xargs -I{} tmux send-keys -t {}.1 $message Enter
  }

subs() {
  F="$1"
  [[ -f "$F:r.he.srt" ]] && T="$F:r.he.srt" || { [[ -f "$F:r.en.srt" ]] && T="$F:r.en.srt" ; }
  test -z "$T" && echo "No srt file found" && return -1
  echo "Srt: $T"
  subsync "$F" -i $T -o $T
}

subdl() {
  lang=${2:-he}
  subliminal download  -l $2 "$1"
}

subdlall() {
  #list="./movielist"
  [[ $1 == "-n" ]] && noenglish=1 || noenglish=0
  fd | grep -E "\.(avi|mkv|m4v|mp4)" |
    while read -r line
    do
      echo "Downloading $line:t:r"
      if [[ -f  "$line:r.srt" ]]
      then
        #check if subtitles are in English
        sub="$line:r.srt"
        engcount=$(grep '[a-zA-Z]' $sub | wc -l)
        if [[ $engcount -ge 10 ]]
        then
          mv -f "$sub" "$sub:r.en.srt"
          subtitler "$line" --lang heb --download
          continue
        else
          echo -e "${blue}$sub is in hebrew${white}"
          continue
        fi
      fi
      subtitler "$line" --lang heb --download | grep "Search results found" | grep "0"
      [[ $? -eq 0 && $noenglish -eq 0 && ! -f "$line:r.en.srt" ]] &&
        subtitler "$line" --lang eng --download
      done
      #rm $list
    }

  fixsubtitles() {
    list="./movielist"
    fd | grep -E "avi|mkv|m4v|mp4" |
      while read -r line
      do
        echo "Renaming $line"
        episode=$(echo $line | sed 's/.*e\([0-9][0-9]\).*/\1/i')
        srt=$(ls -1 *.srt | grep -E "${episode}[\. ]")
        #echo srt:$srt
        if [[ $(echo $srt | wc -l) -eq 1 && $srt != "" ]]
        then
          #echo Srt found: $srt
          [[ $srt:r != $line:r ]] && \mv -f $srt $line:r.srt
        else
          echo "${red}Notice: srt not found for ${line}${white}"
          #echo episode:$episode
        fi
      done
    }

  extractsubtitles() {
    list="./movielist"
    fd | grep -E "avi|mkv|m4v|mp4" |
      while read -r line
      do
        srt="$line:r.en.srt"
        echo "File: $line"
        ffmpeg -y -i "$line" -map 0:s:0 "$srt" </dev/null
        sed -i 's/.*">//;s/<.*>//' "$srt"
      done
      #rm $list
    }

  viw() {
    fp=$(which "$1")
    file "$fp"
    read
    vi "$fp"
  }

zdirs() {
  zdirs="~/.myzdirs"
  [[ $1 == "-d" ]] && vim $zdirs && return
  if [[ $1 == "" ]]
  then
    fcd "$(cat $zdirs | ffzf )"
  else
    fcd "$(cat $zdirs | ffzf -1 -q $1)"
  fi
}

is_mac() {
  uname -sp | grep -q darwin && return 0 || return 1
}

is_cygwin() {
  uname -sp | grep -qi cygwin && return 0 || return 1
}

monitor_clipboard() {
  SCR="$HOME/.dotfiles/monitorClipboard.applescript"
  LOG="/tmp/$SCR:t.log"
  if is_mac
  then
    [[ $1 == "-k" ]] &&  kill -9 $(ps -ef | grep "osascript $SCR" | grep -v grep |awk '{print $2}')
    ps -ef | grep "osascript $SCR" | grep -qv grep && return 0
    echo `date` starting >> $LOG
    nohup osascript $SCR >>$LOG 2>&1 &
  fi
}

zzdirs() {
  zdirs="~/.zdirs"
  [[ $1 == "-d" ]] && vim $zdirs && return
  if [[ $1 == "" ]]
  then
    fcd "$(cat "$zdirs" |  ffzf )"
  else
    fcd "$(cat $zdirs |  ffzf -1 -q $1)"
  fi
}

adddir() {
  zdirs="~/.myzdirs"
  pwd >> $zdirs
  sort $zdirs | uniq - $zdirs
  #\mv -f $zdirs.bak $zdirs
}

clipcmd() {
  case $1 in
    -t)
      \history -1 | sed -E 's/^\s+\w+\s+//;s/tmux //;s/\\\\//g;s/#/##/g' | pbcopy
      ;;
    +t)
      \history -1 | sed -E 's/^\s+\w+\s+//;s/^/tmux /;s/\\\\//g;s/##/#/g' | pbcopy
      ;;
    *)
      \history -1 | sed -E 's/^\s+\w+\s+//' | pbcopy
      ;;
  esac
}

addcmd() {
  if [[ $1 == "-a" ]]
  then
    if [[ -z $2 ]]
    then
      printf "Enter alias: "
      read valias
    else
      valias="$2"
    fi
    H=$(\history -1 | sed -E 's/^\s+\w+\s+//' )
    echo $valias=$H >> ~/.zshrc
  else
    \history -1 | sed -E 's/^\s+\w+\s+//' >> ~/.zshrc
  fi
  vim ~/.zshrc -c 'exec "normal Gdd''ap"' -c 'map q :q<CR>' -c 'map <SPACE> <C-D>' -c 'map b <C-U>'
}

addnote() {
  echo "" >> $NOTES
  printf "Enter comment (Leave blank for none): "
  read ans
  [[ $ans != "" ]] && echo "#comment: ${ans}" >> $NOTES
  \history | tail -1 | sed -E 's/^\s+\w+\s+//' >> $NOTES
  vim $NOTES -c 'exec "normal G{j"' -c 'map q :q<cr>' -c 'map <space> <c-d>' -c 'map b <c-u>'
}

updb () {
  sudo ~/updb.sh $*
}

aag() {
  ag --hidden --depth 2 -G "$1" "$2"
}

finder() {
  osascript -e "tell application \"Finder\"" -e activate -e "reveal POSIX file \"`pwd`/$1\"" -e end tell
}

ssh() {
  if [ "$(ps -p $(ps -p $$ -o ppid=) -o comm=)" = "tmux" ]; then
    tmux setw allow-rename off
    tmux rename-window "$(echo $* | cut -d . -f 1)"
    command ssh "$@"
    tmux setw automatic-rename "on" 1>/dev/null
    tmux setw allow-rename on
  else
    command ssh "$@"
  fi
}

tmux_rename() {
  tmux setw allow-rename off
  tmux rename-window "$1"
}

_fzf_compgen_path() {
  \fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  \fd --type d --hidden --follow --exclude ".git" . "$1"
}
#functions }}}

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
#
#run after reading dirs {{{
# setopt LOCAL_OPTIONS NO_NOTIFY NO_MONITOR
# monitor_clipboard &
# setopt LOCAL_OPTIONS NOTIFY MONITOR
#run after reading dirs }}}




