 
# Deployment on Docker swarm

## Create a cluster of 3 Swarm nodes (one master and two clients) on VirtualBox
```bash
docker-machine create --driver virtualbox node1
docker-machine create --driver virtualbox node2
docker-machine create --driver virtualbox node3
```
- ssh to one of the node `docker-machine ssh node1`
- initialize docker manager `docker swarm init --advertise-addr="address-of-current-node"`
- copy the generated command which contains the token and paste it to each of the worker nodes. So, each worker node will join the swarm cluster.


## Deploy stack
```bash
stack deploy --compose-file docker-compose.yml test-nginx
```

## Note
Before doing the stack deployment, we should have already created the swarm nodes. If you want to create `docker-machine` for test purpose, follow the below guide:
- We create 3 docker-machine (virtual machines) for experiment purpose
- `docker-machine create --driver virtualbox node1`, `docker-machine create --driver virtualbox node2`, `docker-machine create --driver virtualbox node3` 
- To see the list of created virtual machines `vboxmanage list vms`
- By default the docker swarm is inactive, so to activate it, follow: `docker swarm init --advertise-addr IP_ADDRESS_OF_MASTER_NODE`. To know the IP address of master node, `ip a s`
- To join the two other nodes into docker swarm cluster `docker swarm join-token worker` on node1 (master node), copy the generated token and paste it on two nodes (node1 and node2)
- To run the deployment stack from manager node (node1), type `docker-machine env node1` and then `eval $(docker-machine env node1)`
- To deploy the stack `docker stack deploy --compose-file docker-compose.yml dicurtus`

## Create
- CLI way:
  ```bash
    docker service create nginx
    docker service create --name nginx nginx
    docker service create --name nginx nginx 
  ```

- Docker Compose way:
```bash
version: '3.3'
services:
  nginx:
    image: nginx
    deploy:
      replicas: 1
```
- To deploy: `docker stack deploy -c docker-compose.yml nginx-deployment`

## Volume



## Networking


## Logging

## Scaling & replicas

## Rollback Update


## Monitoring

## Health Check

