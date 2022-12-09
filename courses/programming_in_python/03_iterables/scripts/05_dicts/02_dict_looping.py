my_dict = {
    "name": "George",
    "surname": "Washington",
    "year of birth" : 1732,
    "year of death" : 1799,
    "year in office" : 8
}

for key in my_dict:
    print('Printing key: ', key)
print('//////////////////////////////////////////////////')
for key in my_dict.keys():
    print('Printing key: ',key)
print('//////////////////////////////////////////////////')
for value in my_dict.values():
  print('Printing value: ',value)
print('//////////////////////////////////////////////////')
for element in my_dict.items():
  print('Printing element: ',element)