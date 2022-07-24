#/bin/bash

cd ~
# Go to home directory

dir="Downloads"
if [! -d $dir ]; then mkdir $dir; fi

cd $dir
# change directory to Downloads dir.

# Check for wget, if does not exist then download it.
if ! rpm -qa | grep wget1; then yum install -y wget fi

# Download docker-ce.repo file
wget https://download.docker.com/linux/centos/docker-ce.repo

# Copy to respective directory
cp docker-ce.repo /etc/yum.repos.d/docker-ce.repo

# Install docker-ce
yum install -y docker-ce

# Enable docker
systemctl start docker
systemctl enable docker
systemctl status docker

docker -v

# Download docker-compose
# Get the latest version of docker-compose from https://github.com/docker/compose/releases
tag="v2.7.0"
wget https://github.com/docker/compose/releases/download/$tag/docker-compose-`uname -s`-`uname -m`

# Copy to the bin directory
cp docker-compose-`uname -s`-`uname -m` /usr/bin/docker-compose
chmod +x /usr/bin/docker-compose

# Check for the version
docker-compose -v


