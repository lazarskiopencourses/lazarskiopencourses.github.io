months = ['January', 'February', 'March', "April", 'May', 'Jun', 'July', 'August', 'September', 'October', 'November', 'December']
month_dict ={months[i]: i+1 for i in range(len(months))}
def how_many_days_match(month_name):
    if month_name in months:    
        month_number = month_dict[month_name]
        match month_number:
            case 1 | 3 | 5 | 7 | 8 | 9 | 12:
                number_of_days = '31'
            case 4 | 6 | 10 | 11:
                number_of_days = '30'
            case _:
                number_of_days = '28 or 29'
    else:
        number_of_days = 'There is no such a month'
    return number_of_days

print(f"Testing for how_many_days_match('May'), and obtain {how_many_days_match('May')} days")
print(f"Testing for how_many_days_match('Jun'), and obtain {how_many_days_match('Jun')} days")
print(f"Testing for how_many_days_match('December'), and obtain {how_many_days_match('December')} days")
print(f"Testing for how_many_days_match('Septembers'), and obtain {how_many_days_match('Septembers')} days")