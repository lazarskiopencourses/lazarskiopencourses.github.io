condition_at_the_end = [[i**2 for z in range(6)] for i in range(5) if i % 2 == 1 ]

print("Printing condition_at_the_end: ", condition_at_the_end)

condition_after_expr = [[i**2 for z in range(6)] if i % 2 == 1 else i for i in range(5)]

print("Printing condition_after_expr: ", condition_after_expr)