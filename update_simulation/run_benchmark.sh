#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <tool> <num_parallel>"
    echo "  tool: ff, sqlite, or mysql"
    echo "  num_parallel: number of parallel updater processes"
    exit 1
fi

TOOL=$1
NUM_PARALLEL=$2

case $TOOL in
    ff|sqlite|mysql)
        ;;
    *)
        echo "Error: Invalid tool '$TOOL'. Must be ff, sqlite, or mysql"
        exit 1
        ;;
esac

echo "Running benchmark for $TOOL with $NUM_PARALLEL parallel updaters"
echo "=========================================="

echo "Step 1: Running init..."
python3 ${TOOL}_init.py
if [ $? -ne 0 ]; then
    echo "Error: init failed"
    exit 1
fi

echo ""
echo "Step 2: Running $NUM_PARALLEL parallel updaters..."
start_time=$(date +%s.%N)

pids=()
for i in $(seq 1 $NUM_PARALLEL); do
    python3 ${TOOL}_update.py &
    pids+=($!)
done

for pid in "${pids[@]}"; do
    wait $pid
done

end_time=$(date +%s.%N)
elapsed=$(echo "$end_time - $start_time" | bc)

echo ""
echo "All updaters completed in $elapsed seconds"

echo ""
echo "Step 3: Running check..."
python3 ${TOOL}_check.py

echo ""
echo "=========================================="
echo "Benchmark complete!"
