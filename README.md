# ON client side of K8s cluster

## you can set admin.conf file persistently 

```
❯ cp  -v  ~/Desktop/admin.conf  ~/.kube/config
/Users/fire/Desktop/admin.conf -> /Users/fire/.kube/config


```

## checking it 


```
❯ kubectl  get  nodes
NAME           STATUS   ROLES                  AGE   VERSION
master-node    Ready    control-plane,master   18h   v1.20.4
minion-node1   Ready    <none>                 18h   v1.20.4
minion-node2   Ready    <none>                 18h   v1.20.4

```


## Why Pod IP can't be used to access application running in POd 

<img src="podip.png">

## more closure look 

<img src="podnet.png">

### service can't user name/ IP of pod to forward traffic 

<img src="prob.png">

# SERVICE IN K8S

## service will connect to APISErver on master node -- etcd -- to find labeled POD 

<img src="svc.png">

## service type 

<img src="stype.png">

