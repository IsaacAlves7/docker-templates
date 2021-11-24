############################################ Docker WebStacks - Dockerfile and Docker Compose Templates #######################################################
                                              
    _/        _/_/_/_/  _/      _/  _/_/_/    
   _/        _/        _/_/  _/_/  _/    _/   
  _/        _/_/_/    _/  _/  _/  _/_/_/      
 _/        _/        _/      _/  _/           
_/_/_/_/  _/_/_/_/  _/      _/  _/            
                                                                      
# DOCKERFILE: L.E.M.P - Linux (Ubuntu, Fedora, CentOS, Debian) + NGINX + (MySQL) + (PHP)

FROM php:7.4-fpm
WORKDIR /var/www/html
ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/
RUN apt-get update && apt-get install -y \
    chmod ugo+x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions pdo pdo_mysql gd zip exif
RUN docker-php-ext-install mysqli pdo pdo_mysql exif
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composerdoc

# DOCKER-COMPOSE: L.E.M.P - Linux (Ubuntu, Fedora, CentOS, Debian) + NGINX + (MySQL) + (PHP)

version: '3'

networks: 
   lemp: # bridge (default) ou overlay ou host

services:
    nginx:
        image: nginx:latest
        container_name: nginx_lemp
        ports:
            - "7000:80" 
        volumes:
            - ./src:/var/www/html
            - ./nginx/nginx.conf:/etc/nginx/conf.d/default.conf
        depends_on: 
            - php
            - mysql
        networks:
            - lemp
        
    mysql:
        image: mysql
        container_name: mysql_lemp
        restart: unless-stopped
        tty: true
        ports:
          - "9306:3306"
        environment:
          MYSQL_DATABASE: lemp_db
          MYSQL_USER: lemp_db
          MYSQL_PASSWORD: 1234567
          MYSQL_ROOT_PASSWORD: 1234567
          SERVICE_TAGS: dev
          SERVICE_NAME: mysql
        networks:
            - lemp
        volumes:
          - ./mysql:/var/lib/mysql
       
    php:
       build:
         context: .
         dockerfile: Dockerfile
       container_name: php_lemp
       volumes:
         - ./src:/var/www/html
       ports:
         - "9004"
       networks:
         - lemp

# .DOCKERIGNORE: 

.node_modules/

--------------------------------------------------------------------------------------------------------------------------
# DOCKERFILE: L.E.M.P - Linux (Ubuntu, Fedora, CentOS, Debian) + NGINX + (MariaDB) + (PHP)

FROM php:7.4-fpm
WORKDIR /var/www/html
ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/
RUN apt-get update && apt-get install -y \
    chmod ugo+x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions pdo pdo_mysql gd zip exif
RUN docker-php-ext-install mysqli pdo pdo_mysql exif
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composerdoc

# DOCKER-COMPOSE: 

version: '3'

networks: 
   lemp:
   
services:
    php:
        build:
            context: .
            dockerfile: Dockerfile
        container_name: php_lemp
        volumes:
            - './app:/var/www/html'
        ports:
            - "9004"
        depends_on:
            - mariadb
        networks:
            - lemp

    nginx:
        image: nginx:latest
        container_name: nginx_lemp
        ports:
            - "7000:80" 
        volumes:
            - ./src:/var/www/html
            - ./nginx/nginx.conf:/etc/nginx/conf.d/default.conf
        depends_on: 
            - php
            - mysql
        networks:
            - lemp

    mariadb:
        image: mariadb:10.3.9
        container_name: mariadb_lemp
        restart: 'on-failure'
        ports:
          - "9306:3306"
        environment:
          MYSQL_ROOT_PASSWORD: 1234567
        networks:
            - lemp
        volumes:
          - ./mariadb:/var/lib/mariadb

# .DOCKERIGNORE: 

.node_modules/ 

--------------------------------------------------------------------------------------------------------------------------
# DOCKERFILE: L.E.M.P - Linux (Ubuntu, Fedora, CentOS, Debian) + NGINX + (MySQL) + (Python)

FROM python:latest
WORKDIR /var/www/html
ADD 
RUN chmod ugo+x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions pdo pdo_mysql gd zip exif
RUN docker-php-ext-install mysqli pdo pdo_mysql exif
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composerdoc

# DOCKER-COMPOSE: 

# .DOCKERIGNORE: 

--------------------------------------------------------------------------------------------------------------------------
# DOCKERFILE: L.E.M.P - Linux (Ubuntu, Fedora, CentOS, Debian) + NGINX + (MySQL) + (Python)

FROM python:latest
WORKDIR /var/www/html
ADD 
RUN chmod ugo+x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions pdo pdo_mysql gd zip exif
RUN docker-php-ext-install mysqli pdo pdo_mysql exif
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composerdoc

# DOCKER-COMPOSE: 

# .DOCKERIGNORE: 

==========================================================================================================================

_|          _|_|    _|      _|  _|_|_|    
_|        _|    _|  _|_|  _|_|  _|    _|  
_|        _|_|_|_|  _|  _|  _|  _|_|_|    
_|        _|    _|  _|      _|  _|        
_|_|_|_|  _|    _|  _|      _|  _|        
                                                                         
# DOCKERFILE: L.A.M.P - Linux (Ubuntu, Fedora, CentOS, Debian) + Apache + (MySQL || MariaDB) + (PHP || Python)

FROM python:latest
WORKDIR /var/www/html
ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/
RUN chmod ugo+x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions pdo pdo_mysql gd zip exif
RUN docker-php-ext-install mysqli pdo pdo_mysql exif
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composerdoc

==========================================================================================================================             

# DOCKERFILE: M.E.A.N - MongoDB + Express + (Angular || Angular.js) + Node.js

FROM node:latest
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.2.1/wait /wait
RUN chmod +x /wait
CMD /wait && npm start

==========================================================================================================================

# DOCKERFILE: M.E.R.N - MongoDB + Express + React.js + Node.js

FROM node:latest
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
ADD 
RUN chmod +x /wait
CMD /wait && npm start

==========================================================================================================================

# DOCKERFILE: M.E.N.V - MongoDB + Express + Vue.js + Node.js

FROM node:latest
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
ADD 
RUN chmod +x /wait
CMD /wait && npm start

==========================================================================================================================
                                
# DOCKERFILE: ROR - RubyOnRails

==========================================================================================================================
