# Introduction lab exercises

Welcome to the Image management lab exercises. During the lab exercises the student will experiential work through various tasks and activities to gain practical experience and develop new skills. In hands-on learning, attendees are given the opportunity to explore, experiment, and discover knowledge for themselves about using containers.

The goal is to get actively engage and ask questions if something is not clear or you are blocked. Important to understand that there are no strong dependencies between labs, so it's okay if you're behind and follow your own pace.

The following key topics are part of these exercises:

- Exploring Image Operations
- Working with Dockerfile Intructions
- Deploy an your first application workload 

## Exercise 1 - Exploring Image Operations

This  exercise we are going to explore all `image operations` which are made available through the CLI.
Some operations are also available as shortcut, you may recognize them.

We will end this exercise with practicing with common commands to manage container images. For this you will use an external Container Registry.

The trainer will provide this additional information to complete the exercise, but let's assume you have the following information about the local Harbor `Container Registry`.

- Host: demo.goharbor.io
- Project: avwsolutions

### Exercise 1.1 - Provided CLI commands

Below a list which you can request using `docker image`. Give it a try.

```
docker image COMMAND

Manage images

Commands:
  build       Build an image from a Dockerfile
  history     Show the history of an image
  import      Import the contents from a tarball to create a filesystem image
  inspect     Display detailed information on one or more images
  load        Load an image from a tar archive or STDIN
  ls          List images
  prune       Remove unused images
  pull        Download an image from a registry
  push        Upload an image to a registry
  rm          Remove one or more images
  save        Save one or more images to a tar archive (streamed to STDOUT by default)
  tag         Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
```

We are not going through all possibilities, but the most important to keep in mind are `build, push, pull, rm and tag`. 

Now answer the following questions:
- What is the purpose of the `docker.asc` file?
- Can you also install `pre-releases` through this Docker Pachage repository?

### Exercise 1.2 - Extend Container

This exercise you are going to experiment with manipulating a remote image for local usage.

First we are going to pull the latest image. This way it's already cached.

```
docker pull docker/getting-started
``` 

Now take the `image` above as base, change the **author** and copy new content like **hacked.html**.

- Create the [Dockerfile](./content/simple_example/Dockerfile) with those additions.
- Ensure you have a [hacked.html](./content/simple_example/hacked.html), which does show your alias.
- Now build the new container as `simple_example` and give it a tag, which reflects your alias.

After a succesfull build you can run the container image using the command below:

```
docker run -d -p 80:80 small_example:avw
```

### Exercise 1.3 - Push the Container to Local Repository

This exercise we are going to store your recently build container image on our local repository. Ensure you have succesfully logged into the local Repository using `docker login demo.harbor.io`.

You need to tag the container image to include the provided *Host*, *Project* and *Repository* name. Don't forget to set you alias  again as tag.

```
docker tag small_example:avw demo.goharbor.io/avwsolutions/infected_webserver:avw
docker push demo.goharbor.io/avwsolutions/infected_webserver:avw
```

Now try to run the newly pushed container image again:

```
docker run -d -p 80:80 --name infected_webserver demo.goharbor.io/avwsolutions/infected_webserver:avw
```

Now answer the following questions:

- Do the layers need to be rebuild when the image is being retagged?
- Verify and compare both container images their layers using `docker inspect`.

## Exercise 2 - Working with Dockerfile Intructions

This exercise you will learn about applying intructions to a `Dockerfile`. In the previous exercise you already worked with **FROM** and **COPY**, but we will go through many others, using an example container image to build.

### Exercise 2.1 - Build the Dictionary Search Containerized App

Here we are going to build a fully-featured container image, which will provide search capabilities through a company delivered `dict` that contains cloud native buzzwords.

To build this solution:
- You will choose Ubuntu as base.
- Ensure that the image is updated, including latest `ca-certificates`.
- Set release info like vendor and version.
- Add the latest [license](./content/Dockerfile_Example/license.txt) file to the image.
- Copies the most recent [data](./content/Dockerfile_Example/data/) folder as working directory, which includes the `dict.txt`.
- Search application must run under a non-root user called `searchonly`.
- Use the provided [docker_entrypoint.sh](./content/Dockerfile_Example/docker_entrypoint.sh) as Entrypoint.

Example [Dockerfile](./content/Dockerfile_Example/Dockerfile) can be found here.

Now try to build and run this container image:

```
docker build -t dict_search_app:0.9.2 .
docker run dict_search_app:0.9.2
```

Now answer the following questions:

- What happens when you use **CMD** rather then **ENTRYPOINT** ? Explain the differences.
- Why do we set the **USER** after the **RUN apt-get** layer?
- Try to use `docker exec` to open a `bash` session into the container. Is this still possible?

### Exercise 2.2 - Test the Dictionary Search App functinality

This small exercise you are going to test the dictionary Search App.

```
docker run --name cloud_search --rm  dict_search_app:0.9.2 grep cloud
docker run --name infra_search dict_search_app:0.9.2 grep infra
```

Now answer the following questions:
- Explain why `--rm` can be helpful.
- Hack the system and expose the `license.txt` content without modifying the container image.

## Next Steps

You are ready to start with the second lab about [Container Management](../05-ContainerManagement/README.md). Be aware that the trainer might have to explain the training material and provide additional instructions for a jump start.

Enjoy the exercises!!!
