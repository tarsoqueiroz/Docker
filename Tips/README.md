# Tips & Tricks
Fast notes and links to flush my mind.

## Build

```
docker build -t tarsoqueiroz/myimage:v0.0.0 .  
```

or

```
docker build -t tarsoqueiroz/myimage:v0.0.0 -f MyDockerfile .  
```

 ## Copy to transfer
 
```
docker save -o myimage.outputfile tarsoqueiroz/myimage:v0.0.0
```

## Load external image

```
docker load -i myimage.outputfile
```

