from random import randrange


class RandomDurationRange:
    def __init__(self, middle, offset):
        self.start = middle - offset
        self.end = middle + offset + 1

    def random(self):
        return randrange(self.start, self.end)


# # test
# a = RandomDurationRange(10, 4)
# for i in range(1000):
#     print(a.random())
