## Once Installed

Server Start:

Containerised version:

```
su - mongod
source ~/.bashrc-mongod
mongod -f /etc/mongod.conf
```

Systemd + dbus version:

```
systemctl start mongod.service
```


Client (mongosh):

```
su - mongod
source ~/.bashrc-mongod
mongosh
```

