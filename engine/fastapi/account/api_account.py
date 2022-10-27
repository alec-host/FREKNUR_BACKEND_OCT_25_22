
import sys
#import asyncio
import aiohttp
import requests

from fastapi import APIRouter,Depends,HTTPException
from fastapi_utils.cbv import cbv
from sqlalchemy.orm import Session
from account_crud import _create_wallet,_get_customer_balance_db,_get_customer_loan_statement,_get_customer_wallet_statement,_get_customer_asset_statement,_withdraw_monies_operation,_deposit_monies_operation,_wallet_transfer_operation
from account_schema import CreateAndUpdateUserAccount,WithdrawOperationItem,TransferOperationItem

sys.path.insert(0,'/usr/local/lib/freknur/engine/fastapi/_system/')
import _message_template

sys.path.insert(0,'/usr/local/lib/freknur/engine/fastapi/utils/')
import http_request

sys.path.insert(0,'/usr/local/lib/freknur/engine/fastapi/account/')
from account_crud import _account_exist,_account_suspended

sys.path.insert(0,'/usr/local/lib/freknur/engine/fastapi/conn/')
from database import DatabaseManager
from redis_wrapper import RedisCache

import config

redis_cache = RedisCache()
account_router = APIRouter()

db_mgt_1 = DatabaseManager(config.FREKNUR_LOAN)
db_mgt_2 = DatabaseManager(config.FREKNUR_GENERAL)
db_mgt_3 = DatabaseManager(config.FREKNUR_INVESTMENT)

@cbv(account_router)
class CustomerAccount:

    @account_router.on_event('startup')
    async def startup_event():
        await redis_cache.init_redis_cache()

    @account_router.on_event('shutdown')
    async def startup_event():
        await redis_cache.close()

    session_1: Session = Depends(db_mgt_1.get_db)
    session_2: Session = Depends(db_mgt_2.get_db)
    session_3: Session = Depends(db_mgt_3.get_db)

    #-.create customer wallet.
    @account_router.post("/createCustomerWallet/")
    async def _create_customer_wallet(self,customer_info: CreateAndUpdateUserAccount):
        #-.check user account exist
        account_exist = _account_exist(self.session_1,customer_info.msisdn)
        try:
            if(int(account_exist) == 0):
                #-.method call.
                response = _create_wallet(self.session_1,customer_info)
                if (response is not None):
                    return {"ERROR":"0","RESULT":"SUCCESS","MESSAGE":"Wallet activated successful"}
                else:
                    return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"Operation has failed"}
            else:
                return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"Already registered"}
        except Exception as ex:
            raise HTTPException(**ex.__dict__)

    #-.add unsecured loan.
    @account_router.get("/getCustomerWalletBal/{msisdn}")
    async def customer_wallet_bal(self, msisdn: str):
        try:
            #-.check user account exist.
            account_exist = _account_exist(self.session_1,msisdn)
            #-.check account is suspended.
            is_account_suspended = _account_suspended(self.session_1,msisdn)
            if(int(account_exist) == 1):
                if(int(is_account_suspended) == 0):
                    #-.create a portfolio key.
                    key = redis_cache._store()[0]+str(msisdn)
                    await redis_cache._del(key)
                    #-.read cache.
                    cache = await redis_cache._get(key)
                    if cache is None:
                        #-.method call.
                        account_info = await _get_customer_balance_db(self.session_1,msisdn)
                        if len(account_info) > 0:
                            #-.save to cache.
                            redis_cache._set(key,account_info)
                            return {"ERROR":"0","RESULT":"SUCCESS","MESSAGE":"BALANCE#"+str(account_info[0])}
                        else:
                            return {"ERROR":"0","RESULT":"SUCCESS","MESSAGE":"BALANCE#0"}
                    else:
                        return cache
                else:
                    return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"Account has been suspended.."}
            else:
                return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You are not a registered user."}
        except Exception as ex:
            raise HTTPException(**ex.__dict__)

    @account_router.get("/getCustomerWalletStatement/{msisdn}")
    async def customer_wallet_stmt(self, msisdn: str):
        try:
            #-.check user account exist.
            account_exist = _account_exist(self.session_1,msisdn)
            #-.check account is suspended.
            is_account_suspended = _account_suspended(self.session_1,msisdn)
            if(int(account_exist) == 1):
                if(int(is_account_suspended) == 0):
                    #-.create a portfolio key.
                    key = redis_cache._store()[4]+str(msisdn)
                    await redis_cache._del(key)
                    cache = await redis_cache._get(key)
                    if cache is None:
                        _limit = 1000
                        wallet_stmt = _get_customer_wallet_statement(self.session_1,msisdn,_limit)
                        if len(wallet_stmt) > 0:
                            #loop = asyncio.get_event_loop()
                            #-.save to cache.
                            redis_cache._set(key,wallet_stmt)
                            #loop.close()
                            return {"ERROR":"0","RESULT":"SUCCESS","DATA":wallet_stmt,"MESSAGE":"Here is your statement"}
                        else:
                            return {"ERROR":"1","RESULT":"FAIL" ,"MESSAGE":"You do not have a statement"}
                    else:
                        return cache
                else:
                    return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"Account has been suspended."}
            else:
                return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You are not a registered user."}
        except Exception as ex:
            raise HTTPException(**ex.__dict__)

    @account_router.get("/getCustomerLoanStatement/{msisdn}")
    async def customer_loan_stmt(self, msisdn: str):
        try:
            #-.check user account exist.
            account_exist = _account_exist(self.session_1,msisdn)
            #-.check account is suspended.
            is_account_suspended = _account_suspended(self.session_1,msisdn)
            if(int(account_exist) == 1):
                if(int(is_account_suspended) == 0):
                    #-.create a portfolio key.
                    key = redis_cache._store()[3]+str(msisdn)
                    await redis_cache._del(key)
                    cache = await redis_cache._get(key)
                    if cache is None:
                        _limit = 1000
                        loan_stmt = await _get_customer_loan_statement(self.session_1,msisdn,_limit)
                        if len(loan_stmt) > 0:
                            #-.save to cache.
                            redis_cache._set(key,loan_stmt)
                            return {"ERROR":"0","RESULT":"SUCCESS","DATA":loan_stmt,"MESSAGE":"Here is your statement"}
                        else:
                            return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You do not have a statement"}
                    else:
                        return cache
                else:
                    return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"Account has been suspended."}
            else:
                return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You are not a registered user."}
        except Exception as ex:
            raise HTTPException(**ex.__dict__)

    @account_router.get("/getCustomerAssetStatement/{msisdn}")
    async def customer_asset_stmt(self, msisdn: str):
        try:
            #-.check user account exist.
            account_exist = _account_exist(self.session_1,msisdn)
            #-.check account is suspended.
            is_account_suspended = _account_suspended(self.session_1,msisdn)
            if(int(account_exist) == 1):
                if(int(is_account_suspended) == 0):
                    #-.create a portfolio key.
                    key = redis_cache._store()[2]+str(msisdn)
                    #---await redis_cache._del(key)
                    cache = await redis_cache._get(key)
                    if cache is None:
                        _limit = 1000
                        asset_stmt = await _get_customer_asset_statement(self.session_1,msisdn,_limit)
                        if len(asset_stmt) > 0:
                            #-.save to cache.
                            redis_cache._set(key,asset_stmt)
                            return {"ERROR":"0","RESULT":"SUCCESS","DATA":asset_stmt,"MESSAGE":"Here is your statement"}
                        else:
                            return {"ERROR":"1","RESULT":"FAIL" ,"MESSAGE":"You do not have a statement"}
                    else:
                        return cache
                else:
                    return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"Account has been suspended."}
            else:
                return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You are not a registered user."}
        except Exception as ex:
            raise HTTPException(**ex.__dict__)

    @account_router.post("/customerWithdrawRequest/")
    async def withdraw_operation(self, withdraw_info: WithdrawOperationItem):
        try:
            if(withdraw_info.msisdn is not None and withdraw_info.amount is not None):
                #-.activity log.
                LOG = _message_template.ACTIVITY_LOG_MSG % (str(withdraw_info.amount), str(withdraw_info.msisdn))
                #-.check user account exist.
                account_exist = _account_exist(self.session_1,withdraw_info.msisdn)
                #-.check account is suspended.
                is_account_suspended = _account_suspended(self.session_1,withdraw_info.msisdn)
                if(int(account_exist) == 1):
                    if(int(is_account_suspended) == 0):
                        if(len(str(withdraw_info.msisdn)) != 0 and len(str(withdraw_info.amount)) != 0):
                            #-.data.
                            json = {"msisdn": withdraw_info.msisdn,"activity": LOG}
                            #-.method call.
                            response = _withdraw_monies_operation(self.session_1,withdraw_info.msisdn,withdraw_info.amount)
                            #-.get keys.
                            key_1 = redis_cache._store()[0]+str(withdraw_info.msisdn)
                            key_2 = redis_cache._store()[4]+str(withdraw_info.msisdn)
                            #-.delete keys.
                            await redis_cache._del(key_1)
                            await redis_cache._del(key_2)
                            #-.log activity.
                            resp = await http_request._post(json)
                        
                            return response
                        else:
                            return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"Invalid input."}
                    else:
                        return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"Account has been suspended."}
                else:
                    return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You are not a registered user."}
            else:
                return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"Invalid input."}
        except Exception as ex:
            raise HTTPException(**ex.__dict__)

    @account_router.post("/customerWalletDeposit/")
    async def deposit_operation(self, deposit_info: WithdrawOperationItem):
        try:
            if(deposit_info.msisdn is not None and deposit_info.amount is not None):
                #-.activity log.
                LOG = _message_template.ACTIVITY_DEPOSIT % (str(deposit_info.amount),str(deposit_info.msisdn))
                #-.check user account exist.
                account_exist = _account_exist(self.session_1,deposit_info.msisdn)
                #-.check account is suspended.
                is_account_suspended = _account_suspended(self.session_1,deposit_info.msisdn)
                if(int(account_exist) == 1):
                    if(int(is_account_suspended) == 0):
                        if(len(str(deposit_info.msisdn)) !=0 and len(str(deposit_info.amount)) != 0):
                            LOG = _message_template.ACTIVITY_DEPOSIT % (str(deposit_info.amount),str(deposit_info.msisdn))
                            #-.method call.
                            _deposit_monies_operation(self.session_1,deposit_info.msisdn,deposit_info.amount)
                            #-.get keys.
                            key_1 = redis_cache._store()[0]+str(deposit_info.msisdn)
                            key_2 = redis_cache._store()[4]+str(deposit_info.msisdn)
                            #-.delete keys.
                            await redis_cache._del(key_1)
                            await redis_cache._del(key_2)
                            #-.data.
                            json = {"msisdn": deposit_info.msisdn,"activity": LOG}
                            #-.log activity.
                            resp = await http_request._post(json)

                            return {"ERROR":"0","RESULT":"SUCESS","MESSAGE":"Wallet a/c has been updated."}
                        else:
                            return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"Invalid input."}
                    else:
                        return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"Account has been suspended."}
                else:
                    return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You are not a registered user."}
            else:
                return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"Invalid input."}
        except Exception as ex:
            raise HTTPExceptiion(**ex.__dict__)

    @account_router.post("/interWalletTransfer/")
    async def wallet_transfer_operation(self, transfer_info: TransferOperationItem):
        try:
            if(transfer_info.msisdn is not None and transfer_info.amount is not None):
                #-.activity log.
                LOG = _message_template.ACTIVITY_TRANSFER % (str(transfer_info.amount),str(transfer_info.msisdn),str(transfer_info.beneficiary_msisdn))
                #-.check user account exist.
                account_exist = _account_exist(self.session_1,transfer_info.msisdn)
                #-.check account is suspended.
                is_account_suspended = _account_suspended(self.session_1,transfer_info.msisdn)
                #-.check user account exist.
                beneficiary_account_exist = _account_exist(self.session_1,transfer_info.beneficiary_msisdn)
                #-.get user bal.
                transfer_info.balance = _get_customer_balance_db(self.session_1,transfer_info.msisdn)[0]
                if(int(account_exist) == 1):
                    if(int(is_account_suspended) == 0):
                        if(int(beneficiary_account_exist) == 1):
                            if(len(str(transfer_info.msisdn)) !=0 and len(str(transfer_info.amount)) != 0):
                                if(float(transfer_info.amount) > 0):
                                    if(float(transfer_info.balance) >= float(transfer_info.amount)):
                                        #-.method call.
                                        response =_wallet_transfer_operation(self.session_1,transfer_info)
                                        #-.get keys.
                                        key_1 = redis_cache._store()[0]+str(transfer_info.msisdn)
                                        key_2 = redis_cache._store()[4]+str(transfer_info.msisdn)
                                        #-.delete keys.
                                        await redis_cache._del(key_1)
                                        await redis_cache._del(key_2)
                                        #-.data.
                                        json = {"msisdn": transfer_info.msisdn,"activity": LOG}
                                        #-log activity.
                                        resp = await http_request._post(json)

                                        return response
                                    else:
                                        return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"Insufficient Balance"}
                                else:
                                    return  {"ERROR":"1","RESULT":"FAIL","MESSAGE":"Amount has to be greater than ZERO."}
                            else:
                                return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"Invalid input."}
                        else:
                             return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You are not a registered user."}
                    else:
                        return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"Account has been suspended."}
                else:
                    return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You are not a registered user."}
            else:
                return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"Invalid input."}
        except Exception as ex:
            raise HTTPException(**ex.__dict__)
