#!/bin/sh
#rm -rf ~/gitvc/dotfiles/.config ~/gitvc/dotfiles/.local
mkdir ~/gitvc/dotfiles/.config ~/gitvc/dotfiles/.local ~/gitvc/dotfiles/.local/share ~/gitvc/dotfiles/.local/bin ~/gitvc/dotfiles/.config/nvim
cp -r ~/.config/fontconfig ~/gitvc/dotfiles/.config/ && cp -r ~/.config/gtk* ~/gitvc/dotfiles/.config/ && cp -r ~/.config/lf ~/gitvc/dotfiles/.config/ && cp -r ~/.config/mpv ~/gitvc/dotfiles/.config/ && cp -r ~/.config/neofetch ~/gitvc/dotfiles/.config/ && cp -r ~/.config/pulse ~/gitvc/dotfiles/.config/ && cp -r ~/.config/sxiv ~/gitvc/dotfiles/.config/ && cp -r ~/.config/zathura ~/gitvc/dotfiles/.config/ && cp ~/.config/mimeapps.list ~/gitvc/dotfiles/.config/ && cp -r ~/.config/dunst ~/gitvc/dotfiles/.config/ && cp -r ~/.config/htop ~/gitvc/dotfiles/.config/ && cp -r ~/.config/mpd ~/gitvc/dotfiles/.config/ && cp -r ~/.config/ncmpcpp ~/gitvc/dotfiles/.config/ && cp -r ~/.config/zsh ~/gitvc/dotfiles/.config/ && cp -r ~/.config/shell ~/gitvc/dotfiles/.config/ && cp -r ~/.config/wal ~/gitvc/dotfiles/.config/ && cp -r ~/.config/x11 ~/gitvc/dotfiles/.config/ && cp ~/.config/user-dirs.dirs ~/gitvc/dotfiles/.config/
cp -r ~/.local/bin ~/gitvc/dotfiles/.local
cp -r ~/.local/share/applications ~/gitvc/dotfiles/.local/share
cp -r ~/.local/share/larbs ~/gitvc/dotfiles/.local/share
#cp -r ~/.local/src ~/gitvc/dotfiles/.local/
#rm ~/gitvc/dotfiles/.local/src/st/st
#rm ~/gitvc/dotfiles/.local/src/dwm/dwm
#rm ~/gitvc/dotfiles/.local/src/
cp ~/.config/nvim/coc-settings.json ~/.config/nvim/init.vim ~/gitvc/dotfiles/.config/nvim
rm ~/gitvc/dotfiles/.config/zsh/.zcompdump ~/gitvc/dotfiles/.config/lf/shortcutrc ~/gitvc/dotfiles/.config/ncmpcpp/error.log ~/gitvc/dotfiles/.config/mpv/scripts/mpvSockets/.git
rm -rf ~/gitvc/dotfiles/.config/wal/colorschemes
cp ~/.xprofile ~/.zprofile ~/gitvc/dotfiles
