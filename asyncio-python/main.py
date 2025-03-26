import asyncio
import random

def yield_loop(x):
    for i in x:
        yield i 

async def async_yield_loop(x):
    for i in x:
        await asyncio.sleep(random.random())
        yield i

async def async_yield_print(x):
    async for i in async_yield_loop(x):
        print(i)

async def some_expensive_task(x: int):
    print(f"Some expensive task {x}")
    await asyncio.sleep(random.random() * 10)
    print(f"{x} task compelete")
    return x

async def some_list():
    for i in range(5):
        yield i

async def main():
    #a = yield_loop([1, 2, 3])
    #b = yield_loop([5, 6, 7])

    #print(a.__next__())
    #print(b.__next__())
    
    #tasks = [async_yield_print([1, 2, 3]), async_yield_print([4, 5, 6])]
    #tasks = [asyncio.create_task(task) for task in tasks]
    
    #a = [await some_expensive_task(i) for i in range(5)]
    #print(a)
    #b = [await some_expensive_task(i) async for i in some_list()]
    #print(b)

    tasks = [
        asyncio.ensure_future(some_expensive_task(i)) for i in range(5)
    ]
    result = await asyncio.gather(*tasks)

    #a = [task.cr_await for task in tasks]
    #print(a)
    #print(tasks)
    print(result)
if __name__ == "__main__":
    asyncio.run(main())

