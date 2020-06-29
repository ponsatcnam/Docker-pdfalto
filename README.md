# Docker pdfalto

## A docker file for the pdf alto converter 

`Pdfalto` is an original tools written by Patrice Lopez  and Achraf Azhar 
to transform XML to the alto format.

On the alto output format see: https://en.wikipedia.org/wiki/ALTO_(XML)


## usage

You can directly run the command below to convert the pdf file in current folder.
```
docker run -ti --rm -v $(pwd):/app pdfalto sample.pdf 
```

or add the function below to you shell configuration (.bash_profil)

```
function pdfalto {
    docker run -ti --rm -v $(pwd):/app pdfalto $@
}
```
## credits

`Pdfalto` is a successor of `pdf2xml`  orignally written by Hervé Déjean, Sophie Andrieu, Jean-Yves Vion-Dury and Emmanuel Giguet (XRCE) under GPL2 license.,

It is based on Xpdf  developed by Glyph & Cog, LLC (1996-2017) and distributed under GPL2 or GPL3 license.
 
