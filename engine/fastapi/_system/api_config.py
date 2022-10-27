import sys

from fastapi import APIRouter,Depends,HTTPException
from fastapi_utils.cbv import cbv
from sqlalchemy.orm import Session

from config_schema import CreateAndUpdateActivityLog
from config_crud import _record_activity_log

sys.path.insert(0,'/usr/local/lib/freknur/engine/fastapi/conn/')
from database import DatabaseManager

import config

config_router = APIRouter()

db_mgt_1 = DatabaseManager(config.FREKNUR_LOAN)
db_mgt_2 = DatabaseManager(config.FREKNUR_GENERAL)
db_mgt_3 = DatabaseManager(config.FREKNUR_INVESTMENT)

@cbv(config_router)
class ActivityLogs:
    
    session_1: Session = Depends(db_mgt_1.get_db)
    session_2: Session = Depends(db_mgt_2.get_db)
    session_3: Session = Depends(db_mgt_3.get_db)

    #-.add activity log.
    @config_router.post("/recordUserActivity/")
    async def record_activity(self, activiy_info: CreateAndUpdateActivityLog):
        try:
            _record_activity_log(self.session_2,activiy_info)

            return {"ERROR":"0","RESULT":"SUCCESS","MESSAGE":"insert complete."}
        except Exception as ex:
            raise HTTPException(**ex.__dict__)

            
