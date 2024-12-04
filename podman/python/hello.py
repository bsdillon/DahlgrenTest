import time

print("Started...", flush=True)
for i in range(1, 11):
    print(f"Number: {i}", flush=True)
    time.sleep(5)

print("Finished.", flush=True)