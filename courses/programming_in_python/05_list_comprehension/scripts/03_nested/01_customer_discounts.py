customer_years = [1, 1, 2, 1, 4, 3, 2, 2]
def generate_discount_spots(n):
    return [i for i in range(n)]

discount_spots = [generate_discount_spots(years) for years in customer_years]
print(discount_spots)