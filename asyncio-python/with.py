import asyncio
import time

class A:
    def __enter__(self):
        loop = asyncio.get_event_loop()
        loop.run_in_executor(None, time.sleep, 1)
        return 1

    def __exit__(self, a, b, c):
        return

async def main():
    with A() as x:
        print(x)

if __name__ == "__main__":
    loop = asyncio.get_event_loop()
    loop.run_until_complete(main())
    loop.close()
