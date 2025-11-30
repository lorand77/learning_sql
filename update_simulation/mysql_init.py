import MySQLdb
import random
import json
from config import NUM_KEYS, MYSQL_CONFIG_FILE

if __name__ == "__main__":
    with open(MYSQL_CONFIG_FILE) as f:
        config = json.load(f)
    
    conn = MySQLdb.connect(**config)
    cursor = conn.cursor()
    
    cursor.execute('DROP TABLE IF EXISTS records')
    cursor.execute('''
        CREATE TABLE records (
            `key` INT PRIMARY KEY,
            value INT NOT NULL DEFAULT 0
        )
    ''')
    
    keys = list(range(1, NUM_KEYS + 1))
    random.shuffle(keys)
    
    cursor.executemany('INSERT INTO records (`key`, value) VALUES (%s, 0)', 
                       [(key,) for key in keys])
    
    conn.commit()
    conn.close()
    
    print(f"Created MySQL database with {NUM_KEYS} records")
