#!/usr/bin/python
  
"""
developer skype: alec_host
"""

import os
import sys

import Loan
import LoanApproval

sys.path.append('/usr/local/lib/freknur/engine/conn')
from db_helper import _get_user_db,_is_wallet_suspended_db,_get_loan_ref_no_db
from LoanDbHelper import LoanDbHelper
from configs.freknur_settings import loan_params

from shop.ShopModel import ShopModel

class LoanModel():
    """
    -=================================================
    -.record new unsecured loan request.
    -=================================================
    """
    def  _record_unsecured_loan_request_api(self,content,conn):
        loan_db_helper = LoanDbHelper()
        #-.routine call.
        has_loan = loan_db_helper._has_existing_loan_db(content['msisdn'],conn)
        #-.routine call.
        loan_uid = str(loan_db_helper._generate_loan_uid_db(conn)).upper()
        #-.routine call.
        user_exist = _get_user_db(content['msisdn'],conn)
        #-.routine call.
        is_wallet_suspended = _is_wallet_suspended_db(content['msisdn'],conn)
        #-.routine call.
        has_queued_request = loan_db_helper._has_queued_loan_request_db(content['msisdn'],conn)

        min_allowed_loan = int(loan_params['min_loan'])
        max_allowed_loan = int(loan_params['max_loan'])

        if(int(user_exist) == 1):
            if(int(is_wallet_suspended) == 0):
                if(int(has_loan) == 0):
                    if(int(has_queued_request[0]) == 0):
                        if(int(content['amount']) >= min_allowed_loan and int(content['amount']) <= max_allowed_loan):
                            #-.routine call.
                            loan_db_helper._record_unsecured_loan_request_db(Loan.Loan(loan_uid,content['msisdn'],content['amount'],0,0),conn)
                            #-.payload.
                            payload = {"table":"tbl_loan_stats","count":"1","total":str(content['amount'])}
                            #-.routine call.
                            shop_model = ShopModel()
                            shop_model._record_stats_api(payload,conn)

                            j_string = {"ERROR":"0","RESULT":"SUCCESS","MESSAGE":"Loan request was successful."}
                        else:
                            j_string = {"ERROR":"1","RESULT":"FAIL","MESSAGE":"Loan limits: MINIMUM : "+str(min_allowed_loan)+" MAXIMUM : "+str(max_allowed_loan)}
                    else:
                        j_string = {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You have loan request of "+str(has_queued_request[1])+" pending approval."}
                else:
                    j_string = {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You have an existing loan."}
            else:
                j_string = {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You account has been suspended."}
        else:
            j_string = {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You are not a registered user."}

        return j_string


    """
    -=================================================
    -.record new secured loan request.
    -=================================================
    """
    def  _record_secured_loan_request_api(self,content,conn):
        loan_db_helper = LoanDbHelper()
        #-.routine call.
        collateral_amount = loan_db_helper._get_customer_porfolio_worth_db(content['msisdn'],conn)
        #-.routine call.
        has_loan = loan_db_helper._has_existing_loan_db(content['msisdn'],conn)
        #-.routine call.
        loan_uid = loan_db_helper._generate_loan_uid_db(conn)
        #-.routine call.
        user_exist = _get_user_db(content['msisdn'],conn)
        #-.routine call.
        is_wallet_suspended = _is_wallet_suspended_db(content['msisdn'],conn)
        #-.routine call.
        has_queued_request = loan_db_helper._has_queued_loan_request_db(content['msisdn'],conn)

        min_allowed_loan = int(loan_params['min_loan'])
        max_allowed_loan = int(loan_params['max_loan'])

        if(int(user_exist) == 1):
            if(int(is_wallet_suspended) == 0):
                if(int(has_loan) == 0):
                    if(int(has_queued_request[0]) == 0):
                        if(int(content['amount']) >= min_allowed_loan and int(content['amount']) <= max_allowed_loan):
                            collateral_size = str(float(str(content['collateral_percentage']).replace("p",""))/100)
                            #-.routine call.
                            loan_db_helper._record_secured_loan_request_db(Loan.Loan(loan_uid,content['msisdn'],content['amount'],collateral_size,content['has_collateral']),conn)
                            #-.routine call.
                            loan_db_helper._lock_customer_asset_portfolio(content['msisdn'],conn)
                            #-.routine call.
                            loan_db_helper._log_customer_collateral_info_db(Loan.Loan(loan_uid,content['msisdn'],content['amount'],collateral_size,content['has_collateral']),collateral_amount,conn)
                            #-.payload.
                            payload = {"table":"tbl_loan_stats","count":"1","total":str(content['amount'])}
                            #-.routine call.
                            shop_model = ShopModel()
                            shop_model._record_stats_api(payload,conn)

                            j_string = {"ERROR":"0","RESULT":"SUCCESS","MESSAGE":"Loan request was successful."}
                        else:
                            j_string = {"ERROR":"1","RESULT":"FAIL","MESSAGE":"Loan limits: MINIMUM : "+str(min_allowed_loan)+" MAXIMUM : "+str(max_allowed_loan)}
                    else:
                        j_string = {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You have loan request of "+str(has_queued_request[1])+" pending approval."}
                else:
                    j_string = {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You have an existing loan."}
            else:
                j_string = {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You account has been suspended."}
        else:
            j_string = {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You are not a registered user."}

        return j_string



    """
    -=================================================
    -.method: screen a loan request.
    -=================================================
    """
    def _vet_loan_request_api(self,content,conn):
        
        j_string = {"ERROR":"1"}

        loan_db_helper = LoanDbHelper()

        if(str(content["head"]) == 'approval_operation'):
            if(content["id"] != '' or content["id"] is not None):
                #-.routine call.
                has_loan_request = _get_loan_ref_no_db(content["id"],conn)
            
                if(int(has_loan_request) == 1):
                    if(content["id"].strip() != '' and content["user"].strip() != '' and content["mobile"].strip() != '' and content["notes"].strip() != '' and content["head"].strip() != ''):
                        #-.routine call.
                        loan_db_helper._vet_loan_request_db(LoanApproval.LoanApproval(content["id"],content["user"],content["mobile"],content["notes"],content["head"]),conn)
                        #-.routine call.
                        shop_model = ShopModel()
                        shop_model._record_stats_api(content,conn)
                
                        j_string = {"ERROR":"0","RESULT":"SUCCESS","MESSAGE":"Loan approval successful."}
                    else:
                        j_string = {"ERROR":"1","RESULT":"FAIL","MESSAGE":"Action cannot be completed."}
                else:
                    j_string = {"ERROR":"1","RESULT":"FAIL","MESSEGE":"Have an existing loan."}
            else:
                j_string = {"ERROR":"1","RESULT":"FAIL","MESSAGE":"Action cannot be completed."}
        else:
            if(content["id"].strip() != '' and  content["user"].strip() != '' and content["mobile"].strip() != '' and content["notes"].strip() != '' and content["head"].strip() != ''):
                #-.routine call.
                j_string = loan_db_helper._log_rejected_loan_request_db(LoanApproval.LoanApproval(content["id"],content["user"],content["mobile"],content["notes"],content["head"]),conn)
                #-.routine call.
                shop_model = ShopModel()
                shop_model._record_stats_api(content,conn)
            else:
                j_string = {"ERROR":"1","RESULT":"FAIL","MESSAGE":"Action cannot be completed."}

        return j_string



    """
    -=================================================
    -.delete processed loan request.
    -=================================================
    """
    def _del_processed_loan_request_sys(self,msisdn,conn):

        loan_db_helper = LoanDbHelper()
        #-.routine call.
        user_exist = _get_user_db(msisdn,conn)

        if(int(user_exist) == 1):
            #-.routine call.
            loan_db_helper._del_processed_loan_request_db(msisdn,conn)

            j_string = {"ERROR":"0","RESULT":"SUCCESS","MESSAGE":"Clean up successful."}
        else:
            j_string = {"ERROR":"1","RESULT":"FAIL","MESSAGE":"You have an existing loan."}

        return j_string


    """
    -=================================================
    -.method: customer loan arrears.
    -=================================================
    """
    def _get_loan_arrears_api(self,msisdn,conn):
        
        loan_db_helper = LoanDbHelper()
        loan_amount = 0.00
        due_date    = "0000-00-00"
        loan_limit  = 0.00
        #-.routine call.
        user_exist = _get_user_db(msisdn,conn)
        
        max_allowed_loan = int(loan_params['max_loan'])

        if(int(user_exist) == 1):
            #-.routine call.
            loan_amount = loan_db_helper._get_loan_arrears_db(msisdn,conn)
            due_date    = loan_db_helper._get_loan_due_date_db(msisdn,conn)
            loan_limit  = loan_db_helper._get_loan_limit_db(msisdn,conn)

            if(int(loan_limit) == 0):
                loan_limit = max_allowed_loan
            else:
                loan_limit = loan_limit

            if(int(float(loan_amount)) == 0):
                j_string = {"ERROR":"1","RESULT":"SUCCESS","DATA":{"OUTSTANDING_LOAN":str(loan_amount),"DUE_DATE":str(due_date),"LIMIT":str(loan_limit)},"MESSAGE":"DO NOT HAVE A LOAN"}
            else:
                j_string = {"ERROR":"0","RESULT":"SUCCESS","DATA":{"OUTSTANDING_LOAN":str(loan_amount),"DUE_DATE":str(due_date),"LIMIT":str(loan_limit)},"MESSAGE":"OUTSTANDING BAL#" + str(loan_amount) + ""}
        else:
            j_string = {"ERROR":"1","RESULT":"SUCCESS","DATA":{"OUTSTANDING_LOAN":str(loan_amount),"DUE_DATE":str(due_date),"LIMIT":str(loan_limit)},"MESSAGE":"You are not a registered user."}

        return j_string
