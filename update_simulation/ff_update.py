import random
import time
import fcntl
import json
from config import DB_FILE_FF, DB_FILE_FF_INDEX, RECORD_WIDTH, NUM_KEYS, NUM_UPDATES_FF

with open(DB_FILE_FF_INDEX, 'r') as f:
    INDEX = {int(k): v for k, v in json.load(f).items()}

def update_value(key):
    """Update the value for a given key by incrementing it by 1."""
    position = INDEX.get(key)
    if position is None:
        return
    
    with open(DB_FILE_FF, 'r+') as f:
        fcntl.flock(f.fileno(), fcntl.LOCK_EX)
        
        f.seek(position)
        record = f.read(RECORD_WIDTH)
        
        parts = record.strip().split(':')
        new_value = int(parts[1]) + 1
        
        f.seek(position)
        f.write(f"{parts[0]}:{new_value}".ljust(RECORD_WIDTH - 1) + "\n")
        f.flush()

if __name__ == "__main__":
    print(f"Performing {NUM_UPDATES_FF} random updates...")
    start_time = time.time()
    
    for i in range(NUM_UPDATES_FF):
        update_value(random.randint(1, NUM_KEYS))
    
    elapsed_time = time.time() - start_time
    
    print(f"Time elapsed: {elapsed_time:.4f} seconds")
    print(f"Average time per update: {(elapsed_time / NUM_UPDATES_FF) * 1000:.4f} ms")
