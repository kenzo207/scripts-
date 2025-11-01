#!/bin/bash

# Script d'installation des dépendances pour la collection de scripts
# Usage: ./install_dependencies.sh

set -e

# Couleurs
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   Installation des dépendances        ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
echo ""

# Vérifier si pip est installé
if ! command -v pip3 &> /dev/null; then
    echo -e "${RED}[!] pip3 non trouvé. Installation...${NC}"
    sudo apt install python3-pip -y
fi

# Installer les dépendances Python
echo -e "${GREEN}[*] Installation des dépendances Python...${NC}"
pip3 install -r requirements.txt

echo ""
echo -e "${YELLOW}[*] Installation des outils système supplémentaires...${NC}"

# Détecter la distribution
if [ -f /etc/os-release ]; then
    . /etc/os-release
    DISTRO=$ID
else
    echo -e "${RED}[!] Impossible de détecter la distribution${NC}"
    exit 1
fi

case $DISTRO in
    ubuntu|debian|linuxmint|pop|kali)
        echo -e "${GREEN}[+] Installation pour Debian/Ubuntu${NC}"
        
        # Pour pdf2image (conversion PDF -> images)
        echo -e "${BLUE}[*] Installation de poppler-utils (pour pdf2image)...${NC}"
        sudo apt install -y poppler-utils
        
        # Pour youtube-downloader (ffmpeg pour conversion audio)
        echo -e "${BLUE}[*] Installation de ffmpeg (pour yt-dlp)...${NC}"
        sudo apt install -y ffmpeg
        
        # Pour network sniffer (nécessite droits root)
        echo -e "${BLUE}[*] Installation de libpcap-dev...${NC}"
        sudo apt install -y libpcap-dev
        
        # Pour database manager (clients MySQL et PostgreSQL)
        echo -e "${BLUE}[*] Installation des clients de bases de données...${NC}"
        sudo apt install -y mysql-client postgresql-client
        
        ;;
    
    fedora|rhel|centos|rocky|almalinux)
        echo -e "${GREEN}[+] Installation pour Fedora/RHEL${NC}"
        
        sudo dnf install -y poppler-utils ffmpeg libpcap-devel mysql postgresql
        ;;
    
    arch|manjaro|endeavouros)
        echo -e "${GREEN}[+] Installation pour Arch Linux${NC}"
        
        sudo pacman -S --noconfirm poppler ffmpeg libpcap mariadb-clients postgresql-libs
        ;;
    
    *)
        echo -e "${YELLOW}[!] Distribution non reconnue: $DISTRO${NC}"
        echo -e "${YELLOW}[!] Installez manuellement: poppler-utils, ffmpeg, libpcap${NC}"
        ;;
esac

echo ""
echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║  Installation terminée avec succès !   ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
echo ""
echo -e "${YELLOW}Notes importantes:${NC}"
echo -e "  • Network Sniffer nécessite sudo"
echo -e "  • Database Manager nécessite mysql/postgresql clients"
echo -e "  • PDF Tools: pdf2image nécessite poppler-utils"
echo -e "  • YouTube Downloader: ffmpeg nécessaire pour audio"
echo ""
echo -e "${BLUE}Pour tester, essayez:${NC}"
echo -e "  python3 scripts/system_monitor.py"
echo -e "  python3 scripts/file_organizer.py ~/Downloads -d"
echo -e "  python3 scripts/youtube_downloader.py <URL> -i"
echo ""