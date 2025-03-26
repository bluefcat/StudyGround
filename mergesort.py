import asyncio
import random

def merge(l: list, sidx: int, eidx: int) -> list:
    if sidx == eidx:
        return [l[sidx]] 

    midx: int = (sidx + eidx) >> 1

    left = merge(l, sidx, midx)
    right = merge(l, midx+1, eidx)
    result = []
    x, y = left.pop(0), right.pop(0)
    while True:
        if y is None or (x is not None and x[1] < y[1]):
            result.append(x)
            x = left and left.pop(0) or None
        elif x is None or (y is not None and y[1] <= x[1]):
            result.append(y)
            y = right and right.pop(0) or None
        if (not x) and (not y):
            break
    return result

async def main():
    n = 10
    x = [(i, random.randint(1, 5)) for i in range(n)]
    print(x)
    y = merge(x, 0, len(x)-1)
    print(y)

if __name__ == "__main__":
    asyncio.run(main())
