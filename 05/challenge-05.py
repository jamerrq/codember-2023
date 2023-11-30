import csv
import re


def read_csv(filepath):
    with open(filepath) as f:
        reader = csv.reader(f)
        return list(reader)

def is_valid_user(user):
    return user[0].isalnum() and user[1].isalnum() and \
      re.match(r"\w+@\w+\.\w+$", user[2]) and \
          (user[3] == '' or user[3].isdigit()) and \
            (user[4] == '' or re.match(r"^[\w\s]+$", user[4]))


def main():

    users = read_csv("./05/in")
    message = ''
    for (i, user) in enumerate(users):
        if not i:
            continue
        if(not is_valid_user(user)):
            print(i, user[1])
            message += user[1][0]

    print('Message:', message)


if __name__ == '__main__':
    main()
