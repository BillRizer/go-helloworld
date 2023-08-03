FROM golang:1.20 AS build

WORKDIR /usr/src/app

COPY . .

RUN go build ./src/main.go

FROM scratch AS final

LABEL maintainer="pablo.telis"

WORKDIR /app

COPY --from=build /usr/src/app /app

CMD ["/app/main"]