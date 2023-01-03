pin = 1234
user_pin = input("Please input your 4 digit PIN number: ")#Ask user to provide a PIN code
user_pin = int(user_pin) # Convert PIN in string type into integer
if pin == user_pin:
    print("Acces approved")
else: print("Access denied")
