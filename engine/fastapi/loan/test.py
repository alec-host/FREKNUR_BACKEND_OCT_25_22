#!usr/bin/pythnon3.9

import sys


from loan_view import LoanView

'''
from fastapi import Depends
from sqlalchemy.orm import Session
'''

'''
sys.path.insert(0,'/usr/local/lib/freknur/engine/fastapi/conn/')

import config

from database import DatabaseManager

s = config.DATABASE_URL

print(s)



db_manager = DatabaseManager('tbl_loan_request')

session: Session = Depends(db_manager.get_db)


print(session)

'''

view = LoanView()


view.add_unsecured_loan(loan_info: CreateAndUpdateUnsecuredLoan)


