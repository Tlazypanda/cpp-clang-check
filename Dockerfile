FROM ubuntu:latest

LABEL com.github.actions.name="cpp-clang-check"
LABEL com.github.actions.description="Check your pull requests against cppcheck and clang."
LABEL com.github.actions.icon="check-circle"
LABEL com.github.actions.color="green"

LABEL repository="https://github.com/Tlazypanda/cpp-clang-check/"
LABEL maintainer="Tlazypanda <33183263+Tlazypanda@users.noreply.github.com>"

WORKDIR /build
RUN apt-get update
RUN apt-get -qq -y install curl clang-tidy cmake jq clang cppcheck clang-format

ADD checkall.sh /entrypoint.sh
COPY . .
CMD ["bash", "/entrypoint.sh"]
