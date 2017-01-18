From: http://askubuntu.com/a/480642/410722

```
sudo npm cache clean -f
sudo npm install -g n
sudo n stable

sudo ln -sf /usr/local/n/versions/node/<VERSION>/bin/node /usr/bin/node 
```

Then to upgrade
```
sudo n latest
```
