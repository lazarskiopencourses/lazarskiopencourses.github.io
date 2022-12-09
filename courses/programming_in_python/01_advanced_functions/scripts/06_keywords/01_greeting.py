def greeting(person1, person2, word):
    return "{0} says {1} to {2}".format(person1,word, person2)

print("Calling greeting(person1='Mark', person2='Tom', word = 'Hello!'), and obtains: ",greeting(person1='Mark', person2='Tom', word = 'Hello!'))
print('\n')
print("Calling greeting(word = 'Hello!', person1='Mark', person2='Tom'), and obtains: ",greeting(word = 'Hello!', person1='Mark', person2='Tom'))