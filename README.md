# Webserver Project

## Structure
```
ha-nginx-ha/
├── docker-compose.yml
├── web1/
│   └── index.html
├── web2/
│   └── index.html
├── web3/
│   └── index.html
└── proxy/
    ├── Dockerfile
    ├── start.sh
    ├── notify.sh
    ├── nginx.conf
    └── keepalived/
        ├── master.keepalived.conf
        └── backup.keepalived.conf
```

## Description
This repository sets up an environment with 3 Webservers which are reachable via 2 reverseproxies that share a VIP (Host Public IP) and have Keepalived in place so in case one of the reverseproxies fails it automatically routes the traffic through the backup one.