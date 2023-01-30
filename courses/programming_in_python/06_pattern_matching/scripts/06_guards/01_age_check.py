def age_check(age):
    match age:
        case 0:
            return "You are starting to exist. Welcome!"
        case int() if age > 0:
            return f"You are now {age} years old. If you don't die, in five years you will be {age + 5} years old."
        case int():
            return f'You will be born in {-age} years.'
        case float() if age > 0:
            return f'You are a very precise person. Now you are {age} years old.'
        case float():
            return f'You will be born in {-age} float years.'
        case _:
            return 'Your age was not provided correctly'

for age in [0, 20, -15, 20.6, -5.1, '100']:
    print(f'\nage_check({age}):\n', age_check(age))