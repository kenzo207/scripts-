#!/bin/bash

# Script d'installation des utilitaires de base pour Linux
# Détecte automatiquement la distribution et installe les paquets appropriés

set -e

# Couleurs pour l'affichage
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

echo_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

echo_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Vérifier si le script est exécuté en tant que root
if [[ $EUID -ne 0 ]]; then
   echo_error "Ce script doit être exécuté avec les privilèges root (sudo)"
   exit 1
fi

# Détecter la distribution
detect_distro() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        DISTRO=$ID
        VERSION=$VERSION_ID
    else
        echo_error "Impossible de détecter la distribution"
        exit 1
    fi
    
    echo_info "Distribution détectée: $DISTRO $VERSION"
}

# Installation pour Ubuntu/Debian
install_debian_based() {
    echo_info "Installation pour système basé sur Debian/Ubuntu"
    
    # Mise à jour des repos
    echo_info "Mise à jour des repositories..."
    apt update
    
    # Utilitaires de base
    echo_info "Installation des utilitaires de base..."
    apt install -y curl wget apt-transport-https ca-certificates gnupg lsb-release software-properties-common
    
    # Git
    echo_info "Installation de Git..."
    apt install -y git
    
    # Docker
    echo_info "Installation de Docker..."
    if ! command -v docker &> /dev/null; then
        curl -fsSL https://get.docker.com -o get-docker.sh
        sh get-docker.sh
        rm get-docker.sh
        systemctl enable docker
        systemctl start docker
        echo_info "Docker installé avec succès"
    else
        echo_warn "Docker est déjà installé"
    fi
    
    # VS Code
    echo_info "Installation de VS Code..."
    if ! command -v code &> /dev/null; then
        wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
        install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
        echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list
        rm packages.microsoft.gpg
        apt update
        apt install -y code
    else
        echo_warn "VS Code est déjà installé"
    fi
    
    # Google Chrome
    echo_info "Installation de Google Chrome..."
    if ! command -v google-chrome &> /dev/null; then
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
        apt install -y ./google-chrome-stable_current_amd64.deb
        rm google-chrome-stable_current_amd64.deb
    else
        echo_warn "Google Chrome est déjà installé"
    fi
    
    # Spotify
    echo_info "Installation de Spotify..."
    if ! command -v spotify &> /dev/null; then
        curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | gpg --dearmor > /etc/apt/trusted.gpg.d/spotify.gpg
        echo "deb http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list
        apt update
        apt install -y spotify-client
    else
        echo_warn "Spotify est déjà installé"
    fi
    
    # Autres utilitaires
    echo_info "Installation d'utilitaires supplémentaires..."
    apt install -y \
        vim \
        htop \
        tree \
        net-tools \
        unzip \
        build-essential \
        python3 \
        python3-pip \
        nodejs \
        npm
}

# Installation pour Fedora/RHEL
install_fedora_based() {
    echo_info "Installation pour système basé sur Fedora/RHEL"
    
    # Mise à jour des repos
    echo_info "Mise à jour des repositories..."
    dnf update -y
    
    # Utilitaires de base
    echo_info "Installation des utilitaires de base..."
    dnf install -y curl wget
    
    # Git
    echo_info "Installation de Git..."
    dnf install -y git
    
    # Docker
    echo_info "Installation de Docker..."
    if ! command -v docker &> /dev/null; then
        dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
        dnf install -y docker-ce docker-ce-cli containerd.io
        systemctl enable docker
        systemctl start docker
    else
        echo_warn "Docker est déjà installé"
    fi
    
    # VS Code
    echo_info "Installation de VS Code..."
    if ! command -v code &> /dev/null; then
        rpm --import https://packages.microsoft.com/keys/microsoft.asc
        cat > /etc/yum.repos.d/vscode.repo <<EOF
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF
        dnf install -y code
    else
        echo_warn "VS Code est déjà installé"
    fi
    
    # Google Chrome
    echo_info "Installation de Google Chrome..."
    if ! command -v google-chrome &> /dev/null; then
        dnf install -y https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
    else
        echo_warn "Google Chrome est déjà installé"
    fi
    
    # Spotify
    echo_info "Installation de Spotify..."
    if ! command -v spotify &> /dev/null; then
        dnf install -y lpf-spotify-client
        echo_warn "Spotify nécessite une configuration supplémentaire sur Fedora"
    else
        echo_warn "Spotify est déjà installé"
    fi
    
    # Autres utilitaires
    echo_info "Installation d'utilitaires supplémentaires..."
    dnf install -y \
        vim \
        htop \
        tree \
        net-tools \
        unzip \
        gcc \
        python3 \
        python3-pip \
        nodejs \
        npm
}

# Installation pour Arch Linux
install_arch_based() {
    echo_info "Installation pour système basé sur Arch"
    
    # Mise à jour du système
    echo_info "Mise à jour du système..."
    pacman -Syu --noconfirm
    
    # Git
    echo_info "Installation de Git..."
    pacman -S --noconfirm git
    
    # Docker
    echo_info "Installation de Docker..."
    if ! command -v docker &> /dev/null; then
        pacman -S --noconfirm docker
        systemctl enable docker
        systemctl start docker
    else
        echo_warn "Docker est déjà installé"
    fi
    
    # VS Code
    echo_info "Installation de VS Code..."
    if ! command -v code &> /dev/null; then
        pacman -S --noconfirm code
    else
        echo_warn "VS Code est déjà installé"
    fi
    
    # Google Chrome
    echo_info "Installation de Google Chrome..."
    if ! command -v google-chrome-stable &> /dev/null; then
        # Nécessite AUR helper comme yay
        echo_warn "Chrome nécessite un AUR helper (yay/paru). Installation manuelle recommandée."
    else
        echo_warn "Google Chrome est déjà installé"
    fi
    
    # Spotify
    echo_info "Installation de Spotify..."
    if ! command -v spotify &> /dev/null; then
        echo_warn "Spotify nécessite un AUR helper. Installation manuelle recommandée."
    else
        echo_warn "Spotify est déjà installé"
    fi
    
    # Autres utilitaires
    echo_info "Installation d'utilitaires supplémentaires..."
    pacman -S --noconfirm \
        vim \
        htop \
        tree \
        net-tools \
        unzip \
        base-devel \
        python \
        python-pip \
        nodejs \
        npm
}

# Fonction principale
main() {
    echo_info "=== Script d'installation des utilitaires Linux ==="
    echo ""
    
    detect_distro
    
    case $DISTRO in
        ubuntu|debian|linuxmint|pop)
            install_debian_based
            ;;
        fedora|rhel|centos|rocky|almalinux)
            install_fedora_based
            ;;
        arch|manjaro|endeavouros)
            install_arch_based
            ;;
        *)
            echo_error "Distribution non supportée: $DISTRO"
            exit 1
            ;;
    esac
    
    echo ""
    echo_info "=== Installation terminée ==="
    echo_info "Redémarrage recommandé pour finaliser l'installation"
    echo_info "Pour ajouter votre utilisateur au groupe docker: usermod -aG docker \$USER"
}

# Exécution
main
