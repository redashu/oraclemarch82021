# FOr Docker only 
## volume & compose need to discusss


## Docker based application lifecycle 

<img src="appdep.png">


## COntainer orchestration using Docker compose 

<img src="compose.png">

## Docker compose works and file version 

<img src="cv.png">

## COmpose installation 

[docker docs](https://docs.docker.com/compose/install/)

## Compose file format 

<img src="composefile.png">

## Example 1

```
10216  cd ashuexample1
10217  ls
10218  docker-compose up  -d
10219  docker-compose ps
10220  docker-compose kill 
10221  docker-compose   ps
10222  docker-compose   start
10223  docker-compose   ps
10224  docker-compose   logs 

```

## to clean up all things 

```
❯ docker-compose down
Stopping ashuc1 ... done
Removing ashuc1 ... done
Removing network ashuexample1_default

```
