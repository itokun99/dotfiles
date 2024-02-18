## Android
set -gx --export ANDROID_HOME $HOME/Library/Android/Sdk
set -gx PATH $ANDROID_HOME/emulator $PATH;
set -gx PATH $ANDROID_HOME/tools $PATH;
set -gx PATH $ANDROID_HOME/tools/bin $PATH;
set -gx PATH $ANDROID_HOME/platform-tools $PATH;
set -gx PATH /Library/PostgreSQL/15/bin $PATH;

# Golang developers might need this one 
set -xg GOPATH $HOME/gocode

# Python developers otherwise
set -xg PYTHONDONTWRITEBYTECODE 1
set -xg fish_tmux_autostart false
set -xg fish_tmux_autostart_once false
set -xg fish_tmux_autoconnect true
set -xg fish_tmux_autostarted false
set -Ux fish_tmux_config $HOME/.config/tmux.conf

# JAVA Variables
set -xg JAVA_HOME /Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home
set -xg GEM_HOME $HOME/.gem

set -xg fish_user_paths $HOME/node_modules/.bin

set -xg MOKITA_DIR $HOME/Documents/project/mokita-mobile
set -xg MOKITA_APK_DIR $MOKITA_DIR/android/app/build/outputs/apk
# set -xg PATH $PATH:$HOME/.yarn/bin
# set -U fish_user_paths $HOME/.yarn/bin

alias mokita_upload_appdebug="cd $MOKITA_APK_DIR/debug && cp app-debug.apk app-debug-dev-upgrade.apk && gdrive files upload app-debug-dev-upgrade.apk --parent=1bQO7OOXauaS9Rc7HTQFLU7AlJu9c_cOV"
alias mokita_appdebug="cd $MOKITA_DIR && yarn build-debug && mokita_upload_appdebug && cd $MOKITA_DIR"

set -xg OPENAI_API_KEY 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


if status is-interactive
    # Commands to run in interactive sessions can go here
end

# pnpm
set -gx PNPM_HOME "/Users/aleph/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
