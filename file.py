#values, variables and integers


# hello = 60
# name = 30

# answer = hello + name


# print(answer)




#Converting Integers to float and floats to integers


# hello = float(10)

# print(hello)

# name = int(10.0)

# print(name)


#Strings
#When a text is inside a single or double quote, it is a string

# hello = "My name is Pat"
# print(hello)


#Concatenate means to create a space between strings

# hello = "my name"

# ok = "is Patrick"

# #value = hello + ok  #This will join the output together without a space in between name & is, to fix this, we concatenant

# value = hello +" "+ ok

# print(value)


#Input or Read function
# hello = "hello"
# name = input("what is your name:\n ") #\n means new line
# gender = input("Are you a Mr or Mrs:\n ")
# print("Welcome" + " " + gender + " " + name)


#Loan calculater

# age = int(input("How hold are you? \n"))

# #decade = int(age/10) #OR

# decade = age // 10

# year = age % 10


# print("you are" + " " + str(decade) + " " + "decade old and" + " " + str(year) +  " " "years old")


#Condition statements

# == comparing if variable is equal to a value
#  != checking if a variable is not equal to a value
# >  checking if a variable is greater than
# < Less than

# temp = 95

# if temp < 94:
#     print("The temperature is hot")
#     print ("Stay at home")
# print("hello punk")

#OR

# temp = int(input("Enter the temperature outside\n"))
# if temp > 13:
#     print("The temperature is okay")
#     print ("Enjoy the weather")
# elif temp < 13:
#     print("Its too cold out there")

    
# If a statement is false, the indented print statement is not run, instead , the print statement after the indented statement will run, in the above 
#above senario, the statement is false as temp is not less than 94, hence the first and second print statement will not run

# Rock Paper Scissors using imported ModuleNotFoundError

import random

dice = random.randint(1,6)

print("the temp outisde is" + " " + str(dice))
