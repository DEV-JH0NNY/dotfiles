# dotfiles

Configuracion personal de entorno para Arch Linux / WSL.

## Que incluye

| Herramienta | Proposito |
|---|---|
| `zsh` | Shell principal |
| `zinit` | Plugin manager de zsh |
| `starship` | Prompt minimalista |
| `zoxide` | Reemplazo de `cd` con historial inteligente |
| `fzf` | Buscador fuzzy interactivo |
| `eza` | Reemplazo moderno de `ls` |

### Plugins de zsh

- `zsh-autosuggestions` — sugiere comandos mientras escribes
- `zsh-vi-mode` — modo vim en la terminal
- `zsh-you-should-use` — te recuerda cuando existe un alias para un comando
- `zsh-syntax-highlighting` — colorea comandos validos e invalidos

### Scripts FZF

| Alias | Descripcion |
|---|---|
| `gco` | Checkout de rama con selector fuzzy |
| `gbd` | Eliminar ramas locales con selector fuzzy |
| `glog` | Historial de commits con preview |
| `cc` | Conectar a un contenedor Docker/Podman |

Key bindings activos: `Ctrl+R` (historial), `Ctrl+T` (archivos), `Alt+C` (directorios)

## Instalacion en una maquina nueva

### 1. Instalar `just` (task runner)

```bash
sudo pacman -S --needed --noconfirm just
```

### 2. Clonar el repositorio

```bash
git clone https://github.com/tu-usuario/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 3. Ejecutar setup

```bash
just setup
```

Esto hace automaticamente:
- Instala las dependencias (`zsh`, `starship`, `zoxide`, `fzf`, `eza`)
- Instala `zinit` (plugin manager)
- Crea el symlink `~/.zshrc` → `~/dotfiles/zsh/.zshrc`

### 4. Cambiar el shell por defecto a zsh

```bash
chsh -s $(which zsh)
```

Luego cierra y vuelve a abrir la terminal.

> Los plugins de zinit se instalan automaticamente la primera vez que abres zsh.

## Comandos disponibles

```bash
just           # lista todos los comandos
just setup     # configuracion completa desde cero
just install_dependencies  # solo instala paquetes
just install_zinit         # solo instala zinit
just deploy_zsh            # solo crea el symlink de .zshrc
```

## Estructura

```
dotfiles/
├── justfile          # comandos de automatizacion
├── README.md
└── zsh/
    ├── .zshrc        # config principal (symlinkeado a ~/.zshrc)
    ├── aliases.zsh   # aliases de ls, cd y git
    ├── history.zsh   # configuracion del historial
    ├── prompt.zsh    # inicializa starship
    └── fzf/
        ├── init.zsh              # aliases y key bindings de fzf
        ├── git-checkout.bash     # script gco
        ├── git-branch-delete.bash # script gbd
        ├── git-log.bash          # script glog
        └── container-connect.bash # script cc
```
