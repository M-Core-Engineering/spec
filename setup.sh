#!/bin/bash

# Couleurs pour la lisibilité
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${CYAN}--- Initialisation de l'écosystème EDPI (Unix) ---${NC}"

# 1. Vérification/Installation de Homebrew (macOS ou Linux)
if ! command -v brew &> /dev/null; then
    echo -e "${YELLOW}Homebrew non détecté. Installation en cours...${NC}"
    # Installation non-interactive de Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Configuration du PATH pour la session actuelle (Linux/macOS)
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
        test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    else
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo -e "${GREEN}Homebrew est déjà présent. Mise à jour...${NC}"
    brew update
fi

# 2. Vérification/Installation de Go-Task
if ! command -v task &> /dev/null; then
    echo -e "${YELLOW}Installation de Go-Task via Homebrew...${NC}"
    brew install go-task
else
    echo -e "${GREEN}Go-Task est déjà présent.${NC}"
fi

# 3. Lancement de l'orchestration principale
echo -e "${CYAN}--- Lancement de la configuration (task setup:dev) ---${NC}"
task setup:dev

echo -e "\n${GREEN}--- Setup terminé avec succès ! ---${NC}"