# Image de base Ubuntu avec Python
FROM ubuntu:24.04

# Évite les prompts interactifs lors de l'installation
ENV DEBIAN_FRONTEND=noninteractive

# Installation de Python et pip
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*

# Répertoire de travail dans le conteneur
WORKDIR /app

# Copie des dépendances en premier (cache Docker)
COPY requirements.txt .

# Installation des dépendances Python
RUN pip3 install --no-cache-dir --break-system-packages -r requirements.txt

# Copie du code source
COPY . .

# Port exposé par Streamlit
EXPOSE 8501

# Healthcheck pour vérifier que l'app tourne
HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health || exit 1

# Lancement de l'app
CMD ["python3", "-m", "streamlit", "run", "app.py", \
     "--server.port=8501", \
     "--server.address=0.0.0.0", \
     "--server.headless=true"]