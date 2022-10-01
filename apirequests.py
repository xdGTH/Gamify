from ast import parse
from xml.dom.minidom import CharacterData
import requests
import pandas as pd

baseurl ='https://rickandmortyapi.com/api/'
endpoint = 'character'

def main_request(baseurl, endpoint, x):
    r = requests.get(baseurl + endpoint + f'?page={x}')
    return r.json()


def get_pages(response):
    pages = response['info']['pages']
    return pages

def parse_json(response):
    characterlist = []
    for item in response['results'] :
        char = {
            'ID' : item['id'],
            'name' : item['name'],
            'no_epi' : len(item['episode']),
        }
        characterlist.append(char)
    return characterlist


mainlist = []
data = main_request(baseurl, endpoint, 1)
for x in range (1, get_pages(data)+1):
    #print(x)
    mainlist.extend(parse_json(main_request(baseurl, endpoint, x)))

print(len(mainlist))

#print(get_pages(data))
print(parse_json(data))

dataframe = pd.DataFrame(mainlist)

dataframe.to_csv('charlsit.csv', index=False)

#print(dataframe.head(), dataframe.tail())