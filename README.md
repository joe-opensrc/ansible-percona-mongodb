## An ansible artifact + role to install the Percona MongoDB Suite.

Installs onto (tested):

- SLES:     v15.3 (HPC)
- OpenSUSE: v15.2
- Debian:   v9.2

### Dependencies:

Host:

- ansible: v2.10.4
- python:  v3.8.10

Target hosts:

- python:  v3.x (v3.8.10 tested)

### Steps to prepare:

- install ansible onto your management machine
- clone the ansible role + playbook
- correctly configure hostnames
- run the playbook against the target hosts

### Install ansible onto your management machine:

e.g., into a virtual python environment.  

```
virtualenv -ppython3 ~/pyvirts/ansible
source ~/pyvirts/ansible/bin/activate
pip install ansible==2.10.4
```

You don't have to use virtualenv, or a specific version of ansible of course.

For example, you might try `python3 -m venv ~/pyvirts/ansible`.</br>
However, this hasn't been tested here, and is little beyond the scope of this document ;)

### Clone the ansible role + playbook

```
git clone https://gitlab.com/joe-opensrc/ansible-percona-mongodb.git
cd ansible-percona-mongodb
```

### Correctly configure hostnames

TODO: Instructions to follow...

```
cd hosts
vim static-hosts # 
```

E.g.,

```
all:
  hosts:
    mdb-test-server1:
      ansible_host: 10.30.0.2
      ansible_user: root
```

## Run the playbook against the target hosts

```
source ~/pyvirts/ansible/bin/activate
ansible-playbook -i hosts server-mongodb.yml
```

### To check the tags / tasks

```
ansible-playbook -i hosts server-mongodb.yml --list-tags
ansible-playbook -i hosts server-mongodb.yml --list-tasks
```

Again, using / configuring ansible isn't really in scope here (yet :D)

### Test It!

The included Dockerfile can be used to spin up an openSUSE container </br>
which contains the minimal number of packages required for testing.

You must first generate an ssh key pair like so:

```
ssh-keygen -t ed25519 -a 100 -C ansible-ssh -f ansible-ssh.key
```

Then build and run the container:

```
docker build -t myrepo/opensuse-mongodb .
docker run --hostname mdb1 --name mdb-test-server1 -d myrepo/opensuse-mongodb 
```

Get the container ip:

```
docker inspect mdb-test-server1 --format '{{ .NetworkSettings.IPAddress }}'
```

Check the ssh connection:

```
ssh -l root -i ansible-ssh.key <container_ip>
```

Then configure the host inventory + run the playbook! (see above).

### Usage

see [USAGE.md](USAGE.md)
