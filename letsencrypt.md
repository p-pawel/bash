# "Let's Encrypt" manually

## Setup

### Install "Let's Encrypt"

If not accessible from apt-get or yum normally, e.g.

`sudo apt-get install letsencrypt`

then install by cloning the following:

`sudo git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt`

### Automating script

Download script (as copied from https://tty1.net/blog/2015/using-letsencrypt-in-manual-mode_en.html) and adjust "country"
"state", "town" and "email".

`wget https://raw.githubusercontent.com/p-pawel/devops/master/letsencrypt/gencert.sh`

If necessary adjust path to "letsencrypt" or add it to PATH enviroment variable.

## Certification

Run script with one or more domains as parameter:
`sh gencert.sh mydomain.tld mydomain2.tld ...`

When requested to run Python script, just create a requested file and content on server.
