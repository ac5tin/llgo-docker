FROM ubuntu:latest

ENV TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update && apt install -y cmake g++ git python3
RUN git clone https://github.com/llvm/llvm-project.git
WORKDIR /llvm-project
RUN mkdir build
WORKDIR /llvm-project/build
RUN mkdir /go
RUN cmake ../llvm -DLLVM_ENABLE_PROJECTS='clang;llgo' -DCMAKE_INSTALL_PREFIX=/go
RUN make install