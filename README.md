# bind4localtest
Small docker launch template to service local.test DNS with recursive forwarding

# Disable resolvd

```
sudo systemctl disable systemd-resolved.service
sudo systemctl stop systemd-resolved
sudo tee /etc/resolv.conf << END
nameserver 1.1.1.1
nameserver 8.8.8.8
END
```

# Start the container

```
bash start.sh 
```
# Check status

```
$ sudo docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS          PORTS                                                                          NAMES
5498e7320ab7   ubuntu/bind9   "docker-entrypoint.sh"   13 seconds ago   Up 12 seconds   0.0.0.0:53->53/tcp, 0.0.0.0:53->53/udp, :::53->53/tcp, :::53->53/udp, 953/tcp   bind9-container
```

Note the name

# Troubleshoot
```
docker logs bind9-container
docker exec -it bind9-container  /bin/bash
```
