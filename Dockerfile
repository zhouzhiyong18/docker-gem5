FROM ubuntu:16.04 as builder
MAINTAINER Eric Van Hensbergen <ericvh@gmail.com>

# get dependencies
RUN apt-get update
RUN apt-get install -y build-essential git-core m4 scons zlib1g zlib1g-dev libprotobuf-dev protobuf-compiler libprotoc-dev libgoogle-perftools-dev swig python-dev python python-six
RUN apt-get clean

# checkout repo with mercurial
WORKDIR /usr/local/src
RUN git clone --depth 1 https://github.com/gem5/gem5.git
# build it
WORKDIR /usr/local/src/gem5
ADD build.bash /usr/local/src/gem5/build.bash
RUN chmod ugo+x build.bash
RUN ./build.bash && rm -rf .git
ENTRYPOINT bash

FROM ubuntu:16.04
LABEL maintainer="supernbo@gmail.com"
COPY --from=builder /usr/local/src/gem5 /usr/local/gem5
RUN apt-get update && apt-get install -y python libpython2.7 \
        libprotobuf9v5 libgoogle-perftools4 python-six \
        && ln -s /usr/local/gem5/build/X86/gem5.opt /usr/local/bin/gem5.opt \
        && rm -rf /var/lib/apt/lists/*
WORKDIR /root
CMD gem5.opt
