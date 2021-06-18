# Udemy - Docker & Kubernetes: The Practical Guide

## Dockerizing MongoDB

```
docker run --name mongodb --rm -d -p 27017:27017 mongodb
```

* Publicando o nome (`mongodb`) e a porta padrão (`-p 27017:27017`), nos outros containers basta usar o nome na conexão

