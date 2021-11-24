================================================================
| # Docker WebStacks - Dockerfile and Docker Compose Templates |
----------------------------------------------------------------
           __        
    ____  / /_  ____ 
   / __ \/ __ \/ __ \
  / /_/ / / / / /_/ /
 / .___/_/ /_/ .___/ 
/_/         /_/      

# DOCKERFILE: L.E.M.P - Linux (Ubuntu, Fedora, CentOS, Debian) + NGINX + (MySQL || MariaDB) + (PHP || Python)

FROM php:7.4
WORKDIR /var/www/html
ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/
RUN chmod ugo+x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions pdo pdo_mysql gd zip exif
RUN docker-php-ext-install mysqli pdo pdo_mysql exif
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composerdoc

# DOCKER-COMPOSE: 

# .DOCKERIGNORE: 

==========================================================================================================================

# DOCKERFILE: L.A.M.P - Linux (Ubuntu, Fedora, CentOS, Debian) + Apache + (MySQL || MariaDB) + (PHP || Python)

FROM php:7.4
WORKDIR /var/www/html
ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/
RUN chmod ugo+x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions pdo pdo_mysql gd zip exif
RUN docker-php-ext-install mysqli pdo pdo_mysql exif
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composerdoc

==========================================================================================================================

    _/      _/                  _/                _/            
   _/_/    _/    _/_/      _/_/_/    _/_/              _/_/_/   
  _/  _/  _/  _/    _/  _/    _/  _/_/_/_/      _/  _/_/        
 _/    _/_/  _/    _/  _/    _/  _/            _/      _/_/     
_/      _/    _/_/      _/_/_/    _/_/_/  _/  _/  _/_/_/        
                                             _/                 
                                          _/                    

# DOCKERFILE: M.E.A.N - MongoDB + Express + (Angular || Angular.js) + Node.js

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
 ____             __                  
/\  _`\          /\ \                 
\ \ \L\ \  __  __\ \ \____  __  __    
 \ \ ,  / /\ \/\ \\ \ '__`\/\ \/\ \   
  \ \ \\ \\ \ \_\ \\ \ \L\ \ \ \_\ \  
   \ \_\ \_\ \____/ \ \_,__/\/`____ \ 
    \/_/\/ /\/___/   \/___/  `/___/> \
                                /\___/
                                \/__/ 
                                
# DOCKERFILE: ROR - RubyOnRails

------------------------------------------
