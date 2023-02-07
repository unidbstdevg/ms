import random
import os


def get_counts(arr):
    return [arr.count(x) for x in range(1, 6+1)]


kubiks = [random.randint(1, 6) for x in range(1, 5000)]

wanted = [10, 100, 500, 1000, 2000, 3000, 4000, 5000]
# counts_for_wanted = {}
ver_for_wanted = {}
for w in wanted:
    counts = get_counts(kubiks[:w])
    # counts_for_wanted[a] = counts
    ver_for_wanted[w] = [x / w for x in counts]

print(ver_for_wanted)

out_dir = "out/"
os.makedirs(out_dir, exist_ok=True)
for kubik in range(1, 6+1):
    with open(out_dir + str(kubik), "w") as f:
        for w, ver in ver_for_wanted.items():
            f.write(str(w) + " " + str(ver[kubik - 1]) + "\n")
