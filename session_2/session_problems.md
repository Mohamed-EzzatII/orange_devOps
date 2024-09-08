# Problem1 

In this problem, we will perform the following tasks:

1. Run the container `hello-world`
2. Check the container status
3. Start the stopped container
4. Remove the container
5. Remove the image

## Steps

### 1- Run the container

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

### 4 - remove the container (Note that the container should be stopped)

```bash
$ docker container rm <container_name or ID>
```

### 5 - remove the image
```bash
$ docker image rm <image_name or ID>
```
---

# Problem 2
in this problem, we will ilustrate the concept of mounting files in container : 

1 - create a container from ubuntu image
2 - touch a file in that image
3 - exit and delete the container
4 - look for the file, where is it?
5 - create a container from the ubuntu image and mount a directory in it
6 - touch the file
7 - delete the container
8 - look for the file and you will find it

---
## Steps : -

### 1 - create the container and touch a file in it
```bash
$ docker pull ubuntu
$ docker run -it ubuntu /bin/bash
```

### 2 - remove the file
```bash
$ docker container stop ca1a51ca9572
$ docker container rm ca1a51ca9572
```

### 3 - create a container and make mount bind, touch the file in it(don't forget) 

```bash
$ docker container run -it --mount type=bind,src=/home/ezzat/orange_DevOps/orange_devOps/session_2/lap2,target=/lap2 ubuntu /bin/bash
```

### 4 - delete the container 
```bash
$ docker container stop 3fe0f2982ef4
$ docker container rm 3fe0f2982ef4
```

