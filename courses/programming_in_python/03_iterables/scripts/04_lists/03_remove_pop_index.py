dog_breeds = ['buldog', 'labrador', 'chihuahua', 'husky', 'akita', 'dalmatian', 'pug', 'boston terrier', 'boxer']
print('\nPrinting dog_breeds:\t\t\t', dog_breeds)

dog_breeds.remove('chihuahua')
print("Printing dog_breeds.remove('chihuahua'):", dog_breeds)

# .pop method

dog_breeds.pop(4)
print('Printing dog_breeds after .pop(4):\t', dog_breeds)

# index method

print('Printing index of husky:\t\t', dog_breeds.index('husky'))