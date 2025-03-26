import asyncio
from queue import PriorityQueue

class Worker:
    def __init__(self, capacity: int):
        self._queue = PriorityQueue()
        self._capacity = capacity
        
        self._tasks = []
        self._event = asyncio.Event()

    def append(self, priority: int, task, *args, **kwargs):
        self._queue.put((priority, task, args, kwargs))
        self._event.set()

    async def working(self):
        while True:
            await self._event.wait()
            print(self._tasks)
            _, task, args, kwargs = self._queue.get()
            asyncio.create_task(task(*args, **kwargs))

            if self._queue.empty():
                self._event.clear()

async def task(i: int):
    print(f"#{i} TASK RUNNING")
    await asyncio.sleep(i)
    print(f"#{i} TASK FINISH")

async def main():
    worker = Worker(5)
    
    working_task = asyncio.create_task(worker.working())
    
    for i in range(5):
        print(f"#{i} TASK append")
        worker.append(i, task, i)

    await working_task

asyncio.run(main())
