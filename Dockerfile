# Utiliser l'image Ubuntu latest comme base
FROM ubuntu:latest

# Installer les dépendances nécessaires
RUN apt-get update && \
    apt-get install -y software-properties-common curl && \
    add-apt-repository ppa:ondrej/php && \
    apt-get update && \
    apt-get install -y php8.2 libapache2-mod-php8.2 apache2

# Copier le fichier index.php dans le répertoire /var/www/html
COPY index.php /var/www/html/

# Exposer le port 80
EXPOSE 80

# Lancer Apache en mode premier plan
CMD ["apache2ctl", "-D", "FOREGROUND"]