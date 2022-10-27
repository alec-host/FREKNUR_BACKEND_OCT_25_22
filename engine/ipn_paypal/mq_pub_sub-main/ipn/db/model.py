
import sys

from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer, DateTime

sys.path.insert(0,'/usr/local/lib/freknur/engine/fastapi/conn/')
from database import Base


class IpnReceiptDescription(Base):
    __tablename__ = "tbl_ipn_receipt"

    _id = Column(Integer, primary_key=True, index=True)
    txn_id  = Column(String)
    ipn = Column(String)
    date_created = Column(DateTime)
