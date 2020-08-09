import xlrd
import pandas as pd
import requests
import json
import time

url = 'https://online2.superoffice.com/Cust23596/CS/scripts/customer.fcgi?action=safeParse&includeId=portal&key=5nwArFRGmcLd1npO'

df = pd.read_excel("OTIS_Import_V2.xlsx")
# len(df.columns)

article_id = list(df['ARTICLE_ID (MeldingsID)'])
message_head = list(df['Melding Emne'])
message_created = list(df['Melding opprettet'])
message_type = list(df['Melding Type'])
message_created_by = list(df['Melding skrevet av'])
message_from = list(df['Melding fra'])
message_to = list(df['Melding til'])
message_text = list(df['Melding tekst'])
otis_id = list(df['Sak ID'])
ticket_title = list(df['Sak Tittel'])
category = list(df['Kategori'])
owner = list(df['Eier'])
person = list(df['Person'])
status = list(df['Status'])
postponed = list(df['Utsatt til'])

c = 0
for i in otis_id:
    myobj = {
        "articleId": article_id[c],
        "messageHeader": message_head[c],
        "messageCreated": message_created[c],
        "messageType": message_type[c],
        "messageCreatedBy": message_created_by[c],
        "messageFrom": message_from[c],
        "messageTo": message_to[c],
        "messageText": message_text[c],
        "otisId": otis_id[c],
        "ticketTitle": ticket_title[c],
        "category": category[c],
        "owner": owner[c],
        "person": person[c],
        "status": status[c],
        "postponed": postponed[c]
    }
    c += 1
    x = requests.post(url, data=myobj)
