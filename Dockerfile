FROM ubuntu:14.04 AS build
COPY . /root/get-cpcert
WORKDIR /root/get-cpcert
RUN chmod +x *.sh && ./prepare.sh && ./build.sh
RUN rm -rf /root/get-cpcert/libs

FROM ubuntu:14.04
COPY --from=build / /
