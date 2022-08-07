cpp-cmake-docker-example
========================

This is an example of using docker to contain a C++ application built with cmake.
The app simply prints "This is a test" to stdout and exists, but should serve as an example of how to use docker with C++ and cmake.

To start, first clone the repo:

```bash
git clone
```

To compile and run, first install and configure docker, and then do:

```bash
docker build -t cpp-cmake-docker-example
docker run cpp-cmake-docker-example:latest
```
