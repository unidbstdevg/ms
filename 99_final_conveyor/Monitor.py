from time import sleep
from utils import clear_screen, columnate_lists, round2p


class Monitor:
    def __init__(self, start, conveyors, final):
        self.start = start
        self.conveyors = conveyors
        self.final = final

        self.total_ticks = 0

        self.queues_stat = [0 for _ in range(len(self.conveyors))]

    def tick(self):
        self.total_ticks += 1

        clear_screen()
        print(
            "Producer timer: {} (from {})".format(
                self.start.process_timer, self.start.random_duration
            )
        )
        matrix = [
            [
                "",
                "in_queue",
                "avg_queue",
                "idle_in_queue",
                "timer",
                "timer_range",
            ]
        ]
        for i, conv in enumerate(self.conveyors):
            self.queues_stat[i] += conv.in_queue
            avg_queue = round2p(self.queues_stat[i] / self.total_ticks)
            idle_in_queue = self.queues_stat[i]
            matrix.append(
                [
                    "->",
                    conv.in_queue,
                    avg_queue,
                    idle_in_queue,
                    conv.process_timer,
                    conv.random_duration,
                ]
            )
        print(columnate_lists(matrix))
        print(
            "Done {} batches, {} details are good".format(
                self.final.count, self.final.count * int(10 * 0.95)
            )
        )
        print("\nTick: {}".format(self.total_ticks))

        sleep(0.1)
