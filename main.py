import mysql.connector

try:
    connection = mysql.connector.connect(host='localhost',
                                         database='Hospital_Schema',
                                         user='root',
                                         password='Respond.2021!')

    #sql_select_Query = "select * from Nurse"
    cursor = connection.cursor()
    # cursor.execute(sql_select_Query)
    # records = cursor.fetchall()
    # print("Total number of rows in table: ", cursor.rowcount)

    # print("\nPrinting each row")
    # for row in records:
    #     print("Nur_ID = ", row[0], )
    #     print("Nur_Special = ", row[1])
    #     print("N_Nurse  = ", row[2])
    #     print("Dr_ID  = ", row[3])
    #     print("P_ID  = ", row[4], "\n")

except mysql.connector.Error as e:
    print("Error reading data from MySQL table", e)




def printOption():
    print('Data Alteration Option: ' +'\n' +
          '[1] Add Data'+ '\n' +
          '[2] Delete Data' +'\n' +
          '[3] Aggregate Data' +'\n' +
          '[4] Ordered Data\n'+
          '[5] Patient Data\n' +
          '[6] Exit')

def del_func():

    print("[1] drop table")
    print("[2] drop row")
    print('[3] drop column')

    option = int(input("Enter your option as a number: "))
    if option == 1:
        print('Existing Tables:')
        cursor.execute("SHOW TABLES")
        records = cursor.fetchall()
        for i in range(len(records)):
            print([i+1], (records[i])[0])

        str = input('\nEnter the name of the table do you want to delete? ')
        sqlCode = "DROP TABLE " + str
        try:
            cursor.execute(sqlCode)
        except mysql.connector.Error as e:
            print('Unable to delete Table', e)
            print('\n')

    elif option == 2:
        print('Existing Tables:')
        cursor.execute("SHOW TABLES")
        records = cursor.fetchall()
        for i in range(len(records)):
            print(i + 1, records[i])

        str = input('\nEnter the name of the table do you want to delete? ')

        try:
            cursor.execute('select * from '+ str)
            records = cursor.fetchall()
            print('Here are all the rows:')
            for i in records:
                print(i)
            newStr = input('\nEnter the ' + str + ' ID of the row to be deleted: ')
            try:
                cursor.execute("SHOW keys FROM " + str + " WHERE Key_name = 'PRIMARY'")
                PKs = cursor.fetchall()
                PK = list(PKs[0])
                sql_in = 'DELETE FROM ' + str +  ' WHERE ' + PK[4] + ' = '+ "'" + newStr + "'"
                print(sql_in)
                cursor.execute(sql_in)
                print('Successfull Deleted Row with' + PK[4] + 'equals to '+ newStr)
            except mysql.connector.Error as e:
                print('Unable to delete Row', e)
                print('\n')

        except mysql.connector.Error as e:
            print('Unable to access Data', e)
            print('\n')


    elif option == 3:
        print('Existing Tables:')
        cursor.execute("SHOW TABLES")
        records = cursor.fetchall()
        for i in range(len(records)):
            print(i + 1, records[i])

        str = input('\nDisplayed are our tables which table would you like to delete a column from? ')
        cursor.execute("DESCRIBE " + str)
        records = cursor.fetchall()
        for i in records:
            print(i[0])
        stri =input('\nDisplayed are the columns, which column would you like deleted? ')
        try:
            cursor.execute('ALTER TABLE '+ str + ' DROP ' + stri)
            print("Delete column" +stri+" successfully")
            # records = cursor.fetchall()
            # for i in records:
            #     print(i)
        except mysql.connector.Error as e:
            print('Unable to delete Column', e)
            print('\n')

    else:
        print("Invalid number called")
        # Show database
        # cursor.execute("SHOW TABLES")
        # cursor.execute(removeTable, (drop,))
        # mydb.commit()
        #
        # for x in cursor:
        #     print(x)

    return
def arrCheck(temp, target):
    for i in temp:
        if i[0].lower() == target.lower():
            return True
    return False


def aggregate_func():
    print("\nChoose aggregate function 1-4 ")
    print("[1] count entries")
    print("[2] minimum value of entries")
    print("[3] maximum value of entries")
    print("[4] average value of entries")

    usr = int(input("Enter your option as a number: "))

    if usr == 1:
        count()
    elif usr == 2:
        min_max_avg(0)
    elif usr == 3:
        min_max_avg(1)
    elif usr == 4:
        min_max_avg(2)
    else:
        print("Invalid command. Returing to main menu...")
        return


def count():
    sql_in = "select count(*) from "

    cursor.execute("SHOW TABLES")
    records = cursor.fetchall()
    for i in records:
        print(i)
    answer = input("Enter table name: ")

    if arrCheck(records, answer) == False:
        print("Incorrect entry typed, redirecting...")
        return

    sql_in = sql_in + answer


    cursor.execute("describe " + answer)
    records = cursor.fetchall()
    for i in records:
        print(i[0])

    usr_2 = input("Enter column name: ")

    if arrCheck(records, usr_2) == False:
        print("Incorrect entry typed, redirecting...")
        return

    usr_3 = input("Enter row selection criteria or 'all' for all rows: ")

    try:
        if usr_3 == 'all':
            cursor.execute(sql_in)
            records = cursor.fetchall()
            print("Amount of " + usr_2 + " in table " + answer + ": " + str(records[-1][-1]))
        else:

            sql_in = sql_in + " where " + usr_2 + " = " + "'" + usr_3 + "'"
            # print(sql_in)
            cursor.execute(sql_in)
            records = cursor.fetchall()
            print("Amount of " + usr_3 + " in table " + answer + ": " + str(records[-1][-1]))

    except mysql.connector.error as error:
        print("Unable to process request", error)
        return


# min_max_avg(0) = min(), min_max_avg(1) = max(), min_max_avg(2) = avg()
def min_max_avg(ind):
    if ind == 0:
        sql_in = "select min("
        out = "Minimum value of "
    elif ind == 1:
        sql_in = "select max("
        out = "Maximum value of "
    elif ind == 2:
        sql_in = "select avg("
        out = "Average value of"
    print("Existing Tables: ")
    cursor.execute("SHOW TABLES")

    records = cursor.fetchall()
    for i in records:
        print(i)
    usr_1 = input('\nEnter the name of the table do you want to access? ')
    if not arrCheck(records, usr_1):
        print("Incorrect entry typed, redirecting...")
        return


    cursor.execute("describe " + usr_1)
    records = cursor.fetchall()
    for i in records:
        print(str(i[0]))
    usr_2 = input("\nEnter column name: ")

    if not arrCheck(records, usr_2):
        print("Incorrect entry typed, redirecting...")
        return

    try:
        if usr_2.lower() == "prescr_price" or usr_2.lower() == "bill_total":
            sql_in = sql_in + usr_2 + ") from " + usr_1
            cursor.execute(sql_in)
            records = cursor.fetchall()
            print(out + usr_2 + " : " + str(records[-1][-1]) +'\n')
            # print(sql_in)
        else:
            print("Sorry, can only return minimum value of integer or decimal datatypes. \n")
            return

    except mysql.connector.error as error:
        print("Unable to process request", error)
        return

def add_func():

    print("[1] add table")
    print("[2] add row")
    print('[3] add column')

    option = int(input("Enter your option as a number: "))
    if option == 1:
        print('Existing Tables:')
        cursor.execute("SHOW TABLES")
        records = cursor.fetchall()
        for i in range(len(records)):
            print(i + 1, records[i])

        str = input('\nEnter the name of the table do you want to create? ')
        stri = int(input('\nHow many columns would you like, please enter the digit '))
        sqlCode = "CREATE TABLE " + str + '('
        for i in range(stri):
            strin = input('\nWhat is the name of the column? ')
            if i != (stri - 1):
                sqlCode += (strin + " VARCHAR(255), ")
            else:
                sqlCode += ( strin + " VARCHAR(255) ")

        sqlCode += ')'
        print(sqlCode)
        try:
            cursor.execute(sqlCode)
            print('Table ' + str + ' Sucessfully added')
        except mysql.connector.Error as e:
            print('Unable to add Table', e)
            print('\n')

    if option == 2:
        print('Existing Tables:')
        cursor.execute("SHOW TABLES")
        records = cursor.fetchall()
        for i in range(len(records)):
            print(i + 1, records[i])
        str = input("\nWhich table would you like to add a row to?")
       # sqlCode = "INSERT INTO customers (name, address) VALUES (%s, %s)"
        #val = ("John", "Highway 21")
        #mycursor.execute(sql, val)

        # for i in str:
        # stri = input()
        try:
            cursor.execute(sqlCode)
            print('Row  Sucessfully added')
        except mysql.connector.Error as e:
            print('Unable to add Table', e)
            print('\n')

    if option == 3:
        print('Existing Tables:')
        cursor.execute("SHOW TABLES")
        records = cursor.fetchall()
        for i in range(len(records)):
            print(i + 1, records[i])
        str = input('\n Which table would you like to add a column to?')
        stri = input('\nWhat is the column name? ')
        sqlCode = 'ALTER TABLE ' + str + ' ADD ' + stri + ' VARCHAR(255)'
        try:
            cursor.execute(sqlCode)
            print('Table ' + str + ' Sucessfully added')
        except mysql.connector.Error as e:
            print('Unable to add Table', e)
            print('\n')

    return

def special_func1():
    print('Existing Tables:')
    cursor.execute("SHOW TABLES")
    records = cursor.fetchall()
    for i in range(len(records)):
        print(i + 1, records[i])
    str = input('\nWhich table would you like to access? ')
    cursor.execute("DESCRIBE " + str)
    records = cursor.fetchall()
    for i in records:
        print(i[0])
    stri = input ("\nWhich column would you like to order by? ")
    sqlCode = ("SELECT * FROM " + str+  " ORDER BY " + stri)
    try:
        cursor.execute(sqlCode)
        myresult = cursor.fetchall()
        for x in myresult:
            print(x)
        print('Table ' + str + ' Successfully Ordered\n')
    except mysql.connector.Error as e:
        print('Unable to order Table', e)
        print('\n')
    return

def special_func2():
    str = input('Which patient do you want to gather information from? ')
    #select Nurse.N_nurse as Nurse_Namw, Doctor.N_Dr as Doctor_Name, Patient.N_patient as Patient_Name, Administrative.Ad_Ph_Num as Contact_Number from Nurse, Doctor, Patient, Administrative
    #where Nurse.Dr_ID = Doctor.Dr_ID and Nurse.P_ID = Patient.P_ID and Administrative.Dr_ID = Nurse.Dr_ID;
    try:
        cursor.execute('select Nurse.N_nurse as Nurse_Name, Doctor.N_Dr as Doctor_Name, Patient.N_patient as Patient_Name, Administrative.Ad_Ph_Num as Contact_Number from Nurse, Doctor, Patient, Administrative where Nurse.Dr_ID = Doctor.Dr_ID and Nurse.P_ID = Patient.P_ID and Administrative.Dr_ID = Nurse.Dr_ID and Patient.P_ID = ' + "'"+ str+"'")
        record = cursor.fetchall()
        for i in record:
            print(i)

    except mysql.connector.Error as e:
        print('Unable to gather data', e)
        print('\n')

    return



if __name__ == '__main__':
    answer = ''
    while answer != '6':
        printOption()
        print('Enter your option (1-5): ', end='')
        answer = input()
        if answer == '1':
            add_func()
        elif answer == '2':
            del_func()
        elif answer == '3':
            aggregate_func()
        elif answer == '4':
            special_func1()
        elif answer == '5':
            special_func2()

    cursor.close()





