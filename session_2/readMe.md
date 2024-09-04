# LAP1

In this lab, we will perform the following tasks:

1. Run the container `hello-world`
2. Check the container status
3. Start the stopped container
4. Remove the container
5. Remove the image

## Steps

### 1. Run the container

```bash
$ docker pull hello-world
$ docker run hello-world
```

### 2. check the container status

```bash
$ docker container ps -a
```
### 3 - Start The stopped container : -
The hello world container won't start because from the status checked from the previous step, itexitted, so we will get docker ubuntu and run it in an interactive mode, then stop and restart it.

```bash
$ docker pull ubuntu
$ docker run -it ubuntu /bin/bash
```

from another terminal run docker container stop <container_ID>

```bash
$ docker container stop ca1a51ca9572
```
start the container

```bash
$ docker container start ca1a51ca9572
```

exec the bash inside it
```bash
$ docker exec -it <containerName or ID> bash
```
example :
```bash
$ docker exec -it ca1a51ca9572 bash
```
