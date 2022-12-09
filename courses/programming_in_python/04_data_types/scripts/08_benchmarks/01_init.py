import timeit
import sys

def performance(*items, repeat=5, number=1000000):
    
    if len(items) == 1:
        items = items[0]
    
    p = {
        'Lists': (
            min(timeit.repeat(
                stmt=f'x={list(items)}', repeat=repeat, number=number)),
            sys.getsizeof(list(items))),
        'Tuples': (
            min(timeit.repeat(
                stmt=f'x={tuple(items)}', repeat=repeat, number=number)),
            sys.getsizeof(tuple(items))),
        'Sets': (
            min(timeit.repeat(
                stmt=f'x={set(items)}', repeat=repeat, number=number)),
            sys.getsizeof(set(items))),
    }
    
    prefixes = {
        10 ** 3: 'ms',
        10 ** 6: 'μs',
        10 ** 9: 'ns'
    }
    
    prefix = prefixes.get(number)
    if not prefix:
        for key in p:
            p[key] = p[key][0] / number, p[key][1]
        prefix = 's'
    
    to_print = ''
    for key, value in p.items():
        to_print += f'{key}:\nTime in {prefix}: {value[0]:.5f}, Size in bytes: {value[1]}\n'
    
    print(to_print)

print("Initializing an object with elements 'Banach','Ulam','Steinhaus'")
performance('Banach', 'Ulam', 'Steinhaus')

print("Initializing an object with elements 0,1,...,999")
performance(range(1000))