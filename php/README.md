## Install PHP-7.4

### Add repo

```bash
sudo apt-get update
sudo apt -y install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
```

### Install PHP and Modules

```bash
apt install php7.4 php7.4-{bcmath,bz2,curl,gd,igbinary,mbstring,memcached,mongodb,msgpack,mysql,redis,xdebug,xml,xsl,zip}
```
