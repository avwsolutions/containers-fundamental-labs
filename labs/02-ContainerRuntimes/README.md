# Introduction lab exercises

Welcome to the Container Runtimes lab exercises. During the lab exercises the student will experiential work through various tasks and activities to gain practical experience and develop new skills. In hands-on learning, attendees are given the opportunity to explore, experiment, and discover knowledge for themselves about using containers.

The goal is to get actively engage and ask questions if something is not clear or you are blocked. Important to understand that there are no strong dependencies between labs, so it's okay if you're behind and follow your own pace.

The following key topics are part of these exercises:

- Explore RunC
- Work with ContainerD

## Exercise 1 - Container Runtimes in action

This short exercise we are going to explain the different `container runtimes` available. Most of them are originated after the `docker Engine` succes.

- Docker Engine
- ContainerD
- CRI-O
- Mirantis Container Runtime (MCR)

We will start with a `runc` experiment followed by a small exercise using `ContainerD`.  Under the hood `containerd` uses `runc`.

### Exercise 1.1 - Explore RunC

This first exercise you are going to experiment with `RunC`. RunC is an important component to execute and run Linux containers.

```
mkdir hello && cd hello
mkdir rootfs
docker export $(docker create hello-world) | tar -C rootfs -xvf -
runc spec
# Update arg to "/hello"
sed -i 's/\"sh\"/"\/hello"/g' config.json
```

Now you can run the actual container image as `hello_container`.

```
sudo runc run hello_container
```

Now answer the following questions:
- What is the purpose of the `rootfs` folder?
- Why do you have to update the `spec` file?
- Can you easily change the `container-id`?

### Exercise 1.2 - Work with ContainerD

This exercise you are going to setup and work with `ContainerD`. It's the preferred `Container runtime` when running `Kubernetes`.

First ensure you have installed `containerd`.

```
sudo apt install containerd -y
```

Now we are going to download our first image. This example we choose `redis:alpine`.

```
sudo ctr images pull docker.io/library/redis:alpine
```

Now let's run this image interactively.

```
sudo ctr run docker.io/library/redis:alpine redis
```

You can also run the image as background task.

```
sudo ctr tasks start -d redis
```

Now try to communicate with the Redis workload.

```
sudo ctr tasks exec --exec-id 1 redis redis-cli ping
```

Now answer the following questions:
- Which commands does `ctr run` combine?
- Can you also list all background tasks with `ctr`?
- What is the response when executing `redis-cli ping`?

## Next Steps

You are ready to start with the second lab about [Docker CE](../03-DockerCE/README.md). Be aware that the trainer might have to explain the training material and provide additional instructions for a jump start.

Enjoy the exercises!!!
