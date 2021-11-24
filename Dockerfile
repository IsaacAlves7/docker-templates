############################################ Docker WebStacks - Dockerfile and Docker Compose Templates #######################################################
                                              
    _/        _/_/_/_/  _/      _/  _/_/_/    
   _/        _/        _/_/  _/_/  _/    _/   
  _/        _/_/_/    _/  _/  _/  _/_/_/      
 _/        _/        _/      _/  _/           
_/_/_/_/  _/_/_/_/  _/      _/  _/            
                                                                      
# DOCKERFILE: L.E.M.P - Linux (Ubuntu, Fedora, CentOS, Debian) + NGINX + (MySQL) + (PHP)

FROM php:7.4
WORKDIR /var/www/html
ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/
RUN chmod ugo+x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions pdo pdo_mysql gd zip exif
RUN docker-php-ext-install mysqli pdo pdo_mysql exif
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composerdoc

# DOCKER-COMPOSE: L.E.M.P - Linux (Ubuntu, Fedora, CentOS, Debian) + NGINX + (MySQL) + (PHP)


# .DOCKERIGNORE: 

.node_modules/ 

--------------------------------------------------------------------------------------------------------------------------
# DOCKERFILE: L.E.M.P - Linux (Ubuntu, Fedora, CentOS, Debian) + NGINX + (MariaDB) + (PHP)

FROM php:7.4
WORKDIR /var/www/html
ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/
RUN chmod ugo+x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions pdo pdo_mysql gd zip exif
RUN docker-php-ext-install mysqli pdo pdo_mysql exif
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composerdoc

# DOCKER-COMPOSE: 

FROM php:7.4
WORKDIR /var/www/html
ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/
RUN chmod ugo+x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions pdo pdo_mysql gd zip exif
RUN docker-php-ext-install mysqli pdo pdo_mysql exif
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composerdoc

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
