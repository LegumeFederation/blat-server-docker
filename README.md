# blat-server-docker (EXPERIMENTAL)

BLAT gfServer

## Build the Docker image

```
docker build -t blat-server:36 .
```

## Run a Docker container

To run the gfServer on port 1234 with a 2bit file served from a host directory (${HOST_DATA}) bind-mounted to /mnt in the container:

```
docker run --publish 1234:1234 -it --rm -v ${HOST_DATA}:/mnt:ro blat-server:36 gfServer start localhost 1234 /mnt/glyma.Wm82.gnm4.2bit
```
