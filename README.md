# recap of day1

## Image inspect and gathering information 

```
 docker  inspect  ashupython:v001  -f '{{.Author}}'
ashutoshh@linux.com
❯ docker  inspect  ashupython:v001  -f '{{.Id}}'
sha256:a60063941b128bff86b5ef8aa6c14cb36d64f5fd19c0fc7b9902c16c92848215
❯ docker  inspect  ashupython:v001  -f '{{.ContainerConfig.Hostname}}'
5a6ba4e74f7f
❯ docker  inspect  ashupython:v001  -f '{{.Config.Cmd}}'
[python3 /mycode/hello.py]

```

