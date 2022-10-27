#!/usr/bin/python2
  
import os
import re
import sys
import json
import MySQLdb
import logging
import signal
import Queue
import decimal

from conn.model import _read_purchase_request_queue_sys,_get_asset_master_sys,_get_customer_bal_sys,_book_keeping_sys,\
                       _get_handling_fee_sys,_acitivity_log_sys,_delete_from_redis_cache_api
from conn.db_helper import create_connection,close_connection,create_redis_connection,NoResultException,redis_access_key
from conn.configs.freknur_settings import loan_params

log = logging.getLogger()


def handlePurchaseAssetRequest():
    try:
        while True:
            db = create_connection()
            rd = create_redis_connection()
            """
             -.get loan request list.
            """
            items = json.loads(_read_purchase_request_queue_sys(db))
            """
            -.loop through each in the list
            """
            if(len(items) > 0):
                """
                -.routine call.
                """
                fee,lower,upper,markup,offer = _get_handling_fee_sys(db)
                print(fee,lower,upper,markup,offer)
                for item in items:
                    uid    = str(item['uid'])
                    msisdn = str(item['msisdn'])
                    name   = str(item['description'])
                    price  = float(item['unit_price'])
                    qty    = float(item['no_of_grain_purchased'])
                    cost   = float(item['cost'])
                    """
                    -.get key.
                    """
                    key_1 = redis_access_key()[0]+str(msisdn)
                    key_2 = redis_access_key()[1]+str(msisdn)
                    key_3 = redis_access_key()[4]+str(msisdn)
                    """
                    -.routine call.
                    """
                    asset_data = _get_asset_master_sys(uid,db)
                    """
                    -.calc fee.
                    """
                    handling_fee = (decimal.Decimal(asset_data[0]) * decimal.Decimal(qty)) * markup
                    """
                    -.routine call.
                    """
                    bal,ref = _get_customer_bal_sys(msisdn,db)
                    """
                    -.calc wallet bal.
                    """
                    wallet_bal = float(bal) - float(cost)
                    """
                    -.reset cache.
                    """
                    _delete_from_redis_cache_api(key_1,rd)
                    _delete_from_redis_cache_api(key_2,rd)
                    _delete_from_redis_cache_api(key_3,rd)
                    """
                    -.check uid.
                    """
                    if(uid is not None):
                        """
                        -.perform book keeping.
                        """
                        print(msisdn,uid,name,price,qty,round(wallet_bal,8),cost,float(handling_fee))
                        result = _book_keeping_sys(msisdn,uid,name,price,qty,round(wallet_bal,8),cost,float(handling_fee),db)
                        print(result)
                    else:
                        pass
            """
            .-close connection.
            """
            #if(db):
                #close_connection(db)                        
    except MySQLdb.Error, e:
        log.error(e)
    except Exception, e:
        log.error(e)
    finally:
        try:
            if(not db):
                exit(0)
            else:
                """
                close connection.
                """
                if(db is not None):
                    close_connection(db)
        except MySQLdb.Error, e:
            log.error(e)

"""
-.main method.
"""
if __name__ == '__main__':
    try:
        handlePurchaseAssetRequest()
    except KeyboardInterrupt:
        exit(0)
