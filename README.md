ntopng-docker
=============

# ntopng Docker Image

## Install & Run

```
docker run --net=host -t -p 3000:3000 tyisi/ntopng-docker <ntopng arguments>
```

## Example

### Different Port

```
docker run --net=host -t -p 4000:4000 tyisi/ntopng-docker -w 4000
```
