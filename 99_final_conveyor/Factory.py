from Conveyor import Conveyor, FinalConveyor


NEW_PARTS_EACH_MINUTES = 175


class Factory:
    def __init__(self, durations):
        self.conveyors = [FinalConveyor()]
        for dur in durations[::-1]:
            last = self.conveyors[0]
            new = Conveyor(dur, last)
            self.conveyors.insert(0, new)

        self.timer_for_new_batch = -1

    def try_input_new_batch(self):
        self.timer_for_new_batch -= 1
        if self.timer_for_new_batch <= 0:
            self.timer_for_new_batch = NEW_PARTS_EACH_MINUTES
            self.conveyors[0].input()

    def tick_all_conveyors(self):
        # except of last, which is FinalConveyor, he has no tick()
        for conv in self.conveyors[:-1]:
            conv.tick()

    def emulate(self, N):
        for i in range(N):
            self.tick()

    def tick(self):
        self.try_input_new_batch()
        self.tick_all_conveyors()

        self.debug_print_conveyors()

    def debug_print_conveyors(self):
        print("Start({:3})".format(self.timer_for_new_batch), end="")
        for conv in self.conveyors[:-1]:
            s = conv.stat()
            print(" -> ({:2}, {:2})".format(s["process_timer"], s["in_queue"]), end="")

        print(" -> End({})".format(self.conveyors[-1].count))
