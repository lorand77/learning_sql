from config import DB_FILE_FF

def read_and_sum():
    """Read all records and calculate the sum of values."""
    with open(DB_FILE_FF, 'r') as f:
        return sum(int(line.split(':')[1]) for line in f)

if __name__ == "__main__":
    total_sum = read_and_sum()
    print(f"Sum of all values: {total_sum}")


