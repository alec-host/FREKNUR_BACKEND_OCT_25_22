
import sys

from fastapi import APIRouter,Depends,HTTPException
from fastapi_utils.cbv import cbv
from sqlalchemy.orm import Session
from investment_crud import _get_customer_porfolio,_get_customer_porfolio_temp,_get_customer_porfolio_temp_cnt,\
                            _get_asset_list,_get_asset_settings_params,_get_asset_settings,_delete_own_sale_request,\
                            _delete_own_sale_request_temp,_get_sale_request_list,_get_sale_owner_request_list

sys.path.insert(0,'/usr/local/lib/freknur/engine/fastapi/account/')
from account_crud import _account_exist,_account_suspended

sys.path.insert(0,'/usr/local/lib/freknur/engine/fastapi/conn/')
from database import DatabaseManager
from redis_wrapper import RedisCache

import config

redis_cache = RedisCache()
investment_router = APIRouter()

db_mgt_1 = DatabaseManager(config.FREKNUR_LOAN)
db_mgt_2 = DatabaseManager(config.FREKNUR_GENERAL)
db_mgt_3 = DatabaseManager(config.FREKNUR_INVESTMENT)

@cbv(investment_router)
class Investment:
    
    @investment_router.on_event('startup')
    async def startup_event():
        await redis_cache.init_redis_cache()

    @investment_router.on_event('shutdown')
    async def startup_event():
        await redis_cache.close()    

    session_1: Session = Depends(db_mgt_1.get_db)
    session_2: Session = Depends(db_mgt_2.get_db)
    session_3: Session = Depends(db_mgt_3.get_db)

    #-.add unsecured loan.
    @investment_router.get("/getCustomerPortfolioList/{msisdn}")
    async def customer_portfolio_list(self,msisdn: str):
        try:
            #-.check user account exist.
            account_exist = _account_exist(self.session_1,msisdn)
            #-.check account is suspended.
            is_account_suspended = _account_suspended(self.session_1,msisdn)
            if(int(account_exist) == 1):
                if(int(is_account_suspended) == 0):
                    #-.check whether assets are locked?
                    cnt = _get_customer_porfolio_temp_cnt(self.session_3,msisdn)
                    #-.create a portfolio key.
                    key = redis_cache._store()[1]+str(msisdn)
                    #await redis_cache._del(key)
                    #-.read cache.
                    cache = await redis_cache._get(key)
                    #-.method call.
                    if cache is None:
                        if int(cnt) == 0:
                            #-.method call.
                            portfolio_list = _get_customer_porfolio(self.session_3,msisdn)
                            #-.save to cache.
                            await redis_cache._set(key,portfolio_list)
                        else:
                            #-.method call.
                            portfolio_list = _get_customer_porfolio_temp(self.session_3,msisdn)
                            #-.save to cache.
                            await redis_cache._set(key,portfolio_list)
                    else:
                        #-.read from cache.
                        portfolio_list = cache

                    if len(portfolio_list) == 0:
                        return {"ERROR":"0","RESULT":"SUCCESS","DATA":portfolio_list,"MESSAGE":"You have no investments."}
                    else:
                        return {"ERROR":"0","RESULT":"SUCCESS","DATA":portfolio_list,"MESSAGE":"Your investments list."}
                else:
                    return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You account has been suspended."}
            else:
                return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You are not a registered user."}
        except Exception as ex:
            raise HTTPException(**ex.__dict__)

    #-.get sale asset request.
    @investment_router.get("/getSaleRequestList/{msisdn}/{is_owner}")
    async def get_asset_sale_request(self,msisdn: str, is_owner: int):
        try:
            #-.check user account exist.
            account_exist = _account_exist(self.session_1,msisdn)
            #-.check account is suspended.
            is_account_suspended = _account_suspended(self.session_1,msisdn)
            limit = 1000
            if(int(account_exist) == 1):
                if(int(is_account_suspended) == 0):
                    if int(is_owner) == 1:
                        #-.method call.
                        sale_info = _get_sale_owner_request_list(self.session_3,msisdn,limit)
                    else:
                        #-.method call.
                        sale_info = _get_sale_request_list(self.session_3,msisdn,limit)

                    if len(sale_info) == 0:
                        return {"ERROR":"0","RESULT":"SUCCESS","DATA":sale_info,"MESSAGE":"User has no investments."}
                    else:
                        if int(is_owner) == 1:
                            return {"ERROR":"0","RESULT":"SUCCESS","DATA":sale_info,"MESSAGE":"User has investments."}
                        else:
                            return {"ERROR":"0","RESULT":"SUCCESS","DATA":sale_info,"MESSAGE":"Sell request list."}
                else:
                    return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You account has been suspended."}
            else:
                return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You are not a registered user."}
        except Exception as ex:
            raise HTTPException(**ex.__dict__)

    #-.get asset list.
    @investment_router.get("/getAssetList/{msisdn}")
    async def get_asset_list(self,msisdn: str):
        try:
            #-.check user account exist.
            account_exist = _account_exist(self.session_1,msisdn)
            #-.check account is suspended.
            is_account_suspended = _account_suspended(self.session_1,msisdn)
            limit = 1000
            if(int(account_exist) == 1):
                if(int(is_account_suspended) == 0):
                    key = redis_cache._store()[6]+str("asset_list")
                    #await redis_cache._del(key)
                    #-.read cache.
                    cache = await redis_cache._get(key)                    
                    #-.method call.
                    fee,lower,upper,markup,offer = _get_asset_settings_params(self.session_3)
                    #-.method call.
                    asset_info = _get_asset_list(self.session_3,msisdn,markup,limit)
                    if cache is None:
                        #-.method call.
                        asset_info = _get_asset_list(self.session_3,msisdn,markup,limit)
                        if(len(asset_info) == 0):
                            return {"ERROR":"0","RESULT":"SUCCESS","DATA":asset_info,"MESSAGE":"No assets."}
                        else:
                            return {"ERROR":"0","RESULT":"SUCCESS","DATA":asset_info,"MESSAGE":"Asset list."}
                    else:
                        #-.read from cache.
                        asset_info = cache
                        return {"ERROR":"0","RESULT":"SUCCESS","DATA":asset_info,"MESSAGE":"Asset list."}
                else:
                    return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You account has been suspended."}
            else:
                    return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You are not a registered user."}
        except Exception as ex:
            raise HTTPException(**ex.__dict__)

    #-.get asset settings.
    @investment_router.get("/getAssetSettings/")
    async def get_asset_settings(self):
        try:
            setting_info = _get_asset_settings(self.session_3)
            if(len(setting_info) == 0):
                return {"ERROR":"1","RESULT":"FAIL","DATA":setting_info,"MESSAGE":"No settings has been setup."}
            else:
                return {"ERROR":"0","RESULT":"SUCCESS","DATA":setting_info,"MESSAGE":"Asset settings found."}
        except Exception as ex:
            raise HTTPException(**ex.__dict__)

    #-.edit sale own request.
    @investment_router.post("/modifyOwnSaleRequest/")
    async def modify_own_sale_request(self):
        try:
            print('xxxxxxxxxxxxxxxxxxxxxxx')    
        except Exception as ex:
            raise HTTPException(**ex.__dict__)

    #-.delete sale request.
    @investment_router.get("/deleteOwnSaleRequest/{msisdn}/{uid}")
    async def delete_own_sale_request(self,msisdn: str,uid: str):
        try:
            #-.method 1.
            _delete_own_sale_request(self.session_3,msisdn,uid)
            #-.method 2.
            _delete_own_sale_request_temp(self.session_3,msisdn,uid)
        except Exception as ex:
            raise HTTPException(**ex.__dict__)
