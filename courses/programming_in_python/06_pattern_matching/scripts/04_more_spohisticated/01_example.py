command = input("What do you want to do, say it to me ")
match command.split():
    case ["exit"]:
        exit()
    case ["open", filename]:
        open(filename)
    case ["close", filename]:
        close(filename)
    case _:
        print (f"No such '{command}' a command")