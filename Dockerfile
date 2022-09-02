# FROM archlinux

# WORKDIR /short

# COPY ./main ./

# CMD ["./main"]


# 1
FROM golang:latest AS build

WORKDIR /short

COPY go.mod .
COPY go.sum .
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -tags netgo -ldflags '-w -extldflags "-static"' -o ./main ./cmd/shortner

# 2

FROM scratch

WORKDIR /short

COPY --from=build /short/main /short/main
COPY --from=build /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=build /usr/share/zoneinfo /usr/share/zoneinfo
ENV TZ=Europe/Moscow

EXPOSE 8000

ENV REGUSER_STORE=mem

CMD ["./main"]

