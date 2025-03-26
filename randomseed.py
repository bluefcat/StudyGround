import random
from copy import deepcopy
random.seed(101)

prev = random.getstate()
for _ in range(10):
    random.randint(0, 10)
    s = random.getstate()

    print(prev[0] == s[0])
    print(len(prev[1]) == len(s[1]))
    for x, y in zip(prev[1], s[1]):
        if x != y:
            print(x, y)
    print(prev[2] == prev[2])
    
    s = deepcopy(prev) 

state = random.getstate()

for _ in range(5):
    print([
        random.randint(0, 10) for _ in range(10)
    ])
    random.setstate(state)
