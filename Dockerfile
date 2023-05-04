FROM golang:1.20-alpine3.17 AS builder
WORKDIR /app
COPY . .
RUN export CGO_ENABLED=0
RUN go build -o teste -ldflags "-s -w" ./desafio

FROM scratch
WORKDIR /app
COPY --from=builder /app .
ENTRYPOINT ["./teste"]