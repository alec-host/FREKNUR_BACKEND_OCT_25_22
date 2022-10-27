#!/usr/bin/python
  
"""
developer skype: alec_host
"""

import os
import sys
import json
import logging
import MySQLdb
import MySQLdb.cursors

from datetime import datetime

sys.path.append('/usr/local/lib/freknur/engine/conn')
from db_helper import _get_last_insert_id_db,_acitivity_log_db
from configs.freknur_settings import logger,mysql_params
from db_conn import DB,NoResultException

db = DB()

class PurchaseGrainDbHelper():

    """
    -=================================================
    -.new asset purchase request (trade).
    -=================================================
    """
    def _record_purchase_request_db(self,this,conn):

        j_string = None
        date = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        
        uid = this.uid
        msisdn = this.msisdn
        asset_name = this.asset_name 
        price = this.price
        qty = this.qty
        total_cost = this.total_cost
        activity =  this.activity

        try:
            qry = """
                  INSERT
                  INTO
                 `db_freknur_investment`.`tbl_purchase_request`
                  (`msisdn`,`uid`,`description`,`unit_price`,`no_of_grain_purchased`,`cost`,`date_created`)
                  VALUES
                  ('%s','%s','%s','%s','%s','%s','%s')
                  """ % (msisdn,uid,asset_name,price,qty,total_cost,date)

            params = ()
            db.execute_query(conn, qry, params)
            conn.commit()

            j_string = _get_last_insert_id_db(conn)

        except Exception, e:
            logger.error(e)
            raise

        return j_string


    """
    -=================================================
    -.new asset purchase request (market).
    -=================================================
    """
    def _record_alt_purchase_request_db(self,this,conn):

        j_string = None
        date = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

        uid = this.uid
        msisdn = this.msisdn
        asset_name = this.asset_name
        price = this.price
        qty = this.qty
        total_cost = this.total_cost
        activity =  this.activity

        try:
            qry = """
                  INSERT
                  INTO
                 `db_freknur_investment`.`tbl_alternate_market_bid`
                  (`asset_id`,`msisdn`,`asset_name`,`unit_price`,`qty`,`cost`,`date_created`)
                  VALUES
                  ('%s','%s','%s','%s','%s','%s','%s')
                  """ % (uid,msisdn,asset_name,price,qty,total_cost,date)

            params = ()
            db.execute_query(conn, qry, params)
            conn.commit()

            j_string = _get_last_insert_id_db(conn)

        except Exception, e:
            logger.error(e)
            raise

        return j_string


    """
    -=================================================
    -.handle processing of alt purchase request (market).
    -=================================================
    """
    def _handle_processing_alt_purchase_request_db(self,this,current_wallet_bal,fee_earned,conn):

        j_string = None
        date = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        
        uid = this.uid
        msisdn = this.msisdn
        asset_name = this.asset_name
        price = this.price
        qty = this.qty
        total_cost = this.total_cost
        activity =  this.activity

        try:
            sql = """CALL `db_freknur_investment`.`sProcHandlePurchaseRequestFromAltMarket`(%s,%s,%s,%s,%s,%s,%s,%s)"""

            params = (msisdn,qty,asset_name,uid,price,current_wallet_bal,total_cost,fee_earned,)
            output = db.retrieve_all_data_params(conn,sql,params)

            for data in output:
                j_string = json.loads(data.get('_JSON'))
                #-.routine call.
                _acitivity_log_db(msisdn,activity,conn)

            #conn.commit()

        except Exception, e:
            logger.error(e)
            raise

        return j_string
