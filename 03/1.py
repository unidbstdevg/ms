import random
import os

# from pprint import pp

out_dir = "out/"


N_days = 100
N_lights_per_day = 6
max_day_sum = 12


def rand_light():
    return random.randint(0, 2)


def rand_day():
    return [rand_light() for x in range(N_lights_per_day)]


data = [rand_day() for x in range(N_days)]

sums = [sum(day) for day in data]

ver_differ_sums_count = [(sums.count(x) / N_days) for x in range(max_day_sum)]

integral = [ver_differ_sums_count[0]]
for x in range(1, max_day_sum):
    integral.append(integral[x - 1] + ver_differ_sums_count[x])


os.makedirs(out_dir, exist_ok=True)
fgauss = open(out_dir + "gauss", "w")
fintegral = open(out_dir + "integral", "w")

for x in range(max_day_sum):
    sgauss = str(x) + " " + str(ver_differ_sums_count[x]) + "\n"
    sintegral = str(x) + " " + str(integral[x]) + "\n"
    fgauss.write(sgauss)
    fintegral.write(sintegral)
