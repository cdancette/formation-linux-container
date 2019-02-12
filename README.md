# Formation linux pratique

This project provides a docker image which can be used for the practical linux system administration training.

This project is based on [ViaRezo](https://viarezo.fr) internal teaching tool. 

La liste des niveaux est disponible ici: [niveaux.md](niveaux.md).

## Pull

`docker pull cdancette/formation-linux`

## Build
```
docker build -t formation-linux .
```

## Run
```
docker run -d -h 'formation-linux' -p 23:23 -p 2222:22 formation-linux
```

If port 23 is already in use, change the binding (for example 2323:23 instead of 23)

## Connection
### Telnet
To connect to the container via telnet, use:

```
telnet server 23  # or a different port, if you changed it.
```

Login: `intro`

Password: `formation`.


### SSH
To connect: `ssh intro@server -p 2222`.

Password: `formation`.
