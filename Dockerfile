FROM alpine:3.8

RUN wget https://hgwdev.cse.ucsc.edu/~kent/src/blatSrc36.zip \
    && unzip blatSrc36.zip \
    && rm blatSrc36.zip \
    && cd blatSrc \
    && export MACHTYPE=$(uname -m) \
    && apk add --no-cache  libc-dev gcc make zlib zlib-dev \
    # comment out code that won't compile (and isn't needed for gfServer)
    && (cd lib && sed -i.bak -e 's/fof\.o//' -e 's/pngwrite\.o//' makefile && make) \
    && (cd jkOwnLib && make) \
    && (cd gfServer && make BINDIR=/usr/local/bin PNGLIB=' ' MYSQLLIBS=' ') \
    && cd / \
    && rm -rf blatSrc \
    && apk del libc-dev gcc make zlib-dev
