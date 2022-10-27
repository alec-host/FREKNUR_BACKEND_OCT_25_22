#!usr/bin/ python3.9
'''
@author: alex
@name: freknur
'''

import uuid

from datetime import datetime

date = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

from pydantic import BaseModel
from typing import Optional

class CreateAndUpdateInventory(BaseModel):
    item_uid: Optional[str] = '0'
    item_name: str
    item_image: Optional[str] = 'no_image'
    qty_in: Optional[int] = 0
    qty_out: Optional[int] = 0
    unit_price: Optional[float] = 0.00
    date_created: Optional[str] = date
    date_modified: Optional[str] = date
    is_available: Optional[int] = 0

class Inventory(CreateAndUpdateInventory):
    msisdn: str

    class Config:
        orm_mode = True
