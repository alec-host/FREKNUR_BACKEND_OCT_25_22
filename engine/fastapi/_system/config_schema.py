#!usr/bin/ python3.9
'''
@author: alex
@name: freknur
'''

import uuid

from datetime import datetime

date = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

from pydantic import BaseModel,Field
from typing import Optional

class CreateAndUpdateActivityLog(BaseModel):
    msisdn: str
    activity: str
    time_stamp: Optional[str] = date
    flag: Optional[int] = 0

class ActivityLog(CreateAndUpdateActivityLog):
    msisdn: str

    class Config:
        orm_mode = True
