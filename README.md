# zcloud

Personal Heroku style git push cloud.

# Install

* Replace `1.1.1.1` with the correct public ip address to initailize docker
swarm.
* Replace `ZCA_EMAIL=ca@email` with corect email address for let's encrypt certs.

```bash
$ # login to ssh server and run the following commands
$ ssh user@server
$ wget https://raw.githubusercontent.com/prabirshrestha/zcloud/master/zcloud
$ chmod +x zcloud
$ sudo ./zcloud install
$ sudo ZADDR=1.1.1.1 ZCA_EMAIL=ca@email.com ./zcloud init
$ exit                  # exit from ssh server
$ # copy ssh public key from local machine to server for git user
$ cat ~/.ssh/id_rsa.pub | ssh user@server "sudo tee -a /home/git/.ssh/authorized_keys"
```

# Commands

## help

```bash
$ ./zcloud help
Usage: zcloud <subcommand> [options]
Subcommands:
   install        Install prerequisites (requires sudo)
   init           Initializes server (requires sudo)
   create <name>  Create empty app
   help           Show help
```
