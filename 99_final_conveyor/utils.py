def clear_screen():
    print("\033c", end="")


# Source:
# https://github.com/andrewp-as-is/columnate.py/blob/master/columnate/__init__.py
def _lists(matrix):
    widths = [max(map(len, map(str, col))) for col in zip(*matrix)]
    for row in matrix:
        yield "  ".join((str(val).ljust(width) for val, width in zip(row, widths)))


def columnate_lists(matrix):
    return "\n".join(list(_lists(matrix)))
