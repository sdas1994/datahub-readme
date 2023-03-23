# Datahub

## What is Datahub?
- [Home Page](https://datahubproject.io/)
- [Documentation](https://datahubproject.io/docs/)

## How to build Datahub?
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
