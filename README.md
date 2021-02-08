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
$ rm ./zcloud           # use zcloud from /home/git/zcloud instead
$ exit                  # exit from ssh server
$ # copy ssh public key from local machine to server for git user
$ cat ~/.ssh/id_rsa.pub | ssh user@server "sudo tee -a /home/git/.ssh/authorized_keys"
```

## Deploy your first app

### Create an empty app on the server

```bash
$ ssh git@server
$ ./zcloud create helloworld
$ exit
```

### add a docker-compose.yml file in the root of the git repo on the client

Make sure to update the DNS records so the host is picked up correctly.

```docker
version: '3'
services:
  helloworld:
    image: traefik/whoami
    networks:
     - traefik-public
    deploy:
      labels:
        - "traefik.enable=true"
        - "traefik.http.routers.helloworld.rule=Host(`helloworld.zcloud.com`)"
        - "traefik.http.routers.helloworld.entrypoints=websecure"
        - "traefik.http.routers.helloworld.tls.certresolver=letsencryptresolver"
        - "traefik.http.services.helloworld.loadbalancer.server.port=80"

networks:
  traefik-public:
    external: true
```

### add git remote and push

```
$ git remote add zcloud git@server:helloworld
$ git push zcloud master
```

## delete app

* Login to server and remove the docker stack using `docker stack rm name`.
* If using `waypoint.hcl` go to the `/home/git/repo.appname` and run `waypoint destroy .`
* Delete `/home/git/appname` and `/home/git/.repo.appname` folders.

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

# Roadmap

- [ ] use [HashiCorp Waypoint](https://www.waypointproject.io/) to build and deploy.
- [ ] add support for using nomad

# Support Operating Systems

* Ubuntu
