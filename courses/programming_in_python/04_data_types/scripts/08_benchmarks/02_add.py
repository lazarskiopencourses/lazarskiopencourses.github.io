import timeit

def performance(range_len, repeat=5, number=1000):
    
    stmt_list = f'''
items = list()
for i in range({range_len}):
    items.append(i)
'''
    stmt_tuple = f'''
items = tuple()
for i in range({range_len}):
    items += (i,)
'''
    
    stmt_set = f'''
items = set()
for i in range({range_len}):
    items.add(i)
'''
    
    p = {
        'Lists': min(timeit.repeat(
        stmt=stmt_list, repeat=repeat, number=number)),
        'Tuples': min(timeit.repeat(
        stmt=stmt_tuple, repeat=repeat, number=number)),
        'Sets': min(timeit.repeat(
        stmt=stmt_set, repeat=repeat, number=number))
    }
    
    prefixes = {
        10 ** 3: 'ms',
        10 ** 6: 'μs',
        10 ** 9: 'ns'
    }
    
    prefix = prefixes.get(number)
    if not prefix:
        for key in p:
            p[key] = p[key] / number
        prefix = 's'
    
    to_print = f'Time in {prefix}:\n'
    for key, value in p.items():
        to_print += f'{key}:\t{value:.15f}\n'
    
    print(to_print)

print("Adding numbers 0,1,2,...,9 to predefined object")
performance(10)

print("Adding numbers 0,1,2,...,999 to predefined object")
performance(1000)