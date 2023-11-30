FROM golang:1.18

WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY *.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -o /docker_example
EXPOSE 8080
CMD ["/docker_example"]
