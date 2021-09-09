money_owed = float(input('How much money do you owe? > '))
apr = float(input('What is the APR? > '))
payment = float(input('What will your monthly payment be? > '))
months = int(input('How many months? > '))

monthly_rate = apr/100/12

for i in range(months):
    # Add interest
    interest_paid = money_owed * monthly_rate
    money_owed = money_owed + interest_paid

    if (money_owed - payment < 0):
        print(f'The last payment is: {money_owed}')
    # Make payment
    money_owed = money_owed - payment

    # Print the results after this month

    print(f'Paid {payment} of which {interest_paid} was interest')
    print(f'Now I owe {money_owed}')