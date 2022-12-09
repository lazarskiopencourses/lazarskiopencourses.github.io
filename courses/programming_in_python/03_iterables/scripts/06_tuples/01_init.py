my_tuple = (1,2,3,4,5,8)
print('\nPrinting my_tuple = (1,2,3,4,5,8):\t\t', my_tuple)

my_tuple = tuple([1,2,3,4,5,8])
print('Printing my_tuple = tuple([1,2,3,4,5,8]):\t', my_tuple)

my_tuple = tuple((1,2,3,4,5,8))
print('Printing my_tuple = tuple((1,2,3,4,5,8)):\t', my_tuple)

my_tuple = 1, 2, 3, 4, 5, 8
print('Printing my_tuple = 1,2,3,4,5,8:\t\t', my_tuple)

a = [2, 3, 4, 4.5, True, 'dog']
b = tuple(a)
print('Printing b = tuple([2, 3, 4, 4.5, True, "dog"]):', b)