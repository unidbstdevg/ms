import os
from time import sleep


class Monitor:
    def __init__(self, start, conveyors, final):
        self.start = start
        self.conveyors = conveyors
        self.final = final

        self.total_ticks = 0

    def tick(self):
        self.total_ticks += 1

        clear_screen()
        print(
            "Producer timer: {} (of {})".format(
                self.start.process_timer, self.start.random_duration
            )
        )
        for conv in self.conveyors:
            print(
                " -> in_queue: {}; timer: {} (of {})".format(
                    conv.in_queue, conv.process_timer, conv.random_duration
                )
            )
        print(
            "Done {} batches, {} details are good".format(
                self.final.count, self.final.count * int(10 * 0.95)
            )
        )
        print("\nTick: {}".format(self.total_ticks))

        sleep(0.1)


def clear_screen():
    os.system("cls" if os.name == "nt" else "clear")
