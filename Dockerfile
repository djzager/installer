FROM golang:1.13 AS builder
ENV GOPATH=/go
WORKDIR /go/src/github.com/openshift/installer/
COPY . .
RUN ./hack/build.sh

FROM registry.access.redhat.com/ubi8/ubi-minimal
COPY --from=builder /go/src/github.com/openshift/installer/bin/openshift-install /usr/bin/openshift-install
ENTRYPOINT ["/usr/bin/openshift-install"]
