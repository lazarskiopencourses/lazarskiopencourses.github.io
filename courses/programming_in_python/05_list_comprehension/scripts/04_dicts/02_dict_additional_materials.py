dict_of_2_lc = {i:pow(2,i) for i in range(10)}

print("Printing dict_of_2_lc: ", dict_of_2_lc)

print("\n //////// Another example /////// \n")
my_dict = {'1st':2, '2nd':3, '3th':4, '4th':6, '5th':9}
keys = my_dict.keys()
values = my_dict.values()
items = my_dict.items()
print(keys, values, items)

print("///////////////////////////////////")
my_dict2 = {key:value**2 for (key,value) in items}
print("Printing my_dict2: ", my_dict2)

my_dict3 = {key+str(value):value for (key,value) in my_dict2.items()}
print("Printing my_dict3: ", my_dict3)

my_dict4 = {key+str(value**2):value**2 for (key,value) in my_dict.items()}
print("Printing my_dict4: ", my_dict4)