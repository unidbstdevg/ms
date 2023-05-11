from Conveyor import Conveyor, StartConveyor, FinalConveyor


class Factory:
    def __init__(self, durations):
        self.final_conv = FinalConveyor()

        self.conveyors = []
        prev = self.final_conv
        # iterate durations in reverse order, from the last to the second
        for dur in durations[:0:-1]:
            new = Conveyor(dur, prev)
            self.conveyors.append(new)
            prev = new
        self.conveyors.reverse()

        # debug print conveyors
        # for x in self.conveyors:
        #     print((x.random_duration.start + x.random_duration.end - 1) / 2)
        # exit(1)

        self.start_conv = StartConveyor(durations[0], self.conveyors[0])

    def emulate(self, N):
        for i in range(N):
            self.tick()

    def tick(self):
        self.start_conv.tick()
        for conv in self.conveyors:
            conv.tick()
        # self.final_conv.tick()

        self.debug_print_conveyors()

    def debug_print_conveyors(self):
        print("Start({:3})".format(self.start_conv.process_timer), end="")
        for conv in self.conveyors:
            s = conv.stat()
            print(" -> ({:2}, {:2})".format(s["process_timer"], s["in_queue"]), end="")
        print(" -> End({})".format(self.final_conv.count))
