# Base image

FROM debian:buster AS base

RUN set -ex;         \
    apt-get update;


# Builder image

FROM base AS builder

RUN set -ex;                       \
    apt-get install -y g++ cmake;

COPY . /usr/src/cpp-cmake-docker-example

RUN set -ex;                               \
    cd /usr/src/cpp-cmake-docker-example;  \
    cmake .; make; make install


# Runtime image

FROM base AS runtime

COPY --from=builder /usr/local/bin /usr/local/bin

ENTRYPOINT ["cpp-cmake-docker-example"]
