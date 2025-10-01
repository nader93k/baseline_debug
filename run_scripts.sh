python evaluator.py \
    /Users/u7899572/Git/baseline_debug/valid-benchmarks-0.2/ \
    --num_cpus 5 \
    --iters 5 \
    --time_out 15

# debug
python evaluator.py \
    /Users/u7899572/Git/baseline_debug/valid-benchmarks-0.2/ \
    --num_cpus 1 \
    --iters 1 \
    --time_out 150

# git reset
git restore valid-benchmarks-0.2
