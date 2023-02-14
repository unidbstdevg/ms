import random


def myf(x):
    return x**3


N = 5000
Spar = 2

# A(0; 0), B(1; 0), C(1; 2), D(0; 2)
points = [(random.uniform(0, 1), random.uniform(0, 2)) for x in range(N)]

Ns = 0
for (x, y) in points:
    f = myf(x)
    if y <= f:
        Ns += 1

print("Ns =", Ns)
S = Spar * (Ns / N)
print("S =", S)
