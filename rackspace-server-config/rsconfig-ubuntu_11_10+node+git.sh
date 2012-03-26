#refresh apt-get packages
sudo apt-get update

#install basics
sudo apt-get -y install git-core curl build-essential openssl libssl-dev pkg-config

#get private key for github
sudo curl -o ~/.ssh/id_rsa https://raw.github.com/hose-util/hose-util/master/rackspace-server-config/id_rsa
sudo chmod 600 ~/.ssh/id_rsa

#install node 0.6.3
sudo git clone https://github.com/joyent/node.git && cd node
sudo git checkout v0.6.3
./configure
make
sudo make install
node -v

#install npm
curl http://npmjs.org/install.sh | sudo sh
npm -v

#install mongo
sudo apt-get -y install mongodb

#install mongolian
sudo npm install -g mongolian

#install nginx
sudo apt-get -y install nginx

#install forever
sudo npm install -g forever

#configure nginx front end proxy
sudo cp /tmp/hose-util/rackspace-server-config/nginx/site /etc/nginx/sites-available/site
sudo ln -s /etc/nginx/sites-available/site /etc/nginx/sites-enabled/site
sudo /etc/init.d/nginx restart

#get server base code
sudo mkdir /var/www
cd /var/www
sudo git clone git@github.com:hose-util/nodeserv

#create sysadmin user
sudo useradd -m sysadmin
sudo usermod -a -G admin sysadmin
echo ** SETUP COMPLETE **
echo ** Created sysadmin user, enter administrator password: **
passwd sysadmin
