FROM quay.io/projectquay/golang:1.24 AS builder

ARG TARGETPLATFORM

WORKDIR /app
COPY ./app/go.mod .
COPY ./app/main.go .
RUN go mod download

RUN --mount=type=cache,target=/root/.cache/go-build \
    GOOS=$(echo ${TARGETPLATFORM} | cut -d'/' -f1) \
    GOARCH=$(echo ${TARGETPLATFORM} | cut -d'/' -f2) \
    go build -o /hello_app .


FROM alpine:latest
COPY --from=builder /hello_app /hello_app

ENTRYPOINT [ "/hello_app" ]