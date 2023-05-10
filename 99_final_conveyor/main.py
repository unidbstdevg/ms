from Factory import Factory
from RandomDurationRange import RandomDurationRange

a = Factory(
    [
        RandomDurationRange(10, 4),
        RandomDurationRange(60, 20),
        RandomDurationRange(5, 3),
        RandomDurationRange(80, 15),
        RandomDurationRange(5, 3),
    ]
)

a.emulate(8 * 60)
