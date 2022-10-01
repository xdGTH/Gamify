from ast import parse
from email.mime import base
from urllib import response
import requests
import pandas as pd

baseurl = 'https://api.football-data.org/v2/'
endpoint = 'competitions'

def main_url(baseurl, endpoint):
    r = requests.get(baseurl + endpoint)
    return r.json()

data = main_url(baseurl, endpoint)

def try_loop(response):
    characterList = []
    for item in response['competitions']:
        name = {
            'ID' : item['id'],
            'Name' : item['name'],
            'Area' : item['area']
        }
        characterList.append(name)
    
    return characterList
print(try_loop(data))