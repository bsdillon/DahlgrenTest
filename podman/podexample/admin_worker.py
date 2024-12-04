import socket
import time

def log_interaction(data):
    log_manager_address = ('localhost', 9999)  # Adjust as needed
    with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as sock:
        message = f"Admin received order: {data} at {time.strftime('%H:%M:%S')}"
        sock.sendto(message.encode(), log_manager_address)

def main():
    # TCP setup
    print("Admin Worker starting...")
    tcp_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    print("Admin Worker creating socket...")
    tcp_sock.bind(('localhost', 8889))  # Listen on port 8889 for input
    print("Admin Worker binding socket...")
    tcp_sock.listen(1)
    print("Admin Worker listening on port 8889...")

    print("Admin worker listening for input...")

    while True:
        conn, addr = tcp_sock.accept()
        with conn:
            data = conn.recv(1024).decode()
            if data:
                log_interaction(data)

if __name__ == "__main__":
    main()