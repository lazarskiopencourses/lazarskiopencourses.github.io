my_numbers = {'1st':2, '2nd':3, '3th':4, '4th':6, '5th':9}
print(my_numbers.items())
items = my_numbers.items()

my_numbers_squared = {key:value**2 for (key, value) in items}
print(my_numbers_squared)