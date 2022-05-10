# Docker pdfalto

## A docker file for the pdf alto converter 

`Pdfalto` is an original tools written by Patrice Lopez  and Achraf Azhar 
to transform PDF to the XML alto format.

On the alto output format see: https://en.wikipedia.org/wiki/ALTO_(XML)

The latest stable version of pdflato is 0.4

## build 
  
You can build the docker image as follow

```
build . -t pdfalto
```

There is a Docker image on [Docker Hub](https://hub.docker.com/repository/docker/ponso/pdfalto) that as been build by

```
build . -t ponso/pdfalto:0.4
```

## usage

You can directly run the command below to convert the pdf file in current folder.
```
docker run -ti --rm -v $(pwd):/app pdfalto sample.pdf 
```


You can also add the function below to you shell configuration (.bash_profil)

```
function pdfalto {
    docker run -ti --rm -v $(pwd):/app pdfalto $@
}
```

In both cases you may need to change  `$(pwd)` to the way to get the current directory  on your  os shell. 

you may add -u $(id -u):$(id -g) to avoid the production of any file with root ownership

## credits

`Pdfalto` is a successor of `pdf2xml`  orignally written by Hervé Déjean, Sophie Andrieu, Jean-Yves Vion-Dury and Emmanuel Giguet (XRCE) under GPL2 license.,

It is based on Xpdf  developed by Glyph & Cog, LLC (1996-2017) and distributed under GPL2 or GPL3 license.
 
