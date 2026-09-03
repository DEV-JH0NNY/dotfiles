# Muestra la lista de comandos disponibles
default:
    @just --list

# Configuracion completa desde cero (ideal para maquinas nuevas)
setup:
    @echo ">>> Instalando dependencias..."
    just install_dependencies
    @echo ">>> Instalando zinit..."
    just install_zinit
    @echo ">>> Creando symlinks..."
    just deploy_zsh
    @echo ""
    @echo "Listo. Reinicia tu terminal o ejecuta: source ~/.zshrc"

# Instalar dependencias base
install_dependencies:
    sudo pacman -S --needed --noconfirm \
        zsh \
        starship \
        zoxide \
        fzf \
        eza

# Instalar zinit (plugin manager de zsh)
install_zinit:
    bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

# Crear symlinks de los dotfiles
deploy_zsh:
    ln -sf $(pwd)/zsh/.zshrc ~/.zshrc
    @echo "Symlink creado: ~/.zshrc -> $(pwd)/zsh/.zshrc"

# Clonar la config de zsh de kevst
clone_zsh:
    rm -rf /tmp/nixos-config
    git clone https://forgejo.kevst-dev.lat/kevst-dev/nixos-config.git /tmp/nixos-config

    rm -rf zsh/

    cp -r /tmp/nixos-config/dotfiles/zsh zsh/
    rm -rf /tmp/nixos-config
