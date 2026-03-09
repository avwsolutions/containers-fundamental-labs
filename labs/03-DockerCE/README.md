# Introduction lab exercises

Welcome to the Docker Engine lab exercises. During the lab exercises the student will experiential work through various tasks and activities to gain practical experience and develop new skills. In hands-on learning, attendees are given the opportunity to explore, experiment, and discover knowledge for themselves about using containers.

The goal is to get actively engage and ask questions if something is not clear or you are blocked. Important to understand that there are no strong dependencies between labs, so it's okay if you're behind and follow your own pace.

The following key topics are part of these exercises:

- Setup Docker CE Engine on Ubuntu 2404
- Working with Podman Desktop (experimental)

## Exercise 1 - Setup Docker CE Engine on Ubuntu 24.04

This short exercise we are going through the steps of setting up `Docker CE` as engine on Ubuntu 24.04. In your lab environment it's already available. 

- Docker Engine
- ContainerD
- CRI-O
- Mirantis Container Runtime (MCR)

We will start with a `runc` experiment followed by a small exercise using `ContainerD`.  Under the hood `containerd` uses `runc`.

### Exercise 1.1 - Ensure prequisites are in-place

This first exercise you are going to ensure all prerequisites are in-place to succesfully setup `Docker Community Edition` on an `Ubuntu 24.04` Linux system. Most prereqs are required for downloading and installing the actual `deb` package using `apt`.

```
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
```

Now you are going to add the actual Docker package repository to the registered sources list. Don't forget to run `sudo apt update -y` to make the local repository available.

```
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF
sudo apt update -y
```

Now answer the following questions:
- What is the purpose of the `docker.asc` file?
- Can you also install `pre-releases` through this Docker Pachage repository?

### Exercise 1.2 - Setup Docker CE Engine

This exercise you are going to setup `Docker CE`. This can be easily installed through the `apt` Package Manager, which we configured as prereq.

During setup we are going to install multiple packages:
- docker-ce -> Actual Docker Engine to run container workloads.
- docker-ce-cli -> Actual CLI.
- containerd.io -> Container Runtime, which you already installed.
- docker-buildx-plugin -> CLI Plugin to extend build capabilities with [BuildKit](https://github.com/docker/buildx).
- docker-compose-plugin -> CLI Plugin to extend with compose capabilities with `docker compose`.

Let's give it a try.

```
sudo apt update -y
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

Also don't forget to configure the `Docker Engine` that it survives system restarts and validate if it still works.

```
sudo systemctl enable docker
sudo systemctl status docker
sudo systemctl restart docker
sudo docker run hello-world
```

Now answer the following questions:
- What is the benefit of using the `buildx` plugin?
- Lookup the `Docker Compose` version and explain why `docker-compose` isn't working?

### Exercise 1.3 - Provide acces to non-root user

This exercise you are going to ensure that `developers` which don't have `wheels privileges` or `root` access still can manage and work with container workloads. To make this possible a special purpose group exists, named `docker`.

Below the steps to ensure that an user `devops` has the privileges to access the local `Docker API`.

```
sudo useradd devops
sudo usermod -aG docker devops
sudo su devops
```

Now try the following:
- Login as `devops` and lookup all available groups using `id`.
- Run `docker ps` and look if any containers are running.
- Can you also run `docker inspect`?

## Exercise 2 - Working with Podman Desktop (experimental)

This exercise helps you to setup Podman Desktop. Most `production` cases you will use a Container Orchestration tool, such as `Kubernetes`. Container workloads are easy to deploy, scale and provide a good way of isolating application services. During the exercises we wil use a Podman (instead of Docker) setup. Additionally ensure that `Virtualization Technology support` is enabled in the System BIOS.

For Windows users, don't forget to setup Windows Subsystem Layer (WSL2). You can follow the instructions at [Microsoft Learn WSL Setup](https://learn.microsoft.com/en-us/windows/wsl/install-manual).

### Exercise 2.1 - Setup Podman Desktop

Installation is really straightforward, but be aware of above notes. You may want to download the installer from [Podman.IO]](https://podman.io/). Ensure you have `Docker Compatibility` enabled.  For more installation support read the [Podman Installation Instructions](https://podman.io/docs/installation).

When you join a classroom training, you are lucky, since I've already setup Podman Desktop for you.

### Exercise 2.2 - Create docker Symbolic Link

it's good to create a *SymbolicLink* for `docker` to the `podman` executable.

For Windows using PowerShell

```
cd C:\Program files\RedHat\Podman
New-Item -ItemType SymbolicLink -Path "docker.exe" -Target "C:\Program files\RedHat\Podman\podman.exe"
```

## Next Steps

You are ready to start with the second lab about [Image Management](../04-ImageManagement/README.md). Be aware that the trainer might have to explain the training material and provide additional instructions for a jump start.

Enjoy the exercises!!!
