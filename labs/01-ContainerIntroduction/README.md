# Introduction lab exercises

Welcome to the Container Introduction lab exercises. During the lab exercises the student will experiential work through various tasks and activities to gain practical experience and develop new skills. In hands-on learning, attendees are given the opportunity to explore, experiment, and discover knowledge for themselves about using containers.

The goal is to get actively engage and ask questions if something is not clear or you are blocked. Important to understand that there are no strong dependencies between labs, so it's okay if you're behind and follow your own pace.

The following key topics are part of these exercises:

- History of Containers
- Explore the Open Container Initiative

## Exercise 1 - History of Containers

This first exercise you are going to answer some questions about the history of containers. The technology behind containers isn't that new at all, you may recognize this already from your favorite `UNIX` operating system.

| Year | Description                                                                                       |
|------|---------------------------------------------------------------------------------------------------|
| 1979 | UNIX V7 introduction of `chroot`.                                                                 |
| 2000 | FreeBSD introduces the concept of  `FreeBSD Jails` to seperate services.                          |
| 2001 | Also Linux introduces `VServer`, which also delivers `Jail` functionality.                        |
| 2004 | Famous first public beta using `Solaris Containers`, better known as `zones`.                     |
| 2005 | Another (non-official) Linux `OS Virtualization` initiative called `Open VZ` - Virtuzzo.          |
| 2006 | Google initiative that introduces control group kernelfeature called `cgroups`, which initially known as Proces Containers .|
| 2007 | `LXC` (LinuX Containers) are born as the most complete container manager for Linux.                 |
| 2013 | `Docker` introducing their LXC implementation, which exploded the popularity of containers.         |
| 2016 | `Kubernetes` as orchestration platform was adopted by the Cloud Native Computing Foundation (CNCF). |
| 2017 | This year containers became mainstream and `Docker` announced support for `Kubernetes`.             |
| 2018 | Containers became the golden standard for modern applications, but also other innovative technologies are found like `Podman` |
| 2020+ | Coming years `Kubernetes` matures further. Think about removing `dockershim`, rethinking `Ingress`, `multi-cluster`, `autoscaling` and embedding new `eBPF` and other Security technologies.  |
| 2023 | This year `containers`, in particular `OCI Container Registry` become more important for `modern secure architectures`. Running `AI workload artifacts`, entering `mainframes`, `multi-purpose OCI Registry` and also fully adopted by Enterprises. Using Kubernetes as `de facto ochestration platform`. |

### Exercise 1.1 - Change root

This first exercise is about changing the default `/` to `/root/chroot-isolated`.

```
sudo mkdir -p /root/chroot-isolated/{bin,lib,lib64}
sudo cp /bin/bash /root/chroot-isolated/bin/
ldd /bin/bash
sudo cp /lib/x86_64-linux-gnu/libtinfo.so.6 /root/chroot-isolated/lib/
sudo cp /lib/x86_64-linux-gnu/libc.so.6 /root/chroot-isolated/lib/
sudo cp /lib64/ld-linux-x86-64.so.2 /root/chroot-isolated/lib64/
```

Now change the `/` to `/root/chroot-isolated`.

```
sudo chroot /root/chroot-isolated
```

Now answer the following questions:
- Can you open a `bash` shell?
- What is the output of `pwd`?
- Explain why you can't run `ls` or other system commands.

### Exercise 1.2 - Using cgroups

This exercise you are going to do an experiment using `cgroups`. Control groups are an important component to control system resources, such as cpu, memory and network resources.

```
apt install -y cgroup-tools stress
```

Check the current `cgroupv2` configuration.

```
ls -atlr /sys/fs/cgroup
```

Now run `stress` with `cpu.max` consumption.

```
stress --cpu 1 &
htop
pkill -9 stress
```

Now let's create a throttled proces on `cpu.max` resource.

```
cgcreate -g cpu:/throttled
cgset -r cpu.max="5000 100000" throttled
cat /sys/fs/cgroup/throttled/cpu.max
```

Now start a `stress` proces to monitor cpu usage.

```
cgexec -g cpu:throttled stress --cpu 1 &
htop
pkill -9 stress
```

## Next Steps

You are ready to start with the second lab about [Container Runtimes](../02-ContainerRuntimes/README.md). Be aware that the trainer might have to explain the training material and provide additional instructions for a jump start.

Enjoy the exercises!!!
