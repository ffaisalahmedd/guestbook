FROM golang:1.8-alpine
ADD . /go/src/guestbook
RUN go install guestbook

FROM alpine:latest
COPY --from=0 /go/bin/guestbook .
ENV PORT 80
CMD ["./guestbook"]
