FROM golang:alpine AS builder

RUN apk update && apk add --no-cache git

WORKDIR /go/src/app

COPY . .

# Using go get.
RUN go get -d -v
# Build the binary.
RUN go build -o /go/bin/hello

# FROM scratch
# # Copy our static executable.
# COPY --from=builder /go/bin/hello /go/bin/hello
# # Run the hello binary.
# ENTRYPOINT ["/go/bin/hello"]