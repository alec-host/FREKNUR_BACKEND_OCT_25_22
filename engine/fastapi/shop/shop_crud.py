import uuid

from datetime import datetime

from sqlalchemy import func, desc
from sqlalchemy.orm import Session

from shop_schema import CreateAndUpdateInventory
from shop_model import InventoryDescription

#-.method: inventory list.
def _get_inventory_list(session: Session, _limit: int) -> InventoryDescription:
    result = session.query(InventoryDescription.item_uid,
                           InventoryDescription.item_name,
                           InventoryDescription.item_image,
                           InventoryDescription.qty_in.label('qty'),
                           func.concat('',InventoryDescription.unit_price,'').label('unit_price'),\
                           func.concat('',InventoryDescription.date_created,'').label('date_created')).\
                           filter(InventoryDescription.qty_in>0).\
                           filter(InventoryDescription.is_available==0).\
                           order_by(desc(InventoryDescription.date_created)).\
                           limit(_limit)

    return result.all()
