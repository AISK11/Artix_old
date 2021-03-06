## LOCATION:     ~/.zshrc
## AUTHOR:       AISK11
## VERSION:      1.2.3
## CREATED:      2022-04-04
## UPDATED:      2022-04-12
## DESCRIPTION:  Configuration file for shell zsh.
## DEPENDENCIES: zsh zsh-syntax-highlighting zsh-autosuggestions [zsh-completions]

################################################################################
##                           TTY FRAMEBUFFER COLORS                           ##
################################################################################
## e[P = set color; XRRGGBB, X = number of color in hex.
if [[ "$TERM" = "linux" ]]; then
    echo -en "\e]P0000000" #black
	echo -en "\e]P18B0000" #darkred
    echo -en "\e]P2008B00" #darkgreen
    echo -en "\e]P38B8B00" #brown
    echo -en "\e]P400008B" #darkblue
    echo -en "\e]P58B008B" #darkmagenta
    echo -en "\e]P6008B8B" #darkcyan
    echo -en "\e]P7cfcfcf" #lightgrey
    echo -en "\e]P88B8B8B" #darkgrey
    echo -en "\e]P9FF0000" #red
    echo -en "\e]PA00FF00" #green
    echo -en "\e]PBFFFF00" #yellow
    echo -en "\e]PC0000FF" #blue
    echo -en "\e]PDFF00FF" #magenta
    echo -en "\e]PE00FFFF" #cyan
    echo -en "\e]PFFFFFFF" #white
fi


################################################################################
##                                   CLEAR                                    ##
################################################################################
## Security clear.
clear


################################################################################
##                                   COLORS                                   ##
################################################################################
### Enable colors (with supressed aliases).
autoload -U colors && colors


################################################################################
##                               COMMAND PROMPT                               ##
################################################################################
#if [[ $(tty) == "/dev/pts"* ]]; then
if [[ "$TERM" != "linux" ]]; then
	YELLOW="#f5cd7b"
	RED="#ef2929"
	BLUE="#548cff"
	GREEN="#4e9a06"
else
	YELLOW="#ffff00"
	RED="#ff0000"
	BLUE="#0000ff"
	GREEN="#00ff00"
fi
GREY="#707070"
DARK="303030"
export PS1="%F{${YELLOW})}%n%f%F{${GREY}}@%f%F{${RED}}%M%f %F{${BLUE}}%~%f %F{${GREY}}%#%f "


################################################################################
##                              AUTO COMPLETION                               ##
################################################################################
## Enable autocompletion (with supressed alias, using zsh style).
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)

## When completion is performed, move cursor to the end of the world.
setopt ALWAYS_TO_END

## Do not autolist options on 1st tab.
setopt no_AUTO_LIST

## Do not autolist parametes on 1st tab.
setopt no_AUTO_PARAM_KEYS

## Do not complete '*' as all matches.
setopt GLOB_COMPLETE

## DONT append first menu result after first tab.
setopt no_MENU_COMPLETE


################################################################################
##                                  HISTORY                                   ##
################################################################################
## Append to history file rather then overwrite it, good with multiple zsh sessions.
setopt APPEND_HISTORY

## Timestamp for history commands in history file.
setopt EXTENDED_HISTORY

## Do not enter command to command history if is duplicate of previous command.
setopt HIST_IGNORE_DUPS

## Enter command to command history and delete all previous instnces of this command from history.
setopt HIST_IGNORE_ALL_DUPS

## Immediately write command to history file.
setopt INC_APPEND_HISTORY_TIME

## History should be shared.
setopt SHARE_HISTORY

## History file:
export HISTFILE="${HOME}/.zsh_history"

## History size.
export HISTSIZE=2000
export SAVEHIST=${HISTSIZE}


################################################################################
##                                    KEYS                                    ##
################################################################################
## Use Zsh Line Editor (default in interactive shells):
setopt ZLE
## Use vi-like controlling.
bindkey -v
## Time in 0.0X of second for another key to be pressed when reading bound multi-char sequences.
export KEYTIMEOUT=1

########################################
##              MAP KEYS              ##
########################################
## Create a zkbd compatible hash.
typeset -g -A key

key[Backspace]="${terminfo[kbs]}"
key[Insert]="${terminfo[kich1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Delete]="${terminfo[kdch1]}"
key[Shift-Tab]="${terminfo[kcbt]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"

## Setup keys.
[[ -n "${key[Backspace]}"   ]] && bindkey -- "${key[Backspace]}"    backward-delete-char
[[ -n "${key[Insert]}"      ]] && bindkey -- "${key[Insert]}"       overwrite-mode
[[ -n "${key[Up]}"          ]] && bindkey -- "${key[Up]}"           up-line-or-history
[[ -n "${key[Down]}"        ]] && bindkey -- "${key[Down]}"         down-line-or-history
[[ -n "${key[Left]}"        ]] && bindkey -- "${key[Left]}"         backward-char
[[ -n "${key[Right]}"       ]] && bindkey -- "${key[Right]}"        forward-char
[[ -n "${key[Home]}"        ]] && bindkey -- "${key[Home]}"         beginning-of-line
[[ -n "${key[End]}"         ]] && bindkey -- "${key[End]}"          end-of-line
[[ -n "${key[Delete]}"      ]] && bindkey -- "${key[Delete]}"       delete-char
[[ -n "${key[Shift-Tab]}"   ]] && bindkey -- "${key[Shift-Tab]}"    reverse-menu-complete
[[ -n "${key[PageUp]}"      ]] && bindkey -- "${key[PageUp]}"       beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"    ]] && bindkey -- "${key[PageDown]}"     end-of-buffer-or-history

## Setup keys also for VI mode.
[[ -n "${key[Backspace]}"   ]] && bindkey -M vicmd "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Insert]}"      ]] && bindkey -M vicmd "${key[Insert]}"     overwrite-mode
[[ -n "${key[Up]}"          ]] && bindkey -M vicmd "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"        ]] && bindkey -M vicmd "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"        ]] && bindkey -M vicmd "${key[Left]}"       backward-char
[[ -n "${key[Right]}"       ]] && bindkey -M vicmd "${key[Right]}"      forward-char
[[ -n "${key[Home]}"        ]] && bindkey -M vicmd "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"         ]] && bindkey -M vicmd "${key[End]}"        end-of-line
[[ -n "${key[Delete]}"      ]] && bindkey -M vicmd "${key[Delete]}"     delete-char
[[ -n "${key[Shift-Tab]}"   ]] && bindkey -M vicmd "${key[Shift-Tab]}"  reverse-menu-complete
[[ -n "${key[PageUp]}"      ]] && bindkey -M vicmd "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"    ]] && bindkey -M vicmd "${key[PageDown]}"   end-of-buffer-or-history

## Make sure that terminal is in application mode, when zle is active,
## otherwise $terminfo values are invalid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
    autoload -Uz add-zle-hook-widget
    function zle_application_mode_start { echoti smkx }
    function zle_application_mode_stop  { echoti rmkx }
    add-zle-hook-widget -Uz zle-line-init   zle_application_mode_start
    add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi


################################################################################
##                                  GLOBBING                                  ##
################################################################################
## Also treat '^', '#' and '~' as globbing.
setopt EXTENDED_GLOB

## Do not match dotfiles.
setopt no_GLOB_DOTS

## Support commands with '#' (comment) at the end, eg $(ls -a # list everything).
setopt interactivecomments


################################################################################
##                             CHANGE DIRECTORIES                             ##
################################################################################
## Auto cd to dir when non-exec file specified (cd is automatically written).
setopt AUTO_CD

## When cd, push directory to the directory stack.
setopt AUTO_PUSHD

## Ignore multiple copies of the same dir on the stack.
setopt PUSHD_IGNORE_DUPS

## Pushd with no arguments ack like pushd ${HOME}.
setopt PUSHD_TO_HOME

## Do not print directory (cd -).
setopt CD_SILENT

## Do not print directroy stack after pushd or popd
setopt PUSHD_SILENT


################################################################################
##                       VARIABLES, ALIASES & FUNCTIONS                       ##
################################################################################
########################################
##             VARIABLES              ##
########################################
## Add access to root binaries.
export PATH="${PATH}:/sbin:/usr/sbin:${HOME}/bin"

## Interpret colors in 'less'.
export LESS='-R --use-color -Dd+r$Du+b'

## Do not create '~/.lesshst' file.
export LESSHISTFILE=-

########################################
##              ALIASES               ##
########################################
## Auto colors.
#COLOR_MODE="auto"  ## does not persist colors when piped/redirected
COLOR_MODE="always" ## persist colors when piped/redirected

## Aliases with colors.
alias ls="ls --color=${COLOR_MODE}"
alias grep="grep --color=${COLOR_MODE}"
alias egrep="egrep --color=${COLOR_MODE}"
alias diff="diff --color=${COLOR_MODE}"
alias ip="ip --color=${COLOR_MODE}"
alias dmesg="dmesg --color=${COLOR_MODE}"
alias tree='tree -C'

## Aliases.
alias mtr='mtr -t'
alias nvrun='__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia'
alias ydl_mp3_song='youtube-dl --ignore-errors --format bestaudio --extract-audio --audio-format mp3 --audio-quality 0 --output "%(title)s.%(ext)s" --no-playlist'
alias ydl_mp3_playlist='youtube-dl --ignore-errors --format bestaudio --extract-audio --audio-format mp3 --audio-quality 0 --output "%(title)s.%(ext)s" --yes-playlist'
alias ydl_flac_song='youtube-dl --ignore-errors --format bestaudio --extract-audio --audio-format flac --audio-quality 0 --output "%(title)s.%(ext)s" --no-playlist'
alias ydl_flac_playlist='youtube-dl --ignore-errors --format bestaudio --extract-audio --audio-format flac --audio-quality 0 --output "%(title)s.%(ext)s" --yes-playlist'

########################################
##             FUNCTIONS              ##
########################################
## See how much RAM process uses.
## Usage: $(mem <REGEX>)
mem()
{
    ps -eo rss,pid,euser,args --sort %mem | grep -i $@ | grep -v grep | awk '{printf $1/1024 "MB"; $1=""; print }'
}

flac_to_mp3()
{
	FILE="${1}"
	[[ "${1}" =~ '\.flac$' ]] &&
	NO_EXT=$(basename ${FILE} | rev | cut -d '.' -f 2- | rev)
	echo "Converting '${1}'." &&
	## https://stackoverflow.com/questions/26109837/convert-flac-to-mp3-with-ffmpeg-keeping-all-metadata
	ffmpeg -i "${1}" -ab 320k -map_metadata 0 -id3v2_version 3 -loglevel quiet "${NO_EXT}.mp3" &&
	echo "Converted to '${NO_EXT}.mp3'." ||
	echo "ERROR!"
}


################################################################################
##                                    XORG                                    ##
################################################################################
## Run Xorg on tty1 if there is no display.
if [[ -z ${DISPLAY} ]] && [[ $(tty) = '/dev/tty1' ]]; then
	source /etc/profile
	startx
fi


################################################################################
##                                 EXTENSIONS                                 ##
################################################################################
## Autosuggest commands from the history.
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

## Syntax highlighting.
## Highlight options: https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html#Character-Highlighting
## Colors: 0-15 (see '~/.Xresources')
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## Allowed categories.
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern regexp cursor)


########################################
##               CURSOR                #
########################################
ZSH_HIGHLIGHT_STYLES[cursor]='fg=15' ## white




#ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout



#ZSH_HIGHLIGHT_STYLES[default]=none
#ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold
#ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
#ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
#ZSH_HIGHLIGHT_STYLES[global-alias]=fg=magenta
#ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
#ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
#ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
#ZSH_HIGHLIGHT_STYLES[path]=underline
#ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
#ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
#ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
#ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
#ZSH_HIGHLIGHT_STYLES[command-substitution]=none
#ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta
#ZSH_HIGHLIGHT_STYLES[process-substitution]=none
#ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta
#ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=magenta
#ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=magenta
#ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
#ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
#ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
#ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
#ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
#ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
#ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta
#ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta
#ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta
#ZSH_HIGHLIGHT_STYLES[assign]=none
#ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
#ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
#ZSH_HIGHLIGHT_STYLES[named-fd]=none
#ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
#ZSH_HIGHLIGHT_STYLES[arg0]=fg=green
#ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
#ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
#ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
#ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
#ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
#ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold

