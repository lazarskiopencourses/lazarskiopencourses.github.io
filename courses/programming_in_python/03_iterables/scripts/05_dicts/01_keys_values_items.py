my_dict = {
    "name": "George",
    "surname": "Washington",
    "year of birth" : 1732,
    "year of death" : 1799,
    "year in office" : 8
}

print("\nPrinting my_dict:\t\t", my_dict)

dict_values = my_dict.values()
print("Printing my_dict.values():\t", dict_values)
dict_items = my_dict.items()
print("Printing my_dict.items():\t", dict_items)

print('\nTrying to get second element of the dict using dict_items[i]: ')
print(dict_items[1])