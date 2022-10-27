
import json
import datetime

def date_encoder(o):
  if isinstance(o, datetime.datetime):
      return o.__str__()
