import timeit

def performance(items, repeat=5, number=1000000):
    
    p = {
        'Lists': min(timeit.repeat(
        stmt='items[2]', setup=f'items={list(items)}', repeat=repeat, number=number)),
        'Tuples': min(timeit.repeat(
        stmt='items[2]', setup=f'items={tuple(items)}', repeat=repeat, number=number)),
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
    
    to_print = f'\nTime in {prefix}:\n'
    for key, value in p.items():
        to_print += f'{key}:\t{value:.15f}\n'
    
    print(to_print)
    
print('Conducting an operation: items[2]')
performance(items=(0,1,2,3,4))