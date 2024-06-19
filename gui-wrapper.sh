#!/bin/bash

for i in {0..9}; do
    test -S $XDG_RUNTIME_DIR/discord-ipc-$i || ln -sf {app/com.discordapp.Discord,$XDG_RUNTIME_DIR}/discord-ipc-$i;
done

# fix for https://github.com/simple64/simple64/issues/437
chmod +w $XDG_CONFIG_HOME/kdeglobals
cat > $XDG_CONFIG_HOME/kdeglobals << EOF
[Development]
AutoCheckAccelerators=false
EOF

exec /app/bin/simple64-gui "$@"
