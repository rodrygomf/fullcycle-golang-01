FROM golang:1.19.0 AS builder
WORKDIR /go/src
COPY main.go .
RUN go build main.go

FROM scratch
COPY --from=builder /go/src/main .
CMD ["./main"]
