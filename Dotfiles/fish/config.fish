alias pass="~/.config/fish/password_grep.sh"
alias c="cargo r"
alias b="cargo b"
starship init fish | source

alias m-dlp="sh ~/.config/zhad_scripts/music_downloader.sh"
#Alias for backlight
alias on='/usr/local/bin/backlight.sh on'
alias off='/usr/local/bin/backlight.sh off'

abbr --erase z &>/dev/null
alias z=__zoxide_z

abbr --erase zi &>/dev/null
alias zi=__zoxide_zi
zoxide init fish | source
alias zed="zed ."
