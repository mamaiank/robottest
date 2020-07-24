import urllib.parse
import logging
import xlrd
import json
import datetime
import pyodbc
from dateutil.relativedelta import relativedelta
import calendar
import time
import openpyxl
import math

def set_query_parameter(url, param):
    # logging.info(param)
    logging.warn(param)
    if (param is None) or (param == {}):
        return url
    else:
        return url+'?'+urllib.parse.urlencode(param)


def make_json_from_data(column_names, row_data):
    row_list = []
    for item in row_data:
        json_obj = {}
        for i in range(0, column_names.__len__()):
            json_obj[column_names[i]] = to_json(item[i])
        row_list.append(json_obj)
    return row_list

def to_json(myjson):
    try:
        json_object = json.loads(myjson)
    except ValueError as e:
        return myjson
    return json_object


def xls_to_dict(workbook_url):
    workbook_dict = {}
    book = xlrd.open_workbook(workbook_url)
    sheets = book.sheets()
    for sheet in sheets:
        if sheet.name == 'PortHoles & Discrete Appurtenan':
            continue
        workbook_dict[sheet.name] = {}
        columns = sheet.row_values(0)
        rows = []
        for row_index in range(1, sheet.nrows):
            row = sheet.row_values(row_index)
            rows.append(row)
        sheet_data = make_json_from_data(columns, rows)
        workbook_dict[sheet.name] = sheet_data
    return workbook_dict


def get_data_test_case(workbook_url, sheetName, testcaseName):
    json_object = xls_to_dict(workbook_url)
    for dict in json_object[sheetName]:
        if dict['TC No.'] == testcaseName:
            return dict


def get_month(start_at=0, add_month=1, separator="/"):
    if (add_month < 1):
        add_month = 1
    return_date = ""
    for index in range(0, add_month):
        add_month = start_at + index
        get_date = datetime.date.today() + relativedelta(months=add_month)
        get_year = str(get_date.year)
        get_month = str(get_date.month) if get_date.month > 9 else "0" + str(get_date.month)
        data_date = get_year + separator + get_month
        if (index != 0):
            data_date = "," + data_date
        return_date = return_date + data_date
    return return_date

def get_month_only(start_at=0, addzero=False):
    get_date = datetime.date.today() + relativedelta(months=start_at)
    get_month = str(get_date.month)
    if (addzero) and (get_date.month < 10):
        get_month = "0" + get_month
    data_date = get_month
    return data_date

def get_row_month_calendar(month):
    month = int(month)
    get_row = math.ceil(month / 3)
    return get_row

def get_column_month_calendar(month, row):
    month = int(month)
    row = int(row)
    cal_col = 3 * (row - 1)
    get_column = month - cal_col
    return get_column

def set_data_excel(workbook_url, sheetname, column_data, new_data):
    xfile = openpyxl.load_workbook(workbook_url)
    sheet = xfile[sheetname]
    sheet[column_data] = new_data
    xfile.save(workbook_url)
# set_data_excel("Resource/datatest-2.xlsx", "Month_End", "A1", get_month())

def get_week_cycle(previous_day = -7):
    get_date = datetime.datetime.today() + relativedelta(days=previous_day)
    day_of_week = get_date.weekday()
    tuesday_of_week = 1 if day_of_week > 0 else 6
    monday_of_week = 7 if day_of_week > 0 else 0

    cal_day_first = tuesday_of_week - day_of_week
    cal_day_last = monday_of_week - day_of_week
    
    first_date = get_date + relativedelta(days=cal_day_first)
    last_date = get_date + relativedelta(days=cal_day_last)

    get_year = str(first_date.year)
    get_month = str(first_date.month) if first_date.month > 9 else "0" + str(first_date.month)
    get_day_first = str(first_date.day) if first_date.day > 9 else "0" + str(first_date.day)
    get_day_last = str(last_date.day) if last_date.day > 9 else "0" + str(last_date.day)

    data_date = get_year + get_month + "_" + get_day_first + "-" + get_day_last
    return data_date

def get_today():
    get_date = datetime.date.today()

    get_year = str(get_date.year)
    get_month = str(get_date.month) if get_date.month > 9 else "0" + str(get_date.month)
    get_day = str(get_date.day) if get_date.day > 9 else "0" + str(get_date.day)

    data_date = get_year + "/" + get_month + "/" + get_day
    return data_date

def get_today_timestamp(addstring=""):
    addstring = str(addstring)
    ts = datetime.datetime.now().timestamp()
    ts = int(ts)
    return str(ts) + addstring

def select_sql(connection_string, query):
    cnxn = pyodbc.connect(connection_string)
    cursor = cnxn.cursor()
    cursor.execute(query)
    rows = cursor.fetchone()
    return rows

def get_last_day_of_month(separator="/"):
    get_date = datetime.date.today()
    get_last_day = calendar.monthrange(get_date.year, get_date.month)[1]

    get_year = str(get_date.year)
    get_month = str(get_date.month) if get_date.month > 9 else "0" + str(get_date.month)
    get_day = str(get_last_day) if get_last_day > 9 else "0" + str(get_last_day)

    data_date = get_year + separator + get_month + separator + get_day
    return data_date

def get_previous_day_timestamp(previous_day = -8):
    get_date = datetime.datetime.now() + relativedelta(days=previous_day)
    timestamp = time.mktime(get_date.timetuple()) + get_date.microsecond/1e6
    timestamp = int(timestamp)
    return timestamp

def insert_sq_sql(connection_string, ** sq_data):
    cnxn = pyodbc.connect(connection_string)
    cursor = cnxn.cursor()
    cursor.execute('EXEC [dbo].[proc_create_newcombination] ' + sq_data['sq_ty'] + ' , ' + sq_data['chnl_cd'] + ' , ' + sq_data['rgn_cd'] + ' , ' +
                   sq_data['sls_grp_cd'] + ' , ' + sq_data['cust_cd'] + ' , ' + sq_data['mat_cd'] + ' , ' + sq_data['mth_cd'] + ' , ' + sq_data['init_vol'])
    cnxn.commit()
