from Conveyor import Conveyor, StartConveyor, FinalConveyor
from Monitor import Monitor


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

        self.start_conv = StartConveyor(durations[0], self.conveyors[0])

        self.monitor = Monitor(self.start_conv,
                               self.conveyors,
                               self.final_conv)

    def emulate(self, N):
        for i in range(N):
            self.tick()

    def tick(self):
        self.start_conv.tick()
        for conv in self.conveyors:
            conv.tick()

        self.monitor.tick()
