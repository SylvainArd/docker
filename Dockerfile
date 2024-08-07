# Utiliser l'image Ubuntu latest comme base
FROM ubuntu:latest

# Installer les dépendances nécessaires
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:ondrej/php && \
    apt-get update && \
    apt-get install -y php libapache2-mod-php apache2

# Configurer Apache pour exécuter les fichiers PHP
RUN a2enmod php

# Copier le fichier index.php dans le répertoire /var/www/html
COPY index.php /var/www/html/

# Exposer le port 80
EXPOSE 80

# Lancer Apache en mode premier plan
CMD ["apache2ctl", "-D", "FOREGROUND"]