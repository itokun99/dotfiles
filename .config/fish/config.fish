## Android
set -gx --export ANDROID_HOME $HOME/Android/Sdk
set -gx PATH $ANDROID_HOME/emulator $PATH
set -gx PATH $ANDROID_HOME/tools $PATH
set -gx PATH $ANDROID_HOME/tools/bin $PATH
set -gx PATH $ANDROID_HOME/platform-tools $PATH
set -gx PATH /Library/PostgreSQL/15/bin $PATH
set -gx ANDROID_AVD_HOME $HOME/.android/avd
# Golang developers might need this one 
set -xg GOPATH $HOME/gocode
set -xg PATH $HOME/.config/composer/vendor/bin $PATH
set -gx PATH /home/linuxbrew/.linuxbrew/lib/ruby/gems/3.3.0/bin $PATH
set -xg PKG_CONFIG_PATH /home/linuxbrew/.linuxbrew/bin/pkg-config $PKG_CONFIG_PATH
set -xg PKG_CONFIG_PATH /usr/share/pkgconfig $PKG_CONFIG_PATH
# set -xg PKG_CONFIG_PATH /usr/lib/x86 $PKG_CONFIG_PATH
# Python developers otherwise
set -xg PYTHONDONTWRITEBYTECODE 1
set -xg fish_tmux_autostart false
set -xg fish_tmux_autostart_once false
set -xg fish_tmux_autoconnect true
set -xg fish_tmux_autostarted false
set -Ux fish_tmux_config $HOME/.config/tmux.conf
set -gx PATH $HOME/.rbenv/bin $PATH
# JAVA Variables
set -xg JAVA_HOME $HOME/.sdkman/candidates/java/17.0.0-ms
set -xg GEM_HOME $HOME/.gem

set -xg CHROME_EXECUTABLE /usr/bin/google-chrome-stable

# Flutter
set -gx PATH $HOME/flutter-dev/flutter/bin $PATH

set -xg fish_user_paths $HOME/node_modules/.bin

# set -xg MOKITA_DIR $HOME/Documents/project/mokita-mobile
# set -xg MOKITA_APK_DIR $MOKITA_DIR/android/app/build/outputs/apk
# set -xg PATH $PATH:$HOME/.yarn/bin
# set -U fish_user_paths $HOME/.yarn/bin

# alias mokita_upload_appdebug="cd $MOKITA_APK_DIR/debug && cp app-debug.apk app-debug-dev-upgrade.apk && gdrive files upload app-debug-dev-upgrade.apk --parent=1bQO7OOXauaS9Rc7HTQFLU7AlJu9c_cOV"
# alias mokita_appdebug="cd $MOKITA_DIR && yarn build-debug && mokita_upload_appdebug && cd $MOKITA_DIR"

# set -xg OPENAI_API_KEY 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

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# pnpm
# set -gx PNPM_HOME /u
# if not string match -q -- $PNPM_HOME $PATH
#     set -gx PATH "$PNPM_HOME" $PATH
# end
# pnpm end

# php

#fish_add_path /usr/local/opt/php@8.0/bin
#fish_add_path /usr/local/opt/php@8.0/sbin

#set -gx LDFLAGS "-L/usr/local/opt/php@8.0/lib"
#set -gx CPPFLAGS "-I/usr/local/opt/php@8.0/include"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
alias android-studio="cd /opt/android-studio/bin && ./studio.sh"
alias android-emulator="cd ~/Android/Sdk/emulator && ./emulator"
alias set-cpu-governor="sudo cpupower  frequency-set --governor"
alias google-chrome="google-chrome-stable"

set -gx NVM_DIR $HOME/.config/nvm

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
set -x PKG_CONFIG_PATH /usr/lib/pkgconfig $PKG_CONFIG_PATH

function nvm
    bash -c "source $NVM_DIR/nvm.sh; nvm $argv"
end
