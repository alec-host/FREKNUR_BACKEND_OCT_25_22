#!/usr/bin/env python27

import os
import sys
import json
import MySQLdb
import logging
import signal
import Queue
import requests

from urllib import unquote
#--#from conn.LoanModel import LoanModel
from conn.wallet.WalletModel import WalletModel
from conn.sellGrain.SellGrainModel import SellGrainModel
from conn.purchaseGrain.PurchaseGrainModel import PurchaseGrainModel
from conn.dataGrid.DataGridModel import DataGridModel
from conn.customer.CustomerModel import CustomerModel
from conn.shop.ShopModel import ShopModel

#---from conn.sysConf.SysConfModel import SysConfModel

from conn.RedisHelper import RedisHelper
#from conn.DataGridModel import DataGridModel
from conn.db_helper import create_connection,close_connection,NoResultException
from conn.model import _read_redis_cache_api

from conn.helperUtils.JsonAddElement import JsonElementManager

#--loan_model =  LoanModel()
#wallet_model = WalletModel()
#purchase_grain_model = PurchaseGrainModel()
#sell_grain_model = SellGrainModel()


data_grid_model = DataGridModel()


customer_model = CustomerModel()

shop_model = ShopModel()

db = create_connection()

log = logging.getLogger()


try:
    content = json.loads(json.dumps({"msisdn":"254707132162","amount":"1"}))
    #content = json.loads(json.dumps({"msisdn":"254707132162","amount":"1000","collateral_percentage":"50p","has_collateral":"1"}))
    
    content = json.loads(json.dumps({"msisdn":"254707132162","amount":"1","beneficiary_msisdn":"2547AAA"}))

    #content['msisdn'],content['uid'],content['description'],content['price'],content['no_of_unit'],content['cost']
    content = json.loads(json.dumps({"msisdn":"2547071321602","uid":"20200","description":"AfricaTest","price":"5","no_of_unit":"1","cost":"5"}))

    content = json.loads(json.dumps({"search":"254707132162","lower_max": 10,"lower_min": 0,"code": "STMT"}))


    content = json.loads(json.dumps({"msisdn":"254707132162","lower_max": 0,"lower_min": 0}))


    content = json.loads(json.dumps({"msisdn":"2547xxx","grand_total":"1200","cart":[{"product_id":"123456","qty":"1","name":"Key Chain","price":"150"}]}))


    #result = loan_model._record_unsecured_loan_request_api(content,db)
    #result = loan_model._record_secured_loan_request_api(content,db)
    #result = wallet_model._record_withdraw_transaction_api(content,db)
    #result = wallet_model._peer_2_peer_wallet_transfer_api(content,db)
    #result = purchase_grain_model._record_purchase_request_api(content,db)
    #result = sell_grain_model._record_sell_request_api(content,db)

    #result = data_grid_model._get_customer_list_api(content,db)

    #result = customer_model._get_mini_loan_statement_api("254707132162",db)

    #result = data_grid_model._get_general_account_list_api(content,db)
    
    #-result = loan_model._del_processed_loan_request_sys("254707132162",db)


    #-result = data_grid_model._shop_inventory_list_api(content,db)
    #redis_helper = RedisHelper()
    #rd = redis_helper.create_redis_connection()
    #---.print(redis_helper.redis_access_key())
    #-.key = redis_access_key()[3]+str("254707132162")
    #-.read cache.
    #-.result = _read_redis_cache_api(key,rd)

    #-.publish.
    #---redis_helper._publish_redis("test_obj","This is a test message.22222222222222222222",rd)

    #print(obj_msg.get_message()['data'])

    #msg = obj_msg.get_message()

    #print(obj_msg.get_message())

    #print(obj_msg.get_message()['data'])

    #obj_msg.unsubscribe()

    #result = shop_model._record_shop_sale_api(content,db)
    
    #content = {"msisdn": "254707132162"}
    #result = customer_model._get_customer_portfolio_api(content,db)

    #result = loan_model._get_loan_arrears_api("254707132162z",db)

    content = {"message": [{"sms": "test 1"}, {"sms": "test 2"}, {"sms": "test 222222"}]}
    #json_element_manager = JsonElementManager()

    #add_element = "test 1234567890"
    #result = json_element_manager._append_nth_element(content,add_element)
    
    #print(result)

    #result = json_element_manager._append_1st_element(add_element)

    #content = {"id": "12345678", "user": "admin", "mobile": "254707132162", "notes": "hello world", "head": "approval_operation"}

    #result = loan_model._vet_loan_request_api(content,db)


    #sys_conf_model = SysConfModel()
    
    #result = sys_conf_model._get_asset_config_params_api(db)

    #----content = {"msisdn": "254707132162", "is_owner": "0"}

    #----result = sell_grain_model._get_sale_request_list_api(content,db)
    content = {"msisdn": "254707132162","amount":"1.5"}

    #result = customer_model._get_customer_balance_api(content,db)

    #content = {"msisdn":"254707132162"}
    #----content = {"msisdn": "254707132162","passwd":"aaaaa"}

    #----result = customer_model._registration_api(content,db)
    #----shop_model._compute_stats_api("tbl_loan_stats","1",db)
    #result = shop_model._get_dashboard_stats_api("tbl_loan_stats","d",db)
    #----result = shop_model._compute_stats_api("tbl_loan_stats","1",db)
    #-_record_stats_api(self,table_name,stat_count,total,conn)
    #--.content = {"table":"tbl_approved_loan_stats","count":"1","total":"500"}
    #--.result = shop_model._record_stats_api(content,db)
    #--.print(result)

    content = (({"message":"test message from freknur","broadcast_date":"2022-08-10 12:47:24"}))
    result = shop_model._add_fcm_broadcast_api(content,db)
    #content = {"msisdn": "4915224043369"}
    #result = customer_model._get_customer_portfolio_api(content,db):
    print(result)
except MySQLdb.Error, e:
    log.error(e)
except Exception, e:
    log.error(e)
finally:
    try:
        if(not db):
            exit(0)
        else:
            close_connection(db)
    except MySQLdb.Error, e:
        log.error(e)
