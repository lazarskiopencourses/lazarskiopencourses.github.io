def replace_polish_letters(list_with_strings):
    polish_characters = ['ą', 'ć', 'ę', 'ł', 'ń', 'ó', 'ś', 'ż', 'ź']
    latin_characters = ['a', 'c', 'e', 'l', 'n', 'o', 's', 'z', 'z']
    list_to_return = []
    for string in list_with_strings:
        for i in range(len(polish_characters)):
            string = string.replace(polish_characters[i], latin_characters[i])#REPLACE
        list_to_return.append(string)
    return list_to_return

print("Testing replace_polish_letters(['łódź', 'żółć', 'gżegżółka', 'nasięźrzał']), and obtain: ", replace_polish_letters(['łódź', 'żółć', 'gżegżółka', 'nasięźrzał']))