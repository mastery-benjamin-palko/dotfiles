
wal -i ~/Pictures/Wallpaper/  
sleep 0.2
gsettings set org.gnome.desktop.background picture-uri-dark "file://$(cat ~/.cache/wal/wal)"

