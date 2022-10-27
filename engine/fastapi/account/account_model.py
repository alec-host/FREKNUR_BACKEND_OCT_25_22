import sys
  

from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer, Float, DateTime

sys.path.insert(0,'/usr/local/lib/freknur/engine/fastapi/conn/')
from database import Base

class UserAccountDescription(Base):
    __tablename__ = "tbl_wallet"

    id = Column(Integer, primary_key=True, index=True)
    uid = Column(String)
    msisdn = Column(String)
    balance = Column(Float)
    reference_no = Column(String)
    county_id = Column(Integer)
    language_id = Column(Integer)
    password = Column(String)
    salt = Column(String)
    date_created = Column(DateTime)
    date_modified = Column(DateTime)
    is_active = Column(Integer)
    is_suspended = Column(Integer)

class UserAcoountExraDescription(Base):
    __tablename__ = "tbl_wallet_extra"

    _id = Column(Integer, primary_key=True, index=True)
    msisdn = Column(String)
    first_name = Column(String)
    second_name = Column(String)
    birth_date = Column(String)
    mail = Column(String)
    country_code = Column(String)
    time_stamp = Column(DateTime)

class WalletTransactionDescription(Base):
    __tablename__ = "tbl_wallet_transaction"

    id = Column(Integer, primary_key=True, index=True)
    reference_no = Column(String)
    msisdn = Column(String)
    cr = Column(Float)
    dr = Column(Float)
    balance = Column(Float)
    narration = Column(String)
    date_created = Column(DateTime)
    date_modified = Column(DateTime)
    is_archived = Column(Integer)
