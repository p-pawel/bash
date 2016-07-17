# Move IMAP from one server to another

## Copy messages from one server to another

Source: http://michal.superuser.org.pl/blog/2014/12/migracja-poczty-miedzy-skrzynkami-imap/

### Install `imapcopy`
```
sudo apt-get update && sudo apt-get install imapcopy
```

### Perform

Edit `imapcopy.cfg` file in current folder:

```
SourceServer imap.zrodlo.pl
SourcePort 143
 
DestServer imap.docelowy.pl
DestPort 143
 
#       SourceUser      SourcePassword  DestinationUser DestinationPassword
Copy    "user1@zrodlo.pl" "pass" "user@docelowy.pl" "pass"
``` 

Run `imapcopy`.

**Note: using `imapcopy` multiple times will result in multiple copies of the same messages**. 
That's why synchronization could be less risky.

## Sync messages between servers with `imapsync`

### Install 

```
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install makepasswd rcs perl-doc libio-tee-perl git libmail-imapclient-perl libdigest-md5-file-perl libterm-readkey-perl libfile-copy-recursive-perl build-essential make automake libunicode-string-perl
git clone git://github.com/imapsync/imapsync.git --depth 1
cd imapsync/
sudo make install
```

### Use

```
imapsync \
--host1 server1 -user1 user@server1 --password1 user1password --ssl1 \
--host2 server2 --user2 user@server2 --password2 user2password --ssl2
```
Sources:
* https://www.jverdeyen.be/ubuntu/imapsync-on-ubuntu/
* http://www.debiantutorials.com/transfer-mailboxes-between-imap-servers-with-imapsync/
* https://gist.github.com/carlos22/5d24c6fbd654b9c0bb33
