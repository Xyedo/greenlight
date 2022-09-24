FROM golang:1.19-alpine as builder

LABEL maintainer="xyedo | Hafid Mahdi"

RUN apk update && apk add --no-cache git

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o webapi ./cmd/api

FROM golang:1.19-alpine

RUN apk --no-cache add ca-certificates

WORKDIR /root/

COPY --from=builder /app/webapi .

COPY --from=builder /app/.env .

EXPOSE 4000

CMD ["./webapi"]