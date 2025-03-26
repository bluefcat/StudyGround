import time
import asyncio
import random

from typing import Iterable


def normal_form(x: Iterable):
    for i in x:
        print("Some cheap action in NORMAL FORM")
        time.sleep(0.5)
        yield i

async def normal_iter(x: Iterable):
    for i in normal_form(x):
        print(f"Some expensive action in NORMAL ITER {i}")
        await asyncio.sleep(20)
    return 0

async def async_form(x: Iterable):
    for i in x:
        print("Some cheap action in ASYNC FORM")
        await asyncio.sleep(0.5)
        yield i

async def async_iter(x: Iterable):
    async for i in async_form(x):
        print(f"Some expensive action in ASYNC ITER {i}")
        await asyncio.sleep(20)
    return 0 


async def main():
    a = time.time()
    await normal_iter([1, 2, 3])
    print(f"{time.time() - a}")

    a = time.time()
    await async_iter([1, 2, 3])
    print(f"{time.time() - a}")
if __name__ == "__main__":
    asyncio.run(main())

