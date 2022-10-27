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

class CreateAndUpdateUserAccount(BaseModel):
    uid: Optional[str] = '0'
    msisdn: str
    balance: Optional[float] = 0.00
    reference_no: Optional[str] = '0'
    county_id: Optional[int] = None
    language_id: Optional[int] = 1
    password:  Optional[str] = None
    salt: Optional[str] = None
    date_created: Optional[str] = date
    date_modified: Optional[str] = date
    is_active: Optional[int] = 1
    is_suspended: Optional[int] = 0

class CreateAndUpdateUserAccountExtra(BaseModel):
    msisdn: str
    first_name: Optional[str] = None
    second_name: Optional[str] = None
    birth_date:  Optional[str] = None
    mail:  Optional[str] = None
    country_code: Optional[str] = None
    time_stamp: Optional[str] = date

class CreateAndUpdateWalletTransaction(BaseModel):
    reference_no: str
    msisdn: str
    cr: Optional[float] = 0.00
    dr: Optional[float] = 0.00
    balance: Optional[float] = 0.00
    narration: Optional[str] = None
    date_created: Optional[str] = date
    date_modified: Optional[str] = date
    is_archived: Optional[int] = 0

class WithdrawOperationItem(BaseModel):
    msisdn: str
    amount: Optional[float] = 0.00

class TransferOperationItem(BaseModel):
    balance: Optional[float] = 0.00 
    msisdn: str
    amount: Optional[float] = 0.00
    beneficiary_msisdn: str

class UserAccount(CreateAndUpdateUserAccount):
    msisdn: str

    class Config:
        orm_mode = True

class UserAccountExtra(CreateAndUpdateUserAccountExtra):
    msisdn: str

    class Config:
        orm_mode = True

class WalletTransaction(CreateAndUpdateWalletTransaction):
    msisdn: str

    class Config:
        orm_mode = True
