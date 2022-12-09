customer_currency_accounts = ['USD', 'EUR', 'GBP', 'CHF']
customer_info = (123654789, customer_currency_accounts)

print('\nPrinting customer_currency_accounts:\t', customer_currency_accounts)
print('Printing customer_info:\t\t\t', customer_info)
print(f'ID before modification:\t\t\t {id(customer_info)}')

customer_currency_accounts.pop()
print('\ncustomer_currency_accounts.pop() ...\n')
print('\nPrinting customer_info:\t\t\t', customer_info)
print(f'ID after modification:\t\t\t {id(customer_info)}')