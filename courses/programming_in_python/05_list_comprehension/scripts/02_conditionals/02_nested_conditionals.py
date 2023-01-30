numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
squares_and_cubes = []
for number in numbers:
    if number%2 == 0:
        squares_and_cubes.append(number**2)
    else:
        if number%3 == 0:
            squares_and_cubes.append(number**3)
        else:
            squares_and_cubes.append(number)
print(squares_and_cubes)