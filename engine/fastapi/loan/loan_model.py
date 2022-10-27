import sys


from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer, Float, DateTime

sys.path.insert(0,'/usr/local/lib/freknur/engine/fastapi/conn/')
from database import Base

class LoanDescription(Base):
    __tablename__ = "tbl_loan_request"

    id = Column(Integer, primary_key=True, index=True)
    reference_no = Column(String)
    msisdn = Column(String)
    amount = Column(Float)
    collateral_percentage = Column(Float)
    task_flag = Column(String)
    requested_by = Column(String)
    approved_by = Column(String)
    date_created = Column(DateTime)
    date_modified = Column(DateTime)
    has_collateral = Column(Integer)
    is_processed = Column(Integer)


class LoanTempDescription(Base):
    __tablename__ = "tbl_loan_temp_list"

    id = Column(Integer, primary_key=True, index=True)
    msisdn = Column(String)
    loan_amount = Column(Float)
    interest = Column(Float)

class LoanCollateralDescription(Base):
    __tablename__ = "tbl_loan_collateral"

    _id = Column(Integer, primary_key=True, index=True)
    msisdn = Column(String)
    loan_amount = Column(Float)
    portfolio_worth = Column(Float)
    collateral_percentage = Column(Float)
    is_processed = Column(Integer)
