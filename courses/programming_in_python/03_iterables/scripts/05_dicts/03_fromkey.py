presidents = {} #creating an empty dict

list_of_presidents = ['George Washington', 'John Adams', 'Thomas Jefferson', 'James Madison', 'James Monroe', 'John Quincy Adams']
years_in_office = 8

presidents = presidents.fromkeys(list_of_presidents, years_in_office)

print("\nPrinting presidents dict: ", presidents)
