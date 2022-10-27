import sys
  

from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer, Float, DateTime

sys.path.insert(0,'/usr/local/lib/freknur/engine/fastapi/conn/')
from database import Base

class InventoryDescription(Base):
    __tablename__ = "tbl_inventory"

    _id = Column(Integer, primary_key=True, index=True)
    item_uid = Column(String)
    item_name = Column(String)
    item_image = Column(String)
    qty_in = Column(Integer)
    qty_out = Column(Integer)
    unit_price = Column(Float)
    date_created = Column(DateTime)
    date_modified = Column(DateTime)
    is_available = Column(Integer)
