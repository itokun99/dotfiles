## Android
set -gx ANDROID_HOME $HOME/Library/Android/Sdk
set -gx ANDROID_AVD_HOME $HOME/.android/avd

# Menggunakan fish_add_path untuk kebersihan dan keamanan
fish_add_path $ANDROID_HOME/emulator
fish_add_path $ANDROID_HOME/tools
fish_add_path $ANDROID_HOME/tools/bin
fish_add_path $ANDROID_HOME/platform-tools

## Development Environments
# Golang
set -gx GOPATH $HOME/gocode

# Ruby (via rbenv)
fish_add_path $HOME/.rbenv/bin
rbenv init - | source
set -gx GEM_HOME $HOME/.gem # ruby gems

# Python
set -gx PYTHONDONTWRITEBYTECODE 1

## TMUX Autostart Plugin
set -xg fish_tmux_autostart false
set -xg fish_tmux_autostart_once false
set -xg fish_tmux_autoconnect true
set -xg fish_tmux_autostarted false
set -Ux fish_tmux_config $HOME/.config/tmux.conf

## zoxide init
zoxide init fish | source

# -- Manajemen SSH Agent --

# Cek apakah agent sudah berjalan
if not set -q SSH_AUTH_SOCK
    # Mulai agent dan atur variabelnya menggunakan sintaks fish
    ssh-agent -c | source
end

# Tambahkan kunci jika belum ada di agent
if not ssh-add -l >/dev/null
    ssh-add ~/.ssh/devmokitassh
    ssh-add ~/.ssh/itossh
end

# -- Inisialisasi Perkakas Lain --

# zoxide
zoxide init fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# default editor fish
set -gx EDITOR nvim
set -gx VISUAL nvim

# clear log
# clear
