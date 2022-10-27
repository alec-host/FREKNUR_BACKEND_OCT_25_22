import sys
  

from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer, Float, DateTime

sys.path.insert(0,'/usr/local/lib/freknur/engine/fastapi/conn/')
from database import Base

class ActivityLogDescription(Base):
    __tablename__ = "tbl_activity_log"
    
    _id = Column(Integer, primary_key=True, index=True)
    msisdn = Column(String)
    activity = Column(String)
    time_stamp = Column(DateTime)
    flag = Column(Integer)
