# Before running this script:
#  apt-get update
#  apt-get install curl

# Script sets up git and clones the repo for remainder of setup

sudo apt-get install git-core
sudo mkdir /tmp/hose-util

#get private key for github
sudo mkdir ~/.ssh
sudo curl -o ~/.ssh/id_rsa https://raw.github.com/hose-util/hose-util/master/rackspace-server-config/id_rsa
sudo chmod 600 ~/.ssh/id_rsa

#clone config stuff
sudo git clone git@github.com:hose-util/hose-util /tmp/hose-util

#run configuration package
sudo /tmp/rackspace-server-config/rsconfig-ubuntu_11_10+node+git.sh
