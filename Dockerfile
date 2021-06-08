# Convert pdf to alto file
# this is pdfalto 
# an original tools 
# written by Patrice Lopez  and Achraf Azhar 
# on the alto format see: https://en.wikipedia.org/wiki/ALTO_(XML)

# You can directly run below command to convert the pdf file in current foler.
# docker run -ti --rm -v $(pwd):/app pdf2xmlexe sample.pdf 

# or add the function below to you shell configuration (.bash_profil)
# function pdfalto {
#    docker run -ti --rm -v $(pwd):/app pdfalto $@
#}

FROM ubuntu:xenial
LABEL maintainer="pons.olivier@gmail.com"
RUN apt-get update -y && apt-get install -y --no-install-recommends wget \
    build-essential \
    automake \
    g++

#this installs pdfalto binary into the image to convert pdf -> alto
RUN apt-get install -y libxml2-dev
RUN apt-get install -y libmotif-dev
RUN apt-get install -y git

#Install ICU4C
RUN \
    mkdir icu \
    && wget -q https://github.com/unicode-org/icu/releases/download/release-63-1/icu4c-63_1-src.tgz \
    && gunzip -d < icu4c-63_1-src.tgz | tar xvf - \
    && cd icu/source \
    && chmod +x runConfigureICU configure install-sh \
    && ./runConfigureICU Linux/gcc --enable-static --disable-shared \
    && make

RUN git clone https://github.com/kermitt2/pdfalto.git ~/pdfalto
WORKDIR /root/pdfalto
RUN git submodule update --init --recursive
RUN apt-get install -y cmake

WORKDIR /root/pdfalto
RUN cmake -D'ICU_PATH=/root/icu'
RUN make

WORKDIR /app
ENTRYPOINT ["/root/pdfalto/pdfalto"]
CMD [-h]