# #values, variables and integers


# # hello = 60
# # name = 30

# # answer = hello + name


# # print(answer)




# #Converting Integers to float and floats to integers


# # hello = float(10)

# # print(hello)

# # name = int(10.0)

# # print(name)


# #Strings
# #When a text is inside a single or double quote, it is a string

# # hello = "My name is Pat"
# # print(hello)


# #Concatenate means to create a space between strings

# # hello = "my name"

# # ok = "is Patrick"

# # #value = hello + ok  #This will join the output together without a space in between name & is, to fix this, we concatenant

# # value = hello +" "+ ok

# # print(value)


# #Input or Read function
# # hello = "hello"
# # name = input("what is your name:\n ") #\n means new line
# # gender = input("Are you a Mr or Mrs:\n ")
# # print("Welcome" + " " + gender + " " + name)


# #Loan calculater

# # age = int(input("How hold are you? \n"))

# # #decade = int(age/10) #OR

# # decade = age // 10

# # year = age % 10


# # print("you are" + " " + str(decade) + " " + "decade old and" + " " + str(year) +  " " "years old")


# #Condition statements

# # == comparing if variable is equal to a value
# #  != checking if a variable is not equal to a value
# # >  checking if a variable is greater than
# # < Less than

# # temp = 95

# # if temp < 94:
# #     print("The temperature is hot")
# #     print ("Stay at home")
# # print("hello punk")

# #OR

# # temp = int(input("Enter the temperature outside\n"))
# # if temp > 13:
# #     print("The temperature is okay")
# #     print ("Enjoy the weather")
# # elif temp < 13:
# #     print("Its too cold out there")

    
# # If a statement is false, the indented print statement is not run, instead , the print statement after the indented statement will run, in the above 
# #above senario, the statement is false as temp is not less than 94, hence the first and second print statement will not run

# # Rock Paper Scissors using imported Module

# # import random

# # dice = random.randint(1,6)

# # print("the temp outisde is" + " " + str(dice))

# #This is using the formation (f) to include a integer in the print output which is a string

# # print(f"hello, my number is {25}")


# #Creating a function help to store a variable or output
# #The below defines a function with a variable number, instead of repeating the print output for different figures, the function declared after the print function takes precedence
# #This reduce code duplication


# # hour = 60

# # day = 24

# # def myfun(number):

# #     print(f"{number} days have {number * day} hours")

# # myfun(20)
# # myfun(40)


# # #OR


# # hour = 60

# # day = 24

# # def myfun():

# #     print(f"days have {day * day} hours")

# # myfun()
# # myfun() #These two function lines means the output will be printed twice


# #OR


# hour = 60

# day = 24

# def myfun(number, patrick):

#     print(f"{number} days have {number * day} hours {patrick}")

# myfun(20, 50)


# def myfunc2(hello, choices):

#       print(f"your name is {hello}")

# myfunc2(20, 30)




# radio = 12

# print(str(radio) + " " + 'is the number')




# == this is for comparison

age = [1, 2, 3]


print(age)