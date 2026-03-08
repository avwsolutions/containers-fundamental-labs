# Introduction

This short chapter we are going to explain the different `container runtimes` available. Most of them are originated after the `docker Engine` succes.

- Docker Engine
- ContainerD
- CRI-O
- Mirantis Container Runtime (MCR)

We will do some small exercises using `ContainerD`.  Under the hood `containerd` uses `runc`.

# References

https://kubernetes.io/docs/setup/production-environment/container-runtimes/
https://github.com/containerd/containerd/blob/main/docs/getting-started.md 


# Hello world using ContainerD and RunC

## Prereq

Ensure you have installed `containerd`.

```
sudo apt install containerd -y
```

First download the image

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

Now try to communicate with the Redis workload

```
sudo ctr tasks exec --exec-id 1 redis redis-cli ping
```

