FROM alpine:latest
RUN apk update && \
    apk add --no-cache python3 py3-pip
COPY hello.py /app/hello.py
COPY health.py /app/health.py
WORKDIR /app
CMD ["python3", "hello.py"]