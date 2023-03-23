# Datahub

## What is Datahub?
- [Home Page](https://datahubproject.io/)
- [Documentation](https://datahubproject.io/docs/)

## Building Datahub from source
[Building Datahub Documentation](https://datahubproject.io/docs/developers/)
As mentioned in the documentation, Datahub relies on `gradlew` to build the entire project. It's important to note the prerequisites required before running `./gradlew build`. The following steps are recorded keeping an Ubuntu/Debian system in mind.
- [Install docker](https://docs.docker.com/engine/install/ubuntu/) and enable it to run without sudo.
```
sudo groupadd docker
sudo gpasswd -a $USER docker
sudo service docker restart
sudo chmod 666 /var/run/docker.sock
```
- Install the correct Java kit. Version 11 is needed, and JDK is needed, JRE itself isn't enough for building.
```
sudo apt install openjdk-11-jdk-headless
```
- Install Python 3.10 and venv.
```
sudo apt install python3.10-venv
```
- Install other dependencies (build tools, C compiler, libraries, etc.)
```
sudo apt install python3-dev build-essential gcc libsasl2-dev libldap2-dev libssl-dev
```

## Deploying Datahub
Easiest way to deploy a running instance of Datahub is by pulling the official Docker images from dockerhub.
```
cd docker/
docker compose -p datahub -f docker-compose.yml -f docker-compose.override.yml -f docker-compose-without-neo4j.m1.yml -f docker-compose.dev.yml up
```
How to deploy the local build? That still needs figuring out.

## Working on Frontend
If the requirement is to tinker on the frontend elements, the best way is to deploy a working version of Datahub first, and then follow the guides mentioned [here](https://datahubproject.io/docs/datahub-web-react). The best way to develop on frontend then is to start a forwarding server. Ensure node related packages are installed.
```
sudo apt install nodejs
sudo apt install npm
npm install -g yarn
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash # installs nvm
source ~/.zshrc # refresh needed after nvm install
nvm install 14 # node version needs to be greater than 14 for datahub frontend libraries 
```
Once the prerequisites are installed, deploy the forwarding server at `localhost:3000` using
```
yarn install && yarn run start
```
