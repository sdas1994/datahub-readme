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
### What is the easiest way to deploy a local build?
One needs discipline to have a hiccup free local deployment.
- Step 1:  
It is highly recommended that any existing docker containers, volumes and images which previous deployments have used be deleted.
Refer to the [docker-super-nuke.sh](https://github.com/sdas1994/margay-readme/blob/main/scripts/docker-super-nuke.sh) script on how to do this.
- Step 2:  
Once your docker is clean, running a simple
```
./gradlew quickstart
```
from your datahub root directory should work. Lord help you if it doesn't.

One rudimentary way of getting a failing build to work is to perform a deep clean of the repository. I tend to delete the repository entirely, pull the master branch and start the build process again. Only after the build works on main, do I pull my branch. You can also try deleting the generated files instead of nuking the entire repository first, to see if that fixes it.

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
cd datahub-web-react/
yarn install && yarn run start
```
