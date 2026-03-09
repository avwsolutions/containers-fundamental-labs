# Introduction lab exercises

Welcome to the Container network lab exercises. During the lab exercises the student will experiential work through various tasks and activities to gain practical experience and develop new skills. In hands-on learning, attendees are given the opportunity to explore, experiment, and discover knowledge for themselves about using containers.

The goal is to get actively engage and ask questions if something is not clear or you are blocked. Important to understand that there are no strong dependencies between labs, so it's okay if you're behind and follow your own pace.

The following key topics are part of these exercises:

- Exploring Container networking

## Exercise 1 - Exploring Container Networking

This  exercise we are going to explore all `container network` options which are available for Containers.
Options are:
- host -> Local directly 1:1 mapping to host.
- null -> Local no network, say /dev/null.
- bridge -> Local indirectly managed through configured ports (80:80).
- multi-host -> Aka overlay for Docker Swarm.

We will look into small experiment with both `bridge` and `host` network.
In essence the default is `bridge`, which is preffered for local and `compose` development.

### Exercise 1.1 - Provided CLI commands

Below a list which you can request using `docker network`. Give it a try.

```
Usage:  docker network COMMAND

Manage networks

Commands:
  connect     Connect a container to a network
  create      Create a network
  disconnect  Disconnect a container from a network
  inspect     Display detailed information on one or more networks
  ls          List networks
  prune       Remove all unused networks
  rm          Remove one or more networks

Run 'docker network COMMAND --help' for more information on a command.
```

We are not going through all possibilities, but the most important to keep in mind are `create, connect, inspect, ls  and rm`. 

## Exercise 2 - Experiment with host and bridge mode

This exercise you will learn about the differences between `host` and `bridge` mode.

### Exercise 2.1 - Start a container in host network mode

As simple as said. Start `web1` nginx container in `host` network mode.

```
docker run --network host -d --name web1 nginx
```

Now answer the following questions:
- Does `curl localhost:80` work?
- Explain what `host` network mode pros and cons are.

### Exercise 2.2 - Start a container in bridge network mode

As simple as said. Start `web2` nginx container in `bridge` network mode.

```
docker run --network bridge -d --name web2 nginx
```

Now answer the following questions:
- Does `curl localhost:80` work?
- Now recreate the container with `-p "80:80"` port definition and try again.
- Explain what `bridge` network mode pros and cons are.

### Exercise 2.3 - Connect container to newly created network


```
docker network create -d bridge full_network
docker network inspect full_network
docker network connect full_network web2
docker network inspect full_network
```
Now answer the following questions:
- Why can you only create multiple `bridge` driver networks?
- Can you connect a container after creation?
- Inspect if the container is connected to the network.

## Next Steps

You are ready to start with the second lab about [Container Volumes](../07-ContainerVolumes/README.md). Be aware that the trainer might have to explain the training material and provide additional instructions for a jump start.

Enjoy the exercises!!!
