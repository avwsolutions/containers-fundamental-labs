# Introduction lab exercises

Welcome to the Container management lab exercises. During the lab exercises the student will experiential work through various tasks and activities to gain practical experience and develop new skills. In hands-on learning, attendees are given the opportunity to explore, experiment, and discover knowledge for themselves about using containers.

The goal is to get actively engage and ask questions if something is not clear or you are blocked. Important to understand that there are no strong dependencies between labs, so it's okay if you're behind and follow your own pace.

The following key topics are part of these exercises:

- Exploring Container Operations
- Working with Container commands
- Manipulate container resources

## Exercise 1 - Exploring Container Operations

This  exercise we are going to explore all `container operations` which are made available through the CLI.
Some operations are also available as shortcut, you may recognize them.

We will end this exercise with practicing with common commands to manage running containers.

### Exercise 1.1 - Provided CLI commands

Below a list which you can request using `docker container`. Give it a try.

```
Usage:  docker container COMMAND

Manage containers

Commands:
  attach      Attach local standard input, output, and error streams to a running container
  commit      Create a new image from a container's changes
  cp          Copy files/folders between a container and the local filesystem
  create      Create a new container
  diff        Inspect changes to files or directories on a container's filesystem
  exec        Execute a command in a running container
  export      Export a container's filesystem as a tar archive
  inspect     Display detailed information on one or more containers
  kill        Kill one or more running containers
  logs        Fetch the logs of a container
  ls          List containers
  pause       Pause all processes within one or more containers
  port        List port mappings or a specific mapping for the container
  prune       Remove all stopped containers
  rename      Rename a container
  restart     Restart one or more containers
  rm          Remove one or more containers
  run         Create and run a new container from an image
  start       Start one or more stopped containers
  stats       Display a live stream of container(s) resource usage statistics
  stop        Stop one or more running containers
  top         Display the running processes of a container
  unpause     Unpause all processes within one or more containers
  update      Update configuration of one or more containers
  wait        Block until one or more containers stop, then print their exit codes

Run 'docker container COMMAND --help' for more information on a command.
```

We are not going through all possibilities, but the most important to keep in mind are `exec, inspect, start, restart, rm and run`. 

## Exercise 2 - Working with Container commands

This exercise you will learn about using the various container commands. For this we work with two running containers named `web1` and `web2`.

### Exercise 2.1 - Start both containers

As simple as said. Start two `nginx` containers and ensure you set both names `web1` and `web2`.

```
docker run --name web1 -d nginx
docker run --name web2 -d nginx
```

### Exercise 2.2 - Copy file to container and exec command inside container

Copy over the `security.txt` to the `/tmp` folder on `web1`. Now execute `cat /tmp/security.txt` to show the contents.

```
docker container cp security.txt web1:/tmp
docker container exec -it web1 cat /tmp/security.txt
```

### Exercise 2.3 - Pause container web2 and look for the container stats

Pause the container named `web2` and look for the current `container stats`.

```
docker container pause web2
docker container stats
```

### Exercise 2.4 - Unpause container web2 and use top to monitor web2 processes

Unpause the container named `web2` and monitor the process activity for `web2`.

```
docker container unpause web2
docker container top web2
```

### Exercise 2.4 - Lookup both containers and file differences

Use `ps` or `ls` and `filter` option to only see `web1` and `web2`.

```
docker container ls --filter name=web[1,2]
docker container diff web1
```

Now refresh the container to the original state.

```
docker container kill web1
docker container rm web1
docker run -d --name web1 nginx
```

Now answer the following questions:

- When does `diff` become helpful?
- Does `top` show processes of a single or multiple containers?
- Name use cases when `cp` and `exec` become helpful?

## Exercise 3 - Manipulate container resources

This small example you are going to limit  CPU and Memory resources for `web1` and `web2`.

The following requirements on resources apply.

- Web1, which is prod must have "0.5" CPU and "200m" Memory.
- Web2, which is test must have "0.1" CPU and "100m" Memory.

```
docker stop web1
docker rm web1
docker run --cpus "0.5" --memory "200m" --name web1 -d nginx
```

Repeat above for `web2`.

## Next Steps

You are ready to start with the second lab about [Container Network](../06-ContainerNetwork/README.md). Be aware that the trainer might have to explain the training material and provide additional instructions for a jump start.

Enjoy the exercises!!!
