# Introduction lab exercises

Welcome to the Container Development lab exercises. During the lab exercises the student will experiential work through various tasks and activities to gain practical experience and develop new skills. In hands-on learning, attendees are given the opportunity to explore, experiment, and discover knowledge for themselves about using containers.

The goal is to get actively engage and ask questions if something is not clear or you are blocked. Important to understand that there are no strong dependencies between labs, so it's okay if you're behind and follow your own pace.

The following key topics are part of these exercises:

- Exploring Docker Compose
- Learn about

## Exercise 1 - Exploring Docker Compose

This  exercise we are going to explore how `Docker Compose` can help to create a full application specification.

### Exercise 1.1 - Provided CLI commands

Below a list which you can request using `docker compose`. Give it a try.

```
Usage:  docker compose [OPTIONS] COMMAND

Define and run multi-container applications with Docker

Options:
      --all-resources              Include all resources, even those not used by services
      --ansi string                Control when to print ANSI control characters ("never"|"always"|"auto") (default "auto")
      --compatibility              Run compose in backward compatibility mode
      --dry-run                    Execute command in dry run mode
      --env-file stringArray       Specify an alternate environment file
  -f, --file stringArray           Compose configuration files
      --parallel int               Control max parallelism, -1 for unlimited (default -1)
      --profile stringArray        Specify a profile to enable
      --progress string            Set type of progress output (auto, tty, plain, json, quiet)
      --project-directory string   Specify an alternate working directory
                                   (default: the path of the, first specified, Compose file)
  -p, --project-name string        Project name

Management Commands:
  bridge      Convert compose files into another model

Commands:
  attach      Attach local standard input, output, and error streams to a service's running container
  build       Build or rebuild services
  commit      Create a new image from a service container's changes
  config      Parse, resolve and render compose file in canonical format
  cp          Copy files/folders between a service container and the local filesystem
  create      Creates containers for a service
  down        Stop and remove containers, networks
  events      Receive real time events from containers
  exec        Execute a command in a running container
  export      Export a service container's filesystem as a tar archive
  images      List images used by the created containers
  kill        Force stop service containers
  logs        View output from containers
  ls          List running compose projects
  pause       Pause services
  port        Print the public port for a port binding
  ps          List containers
  publish     Publish compose application
  pull        Pull service images
  push        Push service images
  restart     Restart service containers
  rm          Removes stopped service containers
  run         Run a one-off command on a service
  scale       Scale services
  start       Start services
  stats       Display a live stream of container(s) resource usage statistics
  stop        Stop services
  top         Display the running processes
  unpause     Unpause services
  up          Create and start containers
  version     Show the Docker Compose version information
  volumes     List volumes
  wait        Block until containers of all (or specified) services stop.
  watch       Watch build context for service and rebuild/refresh containers when files are updated

Run 'docker compose COMMAND --help' for more information on a command.
```

We are not going through all possibilities, but the most important like `up`, `down` vs `stop`, `scale` and `restart`.

## Exercise 2 - Experiment with Wordpress 

This exercise you will learn about most important aspects of `Docker Compose`, which spins-up a Wordpress Stack for testing.

- You see how to apply dependencies.
- Integrate volumes for stateful data.
- Direct builds from source using Buildx.
- Port mapping 

Following included:

- MariaDB
- Wordpress ( Including a direct build with Woocommerce)
- PHPMyAdmin
- OpenSearch

Have a look a the provided configuration [Workpress stack](./content/wordpress/).
Also have a look into the actual [docker-compose.yml](./content/wordpress/docker-compose.yml).

You can start the whole Wordpress Stack with a single command. Give it a try!

```
docker compose up -d
```

Monitor the stack with the following:

```
docker compose ps
docker compose logs
```

Now answer the following questions:
- Which port is opened for WordPress?
- If the database `db` fails to start, does WordPress also fail?
- How much memory would `opensearch` consume as a container?

The following are challenges to complelte `container Fundamentals`.
- How would you create a `.env` file for most environment specific variables? Create your version.
- How would you integrate a network called `wordpress` using the `bridge` network driver.

## Next Steps

You have successfully completed all labs for the Containers Fundamentals training course. You are now ready to enter the real world and create awesome container based workloads yourself!

Enjoy running containers!!!
