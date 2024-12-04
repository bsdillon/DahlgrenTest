import socket

def main():
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.bind(('localhost', 9999))  # Listen on all interfaces

    while True:
        data, addr = sock.recvfrom(1024)  # Buffer size
        with open('/shared/log.txt', 'a') as f:
            f.write(data.decode() + '\n')

if __name__ == "__main__":
    main()