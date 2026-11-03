FROM quay.io/centos/centos:stream10-minimal

WORKDIR /home/jq

RUN microdnf install -y jq && microdnf clean all

COPY ./example.json ./example.json

ENTRYPOINT ["/usr/bin/bash"]
