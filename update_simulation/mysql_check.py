import MySQLdb
import json
from config import MYSQL_CONFIG_FILE

if __name__ == "__main__":
    with open(MYSQL_CONFIG_FILE) as f:
        config = json.load(f)
    
    conn = MySQLdb.connect(**config)
    cursor = conn.cursor()
    
    cursor.execute('SELECT SUM(value) FROM records')
    total_updates = cursor.fetchone()[0] or 0
    
    conn.close()
    
    print(f"Total updates performed: {total_updates}")
