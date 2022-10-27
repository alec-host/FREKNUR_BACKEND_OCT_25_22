
import sys
import json

from fastapi import APIRouter,Depends,HTTPException
from fastapi_utils.cbv import cbv
from sqlalchemy.orm import Session
from fastapi.encoders import jsonable_encoder
from shop_crud import _get_inventory_list

sys.path.insert(0,'/usr/local/lib/freknur/engine/fastapi/utils/')
from _json_encoder import date_encoder

sys.path.insert(0,'/usr/local/lib/freknur/engine/fastapi/account/')
from account_crud import _account_exist,_account_suspended

sys.path.insert(0,'/usr/local/lib/freknur/engine/fastapi/conn/')
from database import DatabaseManager
from redis_wrapper import RedisCache

import config

redis_cache = RedisCache()
shop_router = APIRouter()

db_mgt_1 = DatabaseManager(config.FREKNUR_LOAN)
db_mgt_2 = DatabaseManager(config.FREKNUR_GENERAL)
db_mgt_3 = DatabaseManager(config.FREKNUR_INVESTMENT)
db_mgt_4 = DatabaseManager(config.FREKNUR_INVENTORY)

@cbv(shop_router)
class Shop:

    @shop_router.on_event('startup')
    async def startup_event():
        await redis_cache.init_redis_cache()

    @shop_router.on_event('shutdown')
    async def startup_event():
        await redis_cache.close()

    session_1: Session = Depends(db_mgt_1.get_db)
    session_2: Session = Depends(db_mgt_2.get_db)
    session_3: Session = Depends(db_mgt_3.get_db)
    session_4: Session = Depends(db_mgt_4.get_db)

    #-.add unsecured loan.
    @shop_router.get("/getCustomerInventoryList/{msisdn}")
    async def customer_inventory_list(self,msisdn: str):
        try:
            #-.check user account exist.
            account_exist = _account_exist(self.session_1,msisdn)
            #-.check account is suspended.
            is_account_suspended = _account_suspended(self.session_1,msisdn)
            if(int(account_exist) == 1):
                if(int(is_account_suspended) == 0):
                    #-.create a shop key.
                    key = redis_cache._store()[5]+str("shop_catalogue")
                    #-.delete
                    #-.await redis_cache._del(key)
                    #-.read cache.
                    cache = await redis_cache._get(key)
                    #-.method call.
                    if cache is None:
                        _limit = 1000
                        #-.method call.
                        inventory_list = _get_inventory_list(self.session_4,_limit)
                        #-.save to cache.
                        await redis_cache._set(key,json.dumps(jsonable_encoder({"ERROR":"0","RESULT":"SUCCESS","DATA":inventory_list,"MESSAGE":"Shop list is available."})))

                        if(len(inventory_list) > 0):
                            return {"ERROR":"0","RESULT":"SUCCESS","DATA":inventory_list,"MESSAGE":"Shop list is available."}
                        else:
                            return {"ERROR":"1","RESULT":"FAIL","DATA":inventory_list,"MESSAGE":"Empty shop list"}
                    else:
                        #-.read from cache.
                        inventory_list = cache

                        return inventory_list
                else:
                    return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You account has been suspended."}
            else:
                return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You are not a registered user."}
        except Exception as ex:
            raise HTTPException(**ex.__dict__)
