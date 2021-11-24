# Docker WebStacks - Dockerfile Templates
-----------------------------------------
       _           
 _ __ | |__  _ __  
| '_ \| '_ \| '_ \ 
| |_) | | | | |_) |
| .__/|_| |_| .__/ 
|_|         |_|    

# L.E.M.P - Linux (Ubuntu, Fedora, CentOS, Debian) + NGINX + MySQL || MariaDB + PHP || Python

-----------------------------------------
 _   _           _         _     
| \ | | ___   __| | ___   (_)___ 
|  \| |/ _ \ / _` |/ _ \  | / __|
| |\  | (_) | (_| |  __/_ | \__ \
|_| \_|\___/ \__,_|\___(_)/ |___/
                        |__/     

# M.E.A.N - MongoDB + Express + Angular || Angular.js + Node.js

FROM node:latest
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
ADD 
RUN chmod +x /wait
CMD /wait && npm start

# M.E.R.N - MongoDB + Express + React.js + Node.js

FROM node:latest
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
ADD 
RUN chmod +x /wait
CMD /wait && npm start

------------------------------------------
 ____             __                  
/\  _`\          /\ \                 
\ \ \L\ \  __  __\ \ \____  __  __    
 \ \ ,  / /\ \/\ \\ \ '__`\/\ \/\ \   
  \ \ \\ \\ \ \_\ \\ \ \L\ \ \ \_\ \  
   \ \_\ \_\ \____/ \ \_,__/\/`____ \ 
    \/_/\/ /\/___/   \/___/  `/___/> \
                                /\___/
                                \/__/ 
                                
# ROR - RubyOnRails

# 
