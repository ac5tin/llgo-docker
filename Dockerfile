FROM ubuntu:latest

RUN apt install cmake git -y
RUN git clone https://github.com/llvm/llvm-project.git
WORKDIR /llvm-project
RUN mkdir build
WORKDIR /llvm-project/build
RUN cmake ../llvm -DLLVM_ENABLE_PROJECTS='clang;llgo' -DCMAKE_INSTALL_PREFIX=/path/to/llvm-inst
RUN make install