import asyncio

async def waiter(i, event):
    print(f"{i} waiting for it ...")
    await event.wait()
    print(f"some task processing")
    await asyncio.sleep(i)
    print(f"{i}... got it!")

async def main():
    event = asyncio.Event()
    # asyncio.create_task create task and run instantly task 
    # asyncio.gather's behavior is similary asyncio.create_task but with await
    # so, this code's waiter start in line 18
    # and join in line 23
    # if waiter_task = [waiter(i, event) for i in range(5)]
    # then, waiter_task's task start in line 23 and join in line 23
    waiter_task = [asyncio.create_task(waiter(i, event)) for i in range(5)]
    print("run sleep?")
    await asyncio.sleep(1)
    event.set()
    print("run waiter_task?") #No
    await asyncio.gather(*waiter_task)

asyncio.run(main())
