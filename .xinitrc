# 1. Exportar la pantalla actual antes de que i3 arranque
dbus-update-activation-environment --systemd DISPLAY XDG_CURRENT_DESKTOP=i3

# 2. Asegurar que systemd sepa dónde pintar las ventanas
systemctl --user import-environment DISPLAY XDG_CURRENT_DESKTOP

# 3. Lanzar i3 (esta línea SIEMPRE debe ir al final)
exec i3

