#!/bin/sh

# Start the time counter
python /app/time_counter.py &

# Start the admin worker
python /app/admin_worker.py &

# Start the log manager
python /app/log_manager.py &

# Wait for all background processes to finish
wait