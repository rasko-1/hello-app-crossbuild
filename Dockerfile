FROM quay.io/projectquay/golang:1.24

ARG TARGETPLATFORM
ARG BUILDPLATFORM

RUN echo "Building for platform: ${TARGETPLATFORM} on ${BUILDPLATFORM}"