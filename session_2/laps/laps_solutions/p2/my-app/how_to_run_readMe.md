# Steps to build and run : -

1. build our image 

```bash
docker build -t react_app .
```

2. run the docker container 

```bash
docker run -d --name react_app_cont -p 3000:3000 react_app
```

3. On your browser, type

```http
http://localhost:3000
```
