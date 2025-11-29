import random
from config import DB_FILE_FF, RECORD_WIDTH, NUM_KEYS

if __name__ == "__main__":
    keys = list(range(1, NUM_KEYS + 1))
    random.shuffle(keys)
    
    with open(DB_FILE_FF, 'w') as f:
        for key in keys:
            f.write(f"{key}:0".ljust(RECORD_WIDTH - 1) + "\n")
    
    print(f"Created flat file database with {NUM_KEYS} records")
