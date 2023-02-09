import random
import os
from pprint import pp
from shared import wanted, out_dir

# variant 10: difference is 5

out_file = "diff_5"


def get_count(arr):
    def filter_f(x):
        return True if abs(x[0] - x[1]) == 5 else False

    return len(list(filter(filter_f, arr)))


kubiks = [(random.randint(1, 6), random.randint(1, 6)) for x in range(1, 5000)]
# counts_for_wanted = {}
ver_for_wanted = {}
for w in wanted:
    count = get_count(kubiks[:w])
    # counts_for_wanted[a] = counts
    ver_for_wanted[w] = count / w

pp(ver_for_wanted)

os.makedirs(out_dir, exist_ok=True)
with open(out_dir + out_file, "w") as f:
    for w, ver in ver_for_wanted.items():
        f.write(str(w) + " " + str(ver) + "\n")
