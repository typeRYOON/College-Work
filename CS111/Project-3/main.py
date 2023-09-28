# Made by Ryan Magdaleno on 11/21/21 through 11/22/21.
# This program is project 3 for UIC's CS111 class.
# The goal of this program is calculate answers for questions based on data from files and online data given.
# The questions are in the answers.txt if you run this once, and all data is gathered from the
# tax_return_data_2018.csv and states_titlecase.json files bundled with main.py, and also uses the url:
# https://raw.githubusercontent.com/heymrhayes/class_files/main/state_populations_2018.txt

######################################################
# Project: < Project 3 >
# UIN: < 668523658 >
# repl.it URL: <https://replit.com/@CS111-Fall2021/Project-3-rmagd2#main.py>
# No other student helped me in this prokect
######################################################
import matplotlib.pyplot as mpl
import requests
import json
import csv


def get_data_from_file(filename, format_=''):
    """
    This function takes a local directory string and opens that directory and loads the contents to be used for data
    extraction into either a list or list of dictionaries depending on the file type (.csv / .json)

    :param filename: Should be a filename but can be a full path if the file is outside this program's folder (string)
    :param format_: The format that you know should be used, leave blank for the function to determine on its own (string)
    :return: Returns a list or list of dictionaries depending on the file type (list/ list of dictionaries)
    """
    rowslist = []
    if format_ == '':
        if '.json' in filename:
            format_ = 'json'
        elif '.csv' in filename:
            format_ = 'csv'
        else:
            return 0
    if format_ == 'csv':
        with open(filename, newline='') as csvfile:
            csvobj = csv.reader(csvfile)
            for row in csvobj:
                rowslist.append(row)
            return rowslist
    elif format_ == 'json':
        with open(filename, newline='') as jsonfile:
            jsondicts = json.load(jsonfile)  # A list of dictionaries loaded from a json file
        return jsondicts


def get_data_from_internet(url, format_='json'):
    """
    This function takes in a url string and takes in the data from the url to be returned as a csv reader list or
    a dictionary from a json page, the default choice is json.

    This function also remove the . character from a dictionary's key.

    :param url: A url that this function requests and gets the contents of back. (string)
    :param format_: The format to read the file as, default is json (string)
    :return: csv reader list or a dictionary from a json page (list / dictionary)
    """
    r = requests.get(url)
    if format_ == 'csv':
        text = r.iter_lines()
        reader = csv.reader(text, delimiter=',')
        return reader
    elif format_ == 'json':
        rj = r.json()
        clean_dict = {}
        for dicts in rj:
            for key, value in dicts.items():
                clean_key = key.replace('.', '')
                clean_key = clean_key.title()
                clean_dict[clean_key] = value
        return clean_dict


def get_state_name(state_names, state_code):
    """
    This function uses a dictionary state_names from the file states_titlecase.json and depending on the length of the
    state_code string will return the abbreviation or the full state name.
    ex:
        state_code = 'AL' returns -> 'Alabama'
        state_code = 'Alabama' returns -> 'AL'
    :param state_names: A list of dictionaries from the file states_titlecase.json (list of dictionaries)
    :param state_code: The state abbreviation or full state name can be used to get the other one (string)
    :return: The abbreviation if state_code was a full name or the full name if state_code was a abbreviation (string)
    """
    if len(state_code) == 2:
        for state_dicts in state_names:
            if state_dicts['abbreviation'] == state_code:
                return state_dicts['name']
    else:
        state_code = state_code.title()
        for state_dicts in state_names:
            if state_dicts['name'] == state_code:
                return state_dicts['abbreviation']


def get_state_population(state_populations, state_name):
    """
    This function takes in a list of dictionaries and returns based on the state_name that state's population
    :param state_populations: A list of dictionaries that have state names as the key and populations as the value (list of dictionaries)
    :param state_name: A state's name like 'Illinois' or 'illinois' (string)
    :return: Returns from the state_populations the population based on the state_name parameter (string)
    """
    state_name = state_name.title()
    for dicts in state_populations:
        for name in dicts:
            if name == state_name:
                return state_populations[name]


def get_index_for_column_label(header, column_label):
    """
    This function is used to find the index for a string like 'N1' for example. Is to be used with the
    tax_return_data csv file.

    :param header: The first row in a csv file that has all the columns labels (list of strings)
    :param column_label: A string of what you want to find a index of (string)
    :return: The index of where in the header list the column label your looking for is. (integer)
    """
    index_num = header.index(column_label)
    return index_num


def sort(dicto):
    """
    For use in sorting a state's population (for bar graph)
    :param dicto: Takes in a list of a dictionaries (list of dictionaries)
    :return: returns the list dictionaries value to be sorted by the .sort function (integer)
    """
    return dicto['value']


def main():
    """
    Where all the functions are used to collect data and calculate questions 1 through 10 and write the answers for
    them in answers.txt. The graphs are also made and saved from this function
    :return: None
    """
    # Data retrival ---------------------------------------------------------------------------------------------------
    returns_data = get_data_from_file('tax_return_data_2018.csv')
    population_data = \
        get_data_from_internet('https://raw.githubusercontent.com/heymrhayes/class_files/main/state_populations_2018.txt')
    state_names = get_data_from_file('states_titlecase.json')

    # Getting indexes -------------------------------------------------------------------------------------------------
    header_row = returns_data[0]
    A04800_INDEX = get_index_for_column_label(header_row, "A04800")
    N04800_INDEX = get_index_for_column_label(header_row, "N04800")
    NUMDEP_INDEX = get_index_for_column_label(header_row, "NUMDEP")
    N1_INDEX = get_index_for_column_label(header_row, "N1")
    agi_stub_INDEX = get_index_for_column_label(header_row, "agi_stub")
    STATE_INDEX = get_index_for_column_label(header_row, "STATE")

    # State questions input -------------------------------------------------------------------------------------------
    Full_Name = (input('Input a state name (ex: Illinois/illinois): ')).title()
    State_name = get_state_name(state_names, Full_Name)
    STATE_POP = population_data.get(Full_Name)

    # Initializing variable that will store segments of the data retrieved---------------------------------------------
    taxamount = 0
    total_return = 0
    old_name = ''
    state_income_tax = {}
    agi_groups = [{'1T': 0, '1N': 0}, {'2T': 0, '2N': 0}, {'3T': 0, '3N': 0}, {'4T': 0, '4N': 0}, {'5T': 0, '5N': 0}, {'6T': 0, '6N': 0}]
    state_agi_groups = [{'1T': 0, '1N': 0, '1D': 0, '1N0': 0}, {'2T': 0, '2N': 0, '2D': 0, '2N0': 0}, {'3T': 0, '3N': 0, '3D': 0, '3N0': 0},
                        {'4T': 0, '4N': 0, '4D': 0, '4N0': 0}, {'5T': 0, '5N': 0, '5D': 0, '5N0': 0}, {'6T': 0, '6N': 0, '6D': 0, '6N0': 0}]
    State_A0, State_N1, State_N0 = 0, 0, 0

    # Creating empty dictionaries for Q3 ------------------------------------------------------------------------------
    for c, item in enumerate(returns_data):
        if c == 0:
            continue
        current_state = item[STATE_INDEX]
        if current_state != old_name:
            old_name = current_state
            state_income_tax[f'{item[STATE_INDEX]}_COUNT'] = 0
            state_income_tax[f'{item[STATE_INDEX]}_A04800'] = 0

    # Main data segment extraction from the return_data list from the tax return data (2018) csv file
    for item in returns_data:
        if item[A04800_INDEX] == 'A04800':  # To skip over label row
            continue

        taxamount += int(item[A04800_INDEX])
        # Q1 Increment all group A04800

        total_return += int(item[N1_INDEX])
        # Q1 Increment all group N1

        groupagi = int(item[agi_stub_INDEX])
        # Q2 Get current agi_group number to use in list indexing and dictionary keys

        agi_groups[groupagi - 1][f'{groupagi}T'] += int(item[A04800_INDEX])
        # Q2 Increment current agi group's A04800

        agi_groups[groupagi - 1][f'{groupagi}N'] += int(item[N1_INDEX])
        # Q2 Increment current agi group's N1

        state_income_tax[f'{item[STATE_INDEX]}_A04800'] += int(item[A04800_INDEX])
        # Q3 Increment state's A04800 amount


        # State level questions:
        if State_name == item[STATE_INDEX]:  # State level questions data segment gathering:
            State_A0 += int(item[A04800_INDEX])
            State_N1 += int(item[N1_INDEX])
            state_agi_groups[groupagi - 1][f'{groupagi}T'] += int(item[A04800_INDEX])
            state_agi_groups[groupagi - 1][f'{groupagi}N'] += int(item[N1_INDEX])
            state_agi_groups[groupagi - 1][f'{groupagi}D'] += int(item[NUMDEP_INDEX])
            state_agi_groups[groupagi - 1][f'{groupagi}N0'] += int(item[N04800_INDEX])


    AVG_taxincome = round((taxamount / total_return) * 1000)  # Q1
    STATE_ANSWERS = {}
    ALIST = []

    # Question 3 dictionary summary dictionary creation
    for row in returns_data:
        if row[agi_stub_INDEX] == '1':
            CUR_STATE_A0 = state_income_tax[f'{row[STATE_INDEX]}_A04800']
            CUR_STATE_NAME = get_state_name(state_names, row[STATE_INDEX])
            CUR_STATE_COUNT = population_data.get(CUR_STATE_NAME)
            CUR_STATE_ANSWER = ((CUR_STATE_A0 / CUR_STATE_COUNT) * 1000)
            STATE_ANSWERS[row[STATE_INDEX]] = round(CUR_STATE_ANSWER)


    for x, v in STATE_ANSWERS.items():
        ALIST.append({'state': x, 'value': v})  # Appending a dicionary as a element in list so I can sort based on the value
    copy = ALIST.copy()  # To be used for displaying in answers.txt
    ALIST.sort(key=sort)  # Sort based on function called sort that was defined earlier, to be used in bar graph.
    State_List, State_value = [], []  # lists for graph
    for dicto in reversed(ALIST):  #
        State_List.append(dicto['state'])
        State_value.append((dicto['value']))

    # State answer calculations ---------------------------------------------------------------------------------------

    sizes0, sizes1 = [], []
    Q4 = round((State_A0 / State_N1) * 1000)
    Q5, Q6, Q7, Q9, Q10 = [], [], [], [], []
    Q8_CUR_ANSWER = round((State_A0 / STATE_POP) * 1000)
    Q8_CUR_ANSWER = f'$\t{Q8_CUR_ANSWER}'
    for count, item in enumerate(state_agi_groups):
        Q5_CUR_ANSWER = state_agi_groups[count][f'{count + 1}T'] / state_agi_groups[count][f'{count + 1}N']  # Q5
        Q6_CUR_ANSWER = state_agi_groups[count][f'{count + 1}D'] / state_agi_groups[count][f'{count + 1}N']  # Q6
        NON1 = state_agi_groups[count][f'{count + 1}N'] - state_agi_groups[count][f'{count + 1}N0']          # Q7a
        Q7_CUR_ANSWER = (NON1 / state_agi_groups[count][f'{count + 1}N']) * 100                              # Q7b
        Q9_CUR_ANSWER = (state_agi_groups[count][f'{count + 1}N'] / State_N1) * 100                          # Q9
        Q10_CUR_ANSWER = (state_agi_groups[count][f'{count + 1}T'] / State_A0) * 100                         # Q10

        # Appending to lists for writing to answers.txt later
        Q5.append(f'Group {count + 1}: $\t{round(Q5_CUR_ANSWER * 1000)}')
        Q6.append(f'Group {count + 1}: {Q6_CUR_ANSWER:.2f}')
        Q7.append(f'Group {count + 1}: {Q7_CUR_ANSWER:.2f}%')
        Q9.append(f'Group {count + 1}: {Q9_CUR_ANSWER:.2f}%')
        sizes0.append(Q9_CUR_ANSWER)
        Q10.append(f'Group {count + 1}: {Q10_CUR_ANSWER:.2f}%')
        sizes1.append(Q10_CUR_ANSWER)

    # Writing to answers.txt ------------------------------------------------------------------------------------------

    equal = '=' * 60
    FileName = f'answers{State_name}.txt'
    with open(FileName, 'w') as textfile:
        textfile.write(f'{equal}\nQuestion 1\naverage taxable income per return across all groups\n{equal}\n$\t{AVG_taxincome}\n\n')
        textfile.write(f'{equal}\nQuestion 2\naverage taxable income per return for each agi group\n{equal}\n')
        for count, group in enumerate(agi_groups):
            Q2_ANSWER = (round((agi_groups[count][f'{count + 1}T'] / agi_groups[count][f'{count + 1}N']) * 1000))
            textfile.write(f'Group {count + 1}: $ {Q2_ANSWER}\n')
        textfile.write(f'\n{equal}\nQuestion 3\naverage taxable income (per resident) per state\n{equal}\n')
        count = 0
        state_answer0 = ''
        for state_answer in copy:
            for key, value in state_answer.items():
                if count == 0:
                    state_answer0 += f'{value}: $\t'
                    count += 1
                else:
                    state_answer0 += f'{value}'
                    textfile.write(f'{state_answer0}\n')
                    state_answer0 = ''
                    count = 0

        textfile.write(f'\n{equal}\nState level information for {Full_Name}\n{equal}\n\n{equal}\nQuestion 4\naverage taxable income per return across all groups\n{equal}\n')
        textfile.write(f'$\t{Q4}\n\n{equal}\nQuestion 5\naverage taxable income per return for each agi group\n{equal}\n')
        for x in Q5:
            textfile.write(f'{x}\n')
        textfile.write(f'\n{equal}\nQuestion 6\naverage dependents per return for each agi group\n{equal}\n')
        for x in Q6:
            textfile.write(f'{x}\n')
        textfile.write(f'\n{equal}\nQuestion 7\npercentage of returns with no taxable income per agi group\n{equal}\n')
        for x in Q7:
            textfile.write(f'{x}\n')
        textfile.write(f'\n{equal}\nQuestion 8\naverage taxable income per resident\n{equal}\n')
        textfile.write(f'{Q8_CUR_ANSWER}\n')
        textfile.write(f'\n{equal}\nQuestion 9\npercentage of returns for each agi_group\n{equal}\n')
        for x in Q9:
            textfile.write(f'{x}\n')
        textfile.write(f'\n{equal}\nQuestion 10\npercentage of taxable income for each agi_group\n{equal}\n')
        for x in Q10:
            textfile.write(f'{x}\n')

    # Creation of graphs ----------------------------------------------------------------------------------------------

    # Bar graph
    mpl.bar(State_List, State_value)
    mpl.title('Average taxable income (per resident) per state')
    mpl.xlabel('State')
    mpl.ylabel('Average taxable income per resident')
    mpl.savefig('bar.png', bbox_inches='tight')
    mpl.clf()

    # Pie graph 1
    labels = ['Group 1', 'Group 2', 'Group 3', 'Group 4', 'Group 5', 'Group 6']
    mpl.pie(sizes0, labels=labels, autopct='%1.2f%%')
    mpl.title(f'{Full_Name}\'s percentage of returns for each AGI group')
    mpl.savefig(f'pie1{State_name}.png', bbox_inches='tight')
    mpl.clf()

    # Pie graph 2
    labels = ['Group 1', 'Group 2', 'Group 3', 'Group 4', 'Group 5', 'Group 6']
    mpl.pie(sizes1, labels=labels, autopct='%1.2f%%')
    mpl.title(f'{Full_Name}\'s percentage of taxable income for each AGI group')
    mpl.savefig(f'pie2{State_name}.png', bbox_inches='tight')
    mpl.clf()


main()
