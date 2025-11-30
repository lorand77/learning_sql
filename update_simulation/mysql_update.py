import MySQLdb
import random
import time
import json
from config import NUM_KEYS, NUM_UPDATES_MYSQL, MYSQL_CONFIG_FILE

if __name__ == "__main__":
    print(f"Performing {NUM_UPDATES_MYSQL} random updates...")
    start_time = time.time()
    
    with open(MYSQL_CONFIG_FILE) as f:
        config = json.load(f)
    
    conn = MySQLdb.connect(**config)
    conn.autocommit(False)
    cursor = conn.cursor()
    
    BATCH_SIZE = 10

    for i in range(NUM_UPDATES_MYSQL):
        cursor.execute('UPDATE records SET value = value + 1 WHERE `key` = %s', 
                      (random.randint(1, NUM_KEYS),))
        
        if (i + 1) % BATCH_SIZE == 0:
            conn.commit()
    
    conn.commit()
    conn.close()
    
    elapsed_time = time.time() - start_time
    print(f"Time elapsed: {elapsed_time:.4f} seconds")
    print(f"Average time per update: {(elapsed_time / NUM_UPDATES_MYSQL) * 1000:.4f} ms")
