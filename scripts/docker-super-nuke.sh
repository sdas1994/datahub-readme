#!/usr/bin/env bash

if ! docker info > /dev/null 2>&1; then
  echo "This script uses docker, and it isn't running - please start docker and try again!"
  exit 1
fi

echo "This script will delete all docker containers, images and volumes!"
echo "=================================================================="
echo ""
echo "Step 1: Containers that will be deleted:"
docker ps -a
echo ""
echo "Are you sure you want to remove all these containers? [y/n]"
select yn in "y" "n"; do
    case $yn in
        y ) docker rm -f $(docker ps -a -q); break;;
        n ) exit;;
    esac
done

echo ""

echo "Step 2: Volumes that will be deleted:"
docker volume ls
echo ""
echo "Are you sure you want to remove all these volumes? [y/n]"
select yn in "y" "n"; do
    case $yn in
        y ) docker volume rm $(docker volume ls -q); break;;
        n ) exit;;
    esac
done

echo ""

echo "Step 3: Images that will be deleted:"
docker image ls
echo ""
echo "Are you sure you want to remove all these images? [y/n]"
select yn in "y" "n"; do
    case $yn in
        y ) docker image rm -f $(docker images -a -q); break;;
        n ) exit;;
    esac
done