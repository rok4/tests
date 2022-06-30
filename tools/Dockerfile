ARG TAG

FROM rok4/tools:${TAG}

RUN mkdir /tests
WORKDIR /tests

RUN apt -y install git && git init && git submodule add https://github.com/bats-core/bats-core.git bats \
    && git submodule add https://github.com/bats-core/bats-support.git test_helper/bats-support \
    && git submodule add https://github.com/bats-core/bats-assert.git test_helper/bats-assert \
    && git submodule add https://github.com/bats-core/bats-file.git test_helper/bats-file

COPY inputs /inputs
RUN mkdir /pyramids && tar -x -f /inputs/pyramids.tar --directory /pyramids/

COPY suite/* ./

CMD ["./bats/bin/bats", "-T", "--print-output-on-failure", "--show-output-of-passing-tests", "."]