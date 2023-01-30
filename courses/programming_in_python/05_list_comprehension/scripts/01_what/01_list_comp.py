squares =[]
for i in range(10):
    squares.append(i**2)

print("\nPrinting powers_of_2 from for loop:\t\t\t", squares)

squares_lc = [i**2 for i in range(10)]
print("Printing powers_of_2_lc from list comprehension:\t", squares_lc)