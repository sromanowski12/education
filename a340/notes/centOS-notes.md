```shell
sudo yum update
sudo yum install httpd
sudo systemctl start httpd.service
sudo systemctl enable httpd.service

sudo yum install mariadb-server mariadb
sudo systemctl start mariadb
sudo mysql_secure_installation
```

```shell
sudo yum -y update
sudo wget https://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm
sudo rpm -ivh epel-release-7-11.noarch.rpm
sudo yum repolist | grep epel

sudo yum install proftpd proftpd-utils

sudo systemctl start proftpd
sudo systemctl enable proftpd

ftp://111.111.111.111
```