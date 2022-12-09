presidents = {} #creating an empty dict
list_of_presidents = ['George Washington', 'John Adams', 'Thomas Jefferson', 'James Madison', 'James Monroe', 'John Quincy Adams']
years_in_office = 8
presidents = presidents.fromkeys(list_of_presidents, years_in_office)

print('\nPrint presidents.get("John Quincy Adams"):\t', presidents.get("John Quincy Adams")) 
print('Print presidents.setdefault("Bush", 9):\t\t', presidents.setdefault("Bush", 9)) 
print("Print sorted(presidents):\t\t\t", sorted(presidents)) 

print("Print sorted(presidents, reverse = True):\t", sorted(presidents, reverse = True))
print("Print sorted(presidents, key=len):\t\t", sorted(presidents, key=len))