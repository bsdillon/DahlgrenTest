FROM alpine:latest
WORKDIR /app
COPY hello.sh /app/hello.sh
RUN chmod +x /app/hello.sh
CMD ["/app/hello.sh"]