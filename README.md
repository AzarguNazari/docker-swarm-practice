 
# Deployment on Docker swarm

## Deploy stack
`docker stack deploy --compose-file docker-compose.yml test-nginx`

## Note
Before doing the stack deployment, we should have already created the swarm nodes. If you want to create `docker-machine` for test purpose, following the below code:
- We create 3 docker-machine (virtual machines) for experiment purpose
- `for i in node{1..3}; do docker-machine create --driver virtualbox $i; node`
- To see the list of created virtual machines `vboxmanage list vms`
- By default the docker swarm is inactive, so to activate it, follow: `docker swarm init --advertise-addr IP_ADDRESS_OF_MASTER_NODE`. To know the IP address of master node, `ip a s`
- To join the two other nodes into docker swarm cluster `docker swarm join-token worker` on node1 (master node), copy the generated token and paste it on two nodes (node1 and node2)
- To run the deployment stack from manager node (node1), type `docker-machine env node1` and then `eval $(docker-machine env node1)`
- To deploy the stack `docker stack deploy --compose-file docker-compose.yml dicurtus`
