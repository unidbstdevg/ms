class Conveyor:
    def __init__(self, duration_interval, next_out):
        self.random_duration = duration_interval
        self.next_out = next_out
        self.in_queue = 0

        self.process_timer = 0

    # this function actually receives new batch and or add it to queue
    def input(self):
        self.in_queue += 1

    def is_processing(self):
        return self.process_timer > 0

    def tick(self):
        self.try_pick_next_from_queue_if_need()

        if self.is_processing():
            self.process_timer -= 1
            if self.process_timer <= 0:
                self.next_out.input()
        else:
            pass
            # print("Me idle")
            # UPD: there I can exactly count how much ticks this Conveyor had
            # in idle. Yes!

    def try_pick_next_from_queue_if_need(self):
        if not self.is_processing() and self.in_queue > 0:
            self.in_queue -= 1
            self.process_timer = self.random_duration.random()

    def stat(self):
        return {"in_queue": self.in_queue, "process_timer": self.process_timer}


# this is like "Producer" conveyor. He does not have input()
class StartConveyor:
    def __init__(self, duration_interval, next_out):
        self.random_duration = duration_interval
        self.next_out = next_out

        self.process_timer = 0

    def tick(self):
        if self.process_timer <= 0:
            self.next_out.input()
            self.process_timer = self.random_duration.random()

        self.process_timer -= 1


class FinalConveyor:
    def __init__(self):
        self.count = 0

    def input(self):
        self.count += 1


# # test

# from RandomDurationRange import RandomDurationRange  # noqa: E402

# final = FinalConveyor()
# a2 = Conveyor(RandomDurationRange(10, 4), final)

# a2.input()

# for i in range(50):
#     a2.tick()
#     print(a2.stat())
