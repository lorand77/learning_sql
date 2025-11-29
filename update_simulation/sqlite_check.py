import sqlite3
from config import DB_FILE_SQLITE

if __name__ == "__main__":
    conn = sqlite3.connect(DB_FILE_SQLITE)
    cursor = conn.cursor()
    
    cursor.execute('SELECT SUM(value) FROM records')
    total_updates = cursor.fetchone()[0] or 0
    
    conn.close()
    
    print(f"Total updates performed: {total_updates}")
