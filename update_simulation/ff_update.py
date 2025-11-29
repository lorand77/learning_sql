import random
import time
import fcntl
from config import DB_FILE_FF, RECORD_WIDTH, NUM_KEYS, NUM_UPDATES_FF

def update_value(key):
    """Update the value for a given key by incrementing it by 1."""
    with open(DB_FILE_FF, 'r+') as f:
        # Acquire exclusive lock for the entire operation
        fcntl.flock(f.fileno(), fcntl.LOCK_EX)
        
        # Find the key position
        position = 0
        while True:
            record = f.read(RECORD_WIDTH)
            if not record:
                return
            
            if int(record.split(':')[0]) == key:
                break
            
            position += RECORD_WIDTH
        
        # Update the value
        parts = record.strip().split(':')
        new_value = int(parts[1]) + 1
        
        f.seek(position)
        f.write(f"{parts[0]}:{new_value}".ljust(RECORD_WIDTH - 1) + "\n")
        f.flush()
        
        # Lock is automatically released when file is closed

if __name__ == "__main__":
    print(f"Performing {NUM_UPDATES_FF} random updates...")
    start_time = time.time()
    
    for i in range(NUM_UPDATES_FF):
        update_value(random.randint(1, NUM_KEYS))
    
    elapsed_time = time.time() - start_time
    
    print(f"Time elapsed: {elapsed_time:.4f} seconds")
    print(f"Average time per update: {(elapsed_time / NUM_UPDATES_FF) * 1000:.4f} ms")
