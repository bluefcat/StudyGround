def quicksort(xs):
    if not xs:
        return xs
    return quicksort([x for x in xs if x < xs[0]]) + [xs[0]] + quicksort([x for x in xs if x > xs[0]])

print(quicksort([3, 2, 1]))
