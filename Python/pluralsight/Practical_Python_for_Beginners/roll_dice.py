import random

roll = random.randint(1,6)
print(f'roll: {roll}')

guess = int(input('Guess the dice roll'))

if guess == roll:
    print('Correct, They rolled a ' + str(roll))
else:
    print('Wrong, they rolled a ' + str(roll))