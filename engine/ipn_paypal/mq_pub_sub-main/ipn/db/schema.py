from pydantic import BaseModel
from typing import Optional

from datetime import datetime
date = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

class CreateAndUpdateIpnReceipt(BaseModel):
    txn_id: str
    ipn: str
    date_created: Optional[str] = date

class IpnReceipt(CreateAndUpdateIpnReceipt):
    trn_id: str

    class Config:
        orm_mode = True
