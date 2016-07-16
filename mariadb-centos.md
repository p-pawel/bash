# Install MariaDB with yum on CentOS

## Update repo

`sudo vim /etc/yum.repos.d/MariaDB_10_1.repo`

Paste content as generated from https://downloads.mariadb.org/mariadb/repositories/ and a proper version of distro and release e.g. from https://downloads.mariadb.org/mariadb/repositories/#mirror=kisiek&distro=CentOS&distro_release=centos6-amd64--centos6&version=10.1


```
# MariaDB 10.1 CentOS repository list - created 2016-07-16 12:31 UTC
# http://downloads.mariadb.org/mariadb/repositories/
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.1/centos6-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
```


## Install

Install server, client or both:

`sudo yum install MariaDB-server MariaDB-client`
