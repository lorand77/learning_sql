import random
import json
from config import DB_FILE_FF, DB_FILE_FF_INDEX, RECORD_WIDTH, NUM_KEYS

if __name__ == "__main__":
    keys = list(range(1, NUM_KEYS + 1))
    random.shuffle(keys)
    
    index = {}
    
    with open(DB_FILE_FF, 'w') as f:
        for key in keys:
            index[key] = f.tell()
            f.write(f"{key}:0".ljust(RECORD_WIDTH - 1) + "\n")
    
    with open(DB_FILE_FF_INDEX, 'w') as f:
        json.dump(index, f)
    
    print(f"Created flat file database with {NUM_KEYS} records")
    print(f"Created index file with {len(index)} entries")
