# Utiliser l'image Ubuntu latest comme base
FROM ubuntu:latest

# Installer les dépendances nécessaires
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:ondrej/php && \
    apt-get update && \
    apt-get install -y php8.1 libapache2-mod-php8.1 apache2

# Configurer Apache pour exécuter les fichiers PHP
RUN a2enmod php8.1

# Ajouter la directive ServerName pour éviter l'avertissement
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Copier le fichier index.php dans le répertoire /var/www/html
COPY src/index.php /var/www/html/

# Exposer le port 80
EXPOSE 80

# Lancer Apache en mode premier plan
CMD ["apache2ctl", "-D", "FOREGROUND"]
