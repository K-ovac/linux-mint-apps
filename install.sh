set -e
sudo -v

while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "=== Updating the APT package manager ==="
sudo apt update && sudo apt upgrade -y

echo "=== Installing Apt programs ==="
sudo apt install -y git htop gparted mangohud 

echo "=== Installing Flatpak programs ==="
flatpak install flathub md.obsidian.Obsidian -y
flatpak install flathub org.telegram.desktop -y
flatpak install flathub net.lutris.Lutris -y
flatpak install flathub net.davidotek.pupgui2 -y
flatpak install flathub org.openrgb.OpenRGB -y
flatpak install flathub com.discordapp.Discord -y
flatpak install flathub org.flameshot.Flameshot -y

echo "=== Configuring MangoHud globally ==="
mkdir -p ~/.config/mangohud
cat << 'CONFIG' > ~/.config/mangohud/MangoHud.conf
fps
cpu_stats
gpu_stats
ram
vram
temperature
hud_position=top-left
toggle_hud=F12
CONFIG
mangohud --dlsym

cat <<EOF
Полезные ссылки:
	amdgpu_top: https://github.com/Umio-Yasuno/amdgpu_top
	vs_code: https://code.visualstudio.com/
	llama.cpp: https://github.com/ggml-org/llama.cpp
	happ: https://github.com/Happ-prohapp-desktop

Для лейаута функциональных кнопок окон использовать:
	gsettings set org.cinnamon.desktop.wm.preferences button-layout 'close,minimize,maximize:'
	
Для темы кнопок скачать в cinnamon-settings themes #напр. Mojave или WhiteSur как в macos:
	gsettings set org.cinnamon.interface gtk-theme 'ИМЯ_ТЕМЫ'

* Оверлей MangoHud включен глобально. Вкл/Выкл в игре на кнопку F12.
EOF
