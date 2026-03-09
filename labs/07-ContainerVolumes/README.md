# Introduction lab exercises

Welcome to the Container volumes lab exercises. During the lab exercises the student will experiential work through various tasks and activities to gain practical experience and develop new skills. In hands-on learning, attendees are given the opportunity to explore, experiment, and discover knowledge for themselves about using containers.

The goal is to get actively engage and ask questions if something is not clear or you are blocked. Important to understand that there are no strong dependencies between labs, so it's okay if you're behind and follow your own pace.

The following key topics are part of these exercises:

- Exploring Container volumes

## Exercise 1 - Exploring Container Volumes

This  exercise we are going to explore all `container storage` options which are available for Containers.
Options are:
- host -> Local directly 1:1 mapping to host.
- null -> Local no network, say /dev/null.
- bridge -> Local indirectly managed through configured ports (80:80).
- multi-host -> Aka overlay for Docker Swarm.

We will look into small experiment with both `bridge` and `host` network.
In essence the default is `bridge`, which is preffered for local and `compose` development.

### Exercise 1.1 - Provided CLI commands

Below a list which you can request using `docker volume`. Give it a try.

```
Usage:  docker volume COMMAND

Manage volumes

Commands:
  create      Create a volume
  inspect     Display detailed information on one or more volumes
  ls          List volumes
  prune       Remove unused local volumes
  rm          Remove one or more volumes

Run 'docker volume COMMAND --help' for more information on a command.
```

We are not going through all possibilities, but the most important to keep in mind are `create, connect, inspect, ls  and rm`. 

## Exercise 2 - Experiment with shared volumes

This exercise you will learn about a simple example mounting a volume and sharing it between multiple hosts.

### Exercise 2.1 - Creating a database volume for persistent storage

We need to create a `docker volume` called `database`. Later this will be mounted to both `web1` and `web2`.

```
docker volume create database
docker volume inspect database
docker volume ls
```

Now answer the following questions:
- Which mountpoint or location is the data physical stored?
- Explain which driver is used.

### Exercise 2.2 - Connect web1 as primary host

`web1` is the container that requires to write data to a volume called `database`. The volume must be mounted to `/data`.
Let's try to mount the volume

```
docker run -d --name web1 --volume database:/data nginx
docker container cp statefulldataset web1:/data
docker exec -it web1 ls -latr /data
```

Now answer the following questions:
- Why do you think you only can mount a volume during creation?
- Is there a `Dockerfile` intruction to mount the volume?
- Is the `statefulldataset` stateful. Also try to recreate the `web1` container.

### Exercise 2.3 - Connect web2 as read-only host

`web2` is the container that requires to only read data from the volume called `database`. The volume must be mounted to `/data`.

Let's try to mount the volume, but only read!

```
docker run -d --name web2 --volume database:/data:ro nginx
docker exec -it web2 ls -latr /data
docker exec -it web2 touch /data/12345
```

Now answer the following questions:
- Do you see the `statefulldataset`?
- Is it possible to create (touch) a new file from `web2`?

## Next Steps

You are ready to start with the second lab about [Container Development](../08-ContainerDevelopment/README.md). Be aware that the trainer might have to explain the training material and provide additional instructions for a jump start.

Enjoy the exercises!!!
