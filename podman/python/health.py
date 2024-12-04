import sys

def health_check():
    # Simulate an unhealthy status by returning a non-zero exit code
    sys.exit(1)

if __name__ == "__main__":
    health_check()