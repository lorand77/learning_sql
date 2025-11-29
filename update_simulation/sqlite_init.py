import sqlite3
import random
from config import NUM_KEYS, DB_FILE_SQLITE as DB_FILE

if __name__ == "__main__":
    conn = sqlite3.connect(DB_FILE)
    cursor = conn.cursor()
    
    cursor.execute('DROP TABLE IF EXISTS records')
    
    cursor.execute('''
        CREATE TABLE records (
            key INTEGER PRIMARY KEY,
            value INTEGER NOT NULL DEFAULT 0
        )
    ''')
    
    keys = list(range(1, NUM_KEYS + 1))
    random.shuffle(keys)
    
    cursor.executemany('INSERT INTO records (key, value) VALUES (?, 0)', 
                       [(key,) for key in keys])
    
    conn.commit()
    conn.close()
    
    print(f"Created SQLite database with {NUM_KEYS} records")
