## Once Installed

Server Start:

Containerised version:

```
su - mongod
source ~/.bashrc-mongo
mongod -f /etc/mongod.conf
```

Systemd + dbus version:

```
systemctl start mongod.service
```


Client (mongosh):

```
su - mongod
source ~/.bashrc-mongo
mongosh
```

