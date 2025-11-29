import sqlite3
import random
import time
from config import NUM_KEYS, NUM_UPDATES_SQLITE, DB_FILE_SQLITE

if __name__ == "__main__":
    print(f"Performing {NUM_UPDATES_SQLITE} random updates...")
    start_time = time.time()
    
    conn = sqlite3.connect(DB_FILE_SQLITE, timeout=300)
    cursor = conn.cursor()
    
    for i in range(NUM_UPDATES_SQLITE):
        cursor.execute('UPDATE records SET value = value + 1 WHERE key = ?', 
                      (random.randint(1, NUM_KEYS),))
        conn.commit()
        
    conn.close()
    
    elapsed_time = time.time() - start_time
    print(f"Time elapsed: {elapsed_time:.4f} seconds")
    print(f"Average time per update: {(elapsed_time / NUM_UPDATES_SQLITE) * 1000:.4f} ms")
