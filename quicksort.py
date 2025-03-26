import asyncio 
import random

from typing import Callable

def generate(n: int, generator: Callable) -> list:
    return [generator() for _ in range(n)]

def quicksort(arr: list) -> list:
    if not arr:
        return []
    pivot = arr[0]
    left = [x for x in arr if x < pivot]
    mid = [x for x in arr if x == pivot]
    right = [x for x in arr if x > pivot]
    return quicksort(left) + mid + quicksort(right)

def checker(arr: list) -> bool:
    i = arr[0]
    for x in arr[1:]:
        if i > x:
            return False
        i = x
    return True

async def main():
    target = generate(100, lambda : random.randint(0, 100))
    x = quicksort(target)
    print(checker(x))

if __name__ == "__main__":
    asyncio.run(main())
