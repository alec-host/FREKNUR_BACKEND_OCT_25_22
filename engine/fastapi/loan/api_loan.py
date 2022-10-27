
import sys

from fastapi import APIRouter,Depends,HTTPException
from fastapi_utils.cbv import cbv
from sqlalchemy.orm import Session
from loan_crud import _create_unsecured_loan,_create_secured_loan,_has_existing_loan,_has_queued_loan,_get_customer_loan_arrears
from loan_schema import CreateAndUpdateUnsecuredLoan,CreateAndUpdateSecuredLoan

sys.path.insert(0,'/usr/local/lib/freknur/engine/fastapi/account/')
from account_crud import _account_exist,_account_suspended

sys.path.insert(0,'/usr/local/lib/freknur/engine/fastapi/investment/')
from investment_crud import _get_customer_porfolio,_lock_customer_asset_portfolio

sys.path.insert(0,'/usr/local/lib/freknur/engine/fastapi/conn/')
from database import DatabaseManager

import config

loan_router = APIRouter()

db_mgt_1 = DatabaseManager(config.FREKNUR_LOAN)
db_mgt_2 = DatabaseManager(config.FREKNUR_GENERAL)
db_mgt_3 = DatabaseManager(config.FREKNUR_INVESTMENT)

@cbv(loan_router)
class Loans:
    session_1: Session = Depends(db_mgt_1.get_db)
    session_2: Session = Depends(db_mgt_2.get_db)
    session_3: Session = Depends(db_mgt_3.get_db)
    #-.add unsecured loan.
    @loan_router.post("/createUnsecuredLoan/")
    async def add_unsecured_loan(self, loan_info: CreateAndUpdateUnsecuredLoan):
        try:
            #-.check user account exist.
            account_exist = _account_exist(self.session_1,loan_info.msisdn)
            #-.check user has existing loan.
            has_loan = _has_existing_loan(self.session_2,loan_info.msisdn)
            #-.check user has a queued loan.
            has_queued_loan = _has_queued_loan(self.session_1,loan_info.msisdn)
            #-.check account is suspended.
            is_account_suspended = _account_suspended(self.session_1,loan_info.msisdn)
            if(int(account_exist) == 1):
                if(int(is_account_suspended) == 0):
                    if(int(has_loan) == 0):
                        if(int(has_queued_loan[0]) == 0):
                            #-.method call.
                            loan_info = _create_unsecured_loan(self.session_1,loan_info)
                            return {"ERROR":"0","RESULT":"SUCCESS","DATA":[loan_info],"MESSAGE":"Loan request was successful."}
                        else:
                            return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You have loan request of "+str(has_queued_loan[1])+" pending approval."}
                    else:
                        return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You have an existing loan."}
                else:
                    return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You account has been suspended."}
            else:
                return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You are not a registered user."}
        except Exception as ex:
            raise HTTPException(**ex.__dict__)

    #-.add secured loan.
    @loan_router.post("/createSecuredLoan/")
    async def add_secured_loan(self, loan_info: CreateAndUpdateSecuredLoan):
        try:
            #-.get loan security.
            total_portfolio = _get_customer_porfolio(self.session_3,loan_info.msisdn)
            #-.check user account exist.
            account_exist = _account_exist(self.session_1,loan_info.msisdn)
            #-.check user has existing loan.
            has_loan = _has_existing_loan(self.session_2,loan_info.msisdn)
            #-.check user has a queued loan.
            has_queued_loan = _has_queued_loan(self.session_1,loan_info.msisdn)
            #-.check account is suspended.
            is_account_suspended = _account_suspended(self.session_1,loan_info.msisdn)
            if(int(account_exist) == 1):
                if(int(is_account_suspended) == 0):
                    if(int(has_loan) == 0):
                        if(int(has_queued_loan[0]) == 0):
                            #-.method call.
                            loan_info = _create_secured_loan(self.session_1,loan_info.msisdn)
                            #-.method call.
                            _lock_customer_asset_portfolio(self.session_3,loan_info.msisdn)
                            #-.method call.
                            _create_loan_collateral_info(self.session_2,total_portfolio,loan_info)
                            return {"ERROR":"0","RESULT":"SUCCESS","DATA":[loan_info],"MESSAGE":"Loan request was successful."}
                        else:
                            return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You have loan request of "+str(has_queued_loan[1])+" pending approval."}
                    else:
                        return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You have an existing loan."}
                else:
                    return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You account has been suspended."}
            else:
                return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You are not a registered user."}
        except Exception as ex:
            raise HTTPException(**ex.__dict__)

    #-.get outstanding loan.
    @loan_router.get("/getCustomerOutstandingLoan/{msisdn}")
    async def outstanding_loan(self,msisdn: str):
        try:
            #-.check user account exist.
            account_exist = _account_exist(self.session_1,msisdn)
            #-.check account is suspended.
            is_account_suspended = _account_suspended(self.session_1,msisdn)
            if(int(account_exist) == 1):
                if(int(is_account_suspended) == 0):
                    #-.method call.
                    loan_info =  _get_customer_loan_arrears(self.session_2,msisdn)
                    return {"ERROR":"0","RESULT":"SUCCESS","MESSAGE":"OUTSTANDING BAL#" + str(loan_info[1]) + ""}
                else:
                    return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You account has been suspended."}
            else:
                return {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You are not a registered user."}
        except Exception as ex:
            raise HTTPException(**ex.__dict__)
