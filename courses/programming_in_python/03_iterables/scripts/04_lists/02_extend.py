dog_breeds = ['buldog', 'labrador', 'chihuahua', 'husky', 'akita', 'dalmatian', 'pug', 'boston terrier', 'boxer']
print('\nPrinting dog_breeds:\t\t\t', dog_breeds)
new_dogs = ['Otterhound', 'Polish Hunting Spaniels','Bergamasco Sheepdog', 'Polish Lowland Sheepdog' , 'Skye Terrier', 'Cirneco dell’Etna', 'Komondor', 'Polish Hunting Spaniels']

# del keyword

del dog_breeds[2:5]
print('Printing dog_breeds after del:\t\t', dog_breeds)

# .extend method

dog_breeds.extend(new_dogs)
print('Printing dog_breeds after extend:\t', dog_breeds)