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

class CreateAndUpdateUnsecuredLoan(BaseModel):
    reference_no: Optional[str] = 'LNR-'+str(uuid.uuid1())
    msisdn: str
    amount: float
    collateral_percentage: Optional[float] = 0.00
    requested_by: Optional[str] = 'auto'
    approved_by: Optional[str] = 'admin'
    task_flag:  Optional[int] = 0
    date_created: Optional[str] = date
    date_modified: Optional[str] = date
    has_collateral: Optional[int] = 0
    is_processed: Optional[int] = 0

class CreateAndUpdateSecuredLoan(BaseModel):
    reference_no: Optional[str] = 'LNR-'+str(uuid.uuid1())
    msisdn: str
    amount: float
    collateral_percentage: Optional[float] = 0.00
    requested_by: Optional[str] = 'admin'
    approved_by: Optional[str] = 'admin'
    task_flag:  Optional[int] = 0
    date_created: Optional[str] = date
    date_modified: Optional[str] = date
    has_collateral: Optional[int] = 1
    is_processed: Optional[int] = 0

class CreateAndUpdateLoanTempList(BaseModel):
    msisdn: str
    loan_amount: float
    interest: float

class CreateAndUpdateLoanCollateral(BaseModel):
    msisdn: str
    loan_amount: float
    portfolio_worth: Optional[float] = 0.00
    collateral_percentage: Optional[float] = 0.00
    is_processed: Optional[int] = 0   

class UnsecuredLoan(CreateAndUpdateUnsecuredLoan):
    msisdn: str

    class Config:
        orm_mode = True

class SecuredLoan(CreateAndUpdateSecuredLoan):
    msisdn: str

    class Config:
        orm_mode = True

class LoanTempList(CreateAndUpdateLoanTempList):
    msisdn: str

    class Config:
        orm_mode = True

class LoanCollateral(CreateAndUpdateLoanCollateral):
    msisdn: str

    class Config:
        orm_mode = True
