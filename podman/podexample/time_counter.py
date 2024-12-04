import time
import socket

def main():
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    log_manager_address = ('localhost', 9999)  # Adjust as needed

    while True:
        current_time = time.strftime("%H:%M:%S", time.localtime())
        sock.sendto(f"Current Time: {current_time}".encode(), log_manager_address)
        time.sleep(1)

if __name__ == "__main__":
    main()