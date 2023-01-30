months = ['January', 'February', 'March', "April", 'May', 'Jun', 'July', 'August', 'September', 'October', 'November', 'December']
month_dict ={months[i]: i+1 for i in range(len(months))}
def how_many_days(month_name):
    if month_name in months:    
        month_number = month_dict[month_name]
        if month_number in [1,3,5,7,8,9,12]:
            number_of_days = '31'
        elif month_number in [4, 6, 10, 11]:
            number_of_days = '30'
        else:
            number_of_days = '28 or 29'
    else:
        number_of_days = 'There is no such a month'
    return number_of_days

print(f"Testing for how_many_days('May'), and obtain {how_many_days('May')} days")
print(f"Testing for how_many_days('Jun'), and obtain {how_many_days('Jun')} days")
print(f"Testing for how_many_days('December'), and obtain {how_many_days('December')} days")
print(f"Testing for how_many_days('Septembers'), and obtain {how_many_days('Septembers')} days")