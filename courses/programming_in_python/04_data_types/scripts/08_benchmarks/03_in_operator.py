import timeit

def performance(stmt, items, repeat=5, number=1000):
    
    p = {
        'Lists': min(timeit.repeat(
        stmt=stmt, setup=f'items={list(items)}', repeat=repeat, number=number)),
        'Tuples': min(timeit.repeat(
        stmt=stmt, setup=f'items={tuple(items)}', repeat=repeat, number=number)),
        'Sets': min(timeit.repeat(
        stmt=stmt, setup=f'items={set(items)}', repeat=repeat, number=number))
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
    
    to_print = f'Time in {prefix}:\n'
    for key, value in p.items():
        to_print += f'{key}:\t{value:.15f}\n'
    
    print(to_print)

print('Element exists in data.')
print("\nOperation:\n'Andes in 'Andes', 'Carpathians', 'Alps', 'Himalayas'?")

performance(
    stmt="'Andes' in items", 
    items=('Andes', 'Carpathians', 'Alps', 'Himalayas'))

print('Operation:\n50000 in 0,1,2,...,99999?')

performance(
    stmt="50000 in items", 
    items=range(100000))

print("Element doesn't exist in data.")
print("\nOperation:\n'Sudetes in 'Andes', 'Carpathians', 'Alps', 'Himalayas'?")

performance(
    stmt="'Sudetes' in items", 
    items=('Andes', 'Carpathians', 'Alps', 'Himalayas'))

print('Operation:\n100000 in 0,1,2,...,99999?')

performance(
    stmt="100000 in items", 
    items=range(100000))