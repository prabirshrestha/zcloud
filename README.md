# zcloud

Personal Heroku style git push cloud. Currently only works on a single machine.

# Install

```bash
$ # login to ssh server and run the following commands
$ ssh user@server
$ wget https://raw.githubusercontent.com/prabirshrestha/zcloud/master/zcloud
$ chmod +x zcloud
$ sudo ZSERVER_IP=127.0.0.1 ./zcloud install
$ ZSERVER_IP=127.0.0.1 ./zcloud init
$ rm ./zcloud           # use zcloud from /home/zcloud/zcloud instead
$ exit                  # exit from ssh server
$ # copy ssh public key from local machine to server for git user
$ cat ~/.ssh/id_rsa.pub | ssh user@server "sudo tee -a /home/zcloud/.ssh/authorized_keys"
```

## Deploy your first app

### Create an empty app on the server

```bash
$ ssh zcloud@server                 # notice the use zcloud
$ zcloud create helloworld
$ exit
```

Refer to the [examples](examples/) folder.


### add git remote and push

```
$ git remote add zcloud zcloud@server:apps/helloworld
$ git push zcloud master
```

## delete app

* Login to the server
* run `zcloud destroy helloworld`

# Commands

## help

```bash
$ ./zcloud help
Usage: zcloud <subcommand> [options]
Subcommands:
   init             Initializes server (requires sudo)
   create  <name>   Create empty app
   destroy <name>   Create empty app
   help             Show help
```

# Features

- [x] automated download/installation/setup
- [x] better default firewall support for security
- [x] use `git push` for deployments
- [x] use [Waypoint](https://www.waypointproject.io/) for builds and deployments
- [x] add support for [Cloud Native Buildpacks](https://buildpacks.io/)
- [x] add [docker](https://www.docker.com/) support.
- [x] use [consul](https://www.consul.io/) for configuration and service discovery
- [x] use [nomad](https://github.com/hashicorp/nomad) orchestration
- [x] use [traefik](https://traefik.io/traefik/) for reverse proxy

# Roadmap

- [ ] add support for [vault](https://www.waypointproject.io/plugins/vault)
- [ ] add support for [Let's Encrypt](https://letsencrypt.org/). Depends on https://github.com/hashicorp/waypoint/issues/1125
- [ ] add support for automatically generating default `waypoint.hcl`
- [ ] add support for multiple servers

# Support Operating Systems

* Archlinux
* Ubuntu
