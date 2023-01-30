def exchange_rate(amount, rate=4.75, spread=0.05):
    return round((amount / rate) * ( 1 - spread),2)

list_in_PLN = [1000, 520, 326, 14568, 235]
list_in_EUR = [exchange_rate(amount) for amount in list_in_PLN]

print("\nPrinting list_in_PLN: ", list_in_PLN)
print("Printing list_in_EUR: ", list_in_EUR)