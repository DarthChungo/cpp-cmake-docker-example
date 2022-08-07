cpp-cmake-docker-example
========================

This is an example of using docker to contain a C++ application built with cmake.
The app simply prints "This is a test" to stdout and exists, but should serve as an example of how to use docker with C++ and cmake.

To start, first clone the repo:

```bash
git clone git@github.com:DarthChungo/cpp-cmake-docker-example.git
```

Then, to compile and run it use:

```bash
docker build -t cpp-cmake-docker-example
docker run cpp-cmake-docker-example:latest
```

License
=======

This repository is in the public domain.
Please read the attatched LICENSE.txt file for more information.
