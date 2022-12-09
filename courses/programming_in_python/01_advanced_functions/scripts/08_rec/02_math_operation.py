def math_operation(name):
    if name == 'sum':
        def f(a,b):
            return a + b
    elif name == 'diff':
        def f(a,b):
            return a - b
    elif name == 'multi':
        def f(a,b):
            return a * b
    else:
        def f(a,b):
            return a / b
    return f


s = math_operation('sum')
print("Calling type(s), and obtain: ", type(s))
print("Calling s(13, 9), and obtain: ", s(13, 9))
print("Calling math_operation('sum')(13,9), and obtain: ", math_operation('sum')(13,9))


