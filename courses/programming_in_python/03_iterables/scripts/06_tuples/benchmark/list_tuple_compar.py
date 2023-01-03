import sys
import timeit

def initialise_iterable(type):
    my_tuple = type(range(1000000))

list_init_time = timeit.timeit("initialise_iterable(list)", globals = globals(), number = 1000)
tuple_init_time = timeit.timeit("initialise_iterable(tuple)", globals = globals(), number = 1000)

print("List initialisation time: ", list_init_time)
print("Tuple initialisation time: ", tuple_init_time)

#Check the memory needed for LIST and TUPLE
print(f'Size of my_list {sys.getsizeof(list(range(100)))}')
print(f'Size of my_tuple {sys.getsizeof(tuple(range(100)))}')

#Measure the time needed to go through all indexes
def iterate_over(iterable):
    for index in range(len(iterable)):
        a = iterable[index]

l = list(range(1000000))
t = tuple(range(1000000))

list_exec_time = timeit.timeit("iterate_over(l)", globals = globals(), number = 1000)
tuple_exec_time = timeit.timeit("iterate_over(t)", globals = globals(), number = 1000)

print("Time for LIST: ", list_exec_time)
print("Time for TUPLE: ", tuple_exec_time)