#!/usr/bin/python
  
"""
developer skype: alec_host
"""

import os
import sys
import json
import decimal
import logging
import MySQLdb
import MySQLdb.cursors

from datetime import datetime

sys.path.append('/usr/local/lib/freknur/engine/conn')
from Utils import Utils

from db_helper import _get_user_db,_get_uid_db,_get_porfolio_temp_size_db
from configs.freknur_settings import logger,mysql_params
from db_conn import DB,NoResultException

db = DB()

class CustomerDbHelper():

    """
    -=================================================
    -.create new customer.
    -=================================================
    """
    def _registration_db(self,content,conn):

        date   = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        uid    = content.uid
        msisdn = content.msisdn
        passwd = content.password

        try:
            qry = """
                  INSERT
                  INTO
                 `db_freknur_loan`.`tbl_wallet`
                  (`uid`,`msisdn`,`password`,`date_created`)
                  VALUES
                  ('%s','%s','%s','%s')
                  ON
                  DUPLICATE
                  KEY UPDATE `date_modified` = '%s' """ % (uid,msisdn,passwd,date,date)

            params = ()
                
            db.execute_query(conn, qry, params)

            conn.commit()
        except Exception, e:
            logger.error(e)
            raise

    """
    -=================================================
    -.get customer statement.
    -=================================================
    """
    def _get_comprehensive_wallet_statement_db(self,content,conn,limit=1000):
        
        is_archived = 0
        j_string = None
        msisdn   = content.msisdn

        utils = Utils()

        try:
            qry = """
                  SELECT
                 `reference_no` AS Receipt_No,CONCAT("",`date_created`,"") AS Transaction_Date,`narration` AS Details, ROUND(`cr`,2) AS CR,ROUND(`dr`,2) AS DR, ROUND(`balance`,2) AS Balance
                  FROM
                 `db_freknur_loan`.`tbl_wallet_transaction`
                  WHERE
                 `is_archived` = %s AND `msisdn` = %s
                  ORDER BY `date_created` DESC
                  LIMIT %s
                  """
                  
            params = (is_archived,msisdn,limit)
            
            recordset = db.retrieve_all_data_params(conn,qry,params)
            
            if(len(recordset) == 0):
                j_string = json.dumps({"ERROR":"1","RESULT":"FAIL","DATA":recordset,"MESSAGE":"No statement"})
            else:
                j_string = json.dumps({"ERROR":"0","RESULT":"SUCCESS","DATA":recordset,"MESSAGE":"User has a statement"},default=utils.decimal_default)
        except Exception, e:
            logger.error(e)
            raise
        
        return j_string


    """
    -=================================================
    -.get mini loan statement.
    -=================================================
    """
    def _get_mini_loan_statement_db(self,content,conn,limit=1000):

        is_archived = 0
        j_string = None
        search_1 = 'LNR-%'
        search_2 = 'LNRE-%'
        msisdn   = content.msisdn

        utils = Utils()

        try:
            qry = """
                  SELECT
                 `reference_no` AS Receipt_No,CONCAT("",`date_created`,"") AS Transaction_Date,`narration` AS Details,`cr` AS CR,`dr` AS DR,`balance` AS Balance
                  FROM
                 `tbl_wallet_transaction`
                  WHERE
                  (`reference_no` LIKE %s OR `reference_no` LIKE %s) AND `is_archived` = %s AND `msisdn` = %s
                  ORDER BY `date_created` DESC
                  LIMIT %s
                  """

            params = (("%%" + search_1 + "%%"),("%%" + search_2 + "%%"),is_archived,msisdn,limit)

            recordset = db.retrieve_all_data_params(conn,qry,params)

            if(len(recordset) == 0):
                j_string = json.dumps({"ERROR":"1","RESULT":"FAIL","DATA":recordset,"MESSAGE":"No statement"})
            else:
                j_string = json.dumps({"ERROR":"0","RESULT":"SUCCESS","DATA":recordset,"MESSAGE":"User has a loan mini statement"},default=utils.decimal_default)
        except Exception,e:
            logger.error(e)
            raise
        
        return j_string


    """
    -=================================================
    -.get mini asset statement.
    -=================================================
    """
    def _get_mini_asset_statement_db(self,content,conn,limit=1000):

        is_archived  = 0
        j_string = None
        search_1 = 'GRN%'
        search_2 = 'BID%'

        msisdn   = content.msisdn

        utils = Utils()

        try:
            qry = """
                  SELECT
                 `reference_no` AS Receipt_No,CONCAT("",`date_created`,"") AS Transaction_Date,`narration` AS Details,`cr` AS CR,`dr` AS DR,`balance` AS Balance
                  FROM
                 `tbl_wallet_transaction`
                  WHERE
                  (`reference_no` LIKE %s OR `reference_no` LIKE %s) AND `is_archived` = %s AND `msisdn` = %s
                  ORDER BY `date_created` DESC
                  LIMIT %s
                  """

            params = (("%%" + search_1 + "%%"),("%%" + search_2 + "%%"),is_archived,msisdn,limit)

            recordset = db.retrieve_all_data_params(conn,qry,params)

            if(len(recordset) == 0):
                j_string = json.dumps({"ERROR":"1","RESULT":"FAIL","DATA":recordset,"MESSAGE":"No statement"})
            else:
                j_string = json.dumps({"ERROR":"0","RESULT":"SUCCESS","DATA":recordset,"MESSAGE":"User has an asset mini statement"},default=utils.decimal_default)

        except Exception,e:
            logger.error(e)
            raise

        return j_string


    """
    -=================================================
    -.get customer wallet balance.
    -=================================================
    """
    def _get_customer_balance_db(self,content,conn):

        balance    = 0.00
        reference  = 0
        loan_limit = 0
        msisdn     = content.msisdn
        due_date   = "0000-00-00"

        try:
            qry = """
                  SELECT
                  IFNULL(`balance`,'0') AS balance,IFNULL(`reference_no`,'0') AS reference_no,loan_limit
                  FROM
                 `tbl_wallet`
                  WHERE
                 `is_active` = '1' AND `is_suspended` = '0' AND `msisdn` = '%s'
                  """ % (msisdn)

            params = ()

            recordset = db.retrieve_all_data_params(conn,qry,params)
            
            for data in recordset:
                balance    = data['balance']
                reference  = data['reference_no']
                loan_limit = data['loan_limit']

        except Exception,e:
            logger.error(e) 
            raise
        
        return balance,reference,loan_limit,due_date

    
    """
    -=================================================
    -.get date due.
    -=================================================
    """
    def _get_loan_due_date_db(self,reference_no,msisdn,conn):

        due_date = "0000-00-00"
        try:
            qry = """
                  SELECT
                 `expected_repayment_date`
                  FROM
                 `db_freknur_loan`.`tbl_debtor`
                  WHERE
                 `is_repaid` = '0' AND `reference_no` = '%s' AND `msisdn` = '%s'
                  """ % (reference_no,msisdn)

            params = ()

            recordset = db.retrieve_all_data_params(conn,qry,params)

            for data in recordset:
                due_date = data['expected_repayment_date']
        except Exception,e:
            logger.error(e)
            raise

        return due_date


    """
    -=================================================
    -.method: shop inventory list.
    -=================================================
    """
    def _shop_inventory_list_db(self,this,conn,limit=1000):

        is_available = 0
        j_string = None

        msisdn = this.msisdn

        utils = Utils()

        try:
            sql = """
                  SELECT
                 `item_uid`,`item_name`,`item_image`,`qty_in` AS qty,CONCAT("",`unit_price`,"") AS unit_price,CONCAT("",`date_created`,"") AS date_created
                  FROM
                 `db_freknur_inventory`.`tbl_inventory`
                  WHERE
                 `qty_in` > 0 AND `is_available` = %s
                  ORDER BY `date_created` DESC
                  LIMIT %s
                  """

            params = (is_available,limit,)

            recordset = db.retrieve_all_data_params(conn,sql,params)

            if(len(recordset) == 0):
                j_string = json.dumps({"ERROR":"1","RESULT":"FAIL","DATA":recordset,"MESSAGE":"Empty shop list"})
            else:
                j_string = json.dumps({"ERROR":"0","RESULT":"SUCCESS","DATA":recordset,"MESSAGE":"Shop list is available."},default=utils.decimal_default)
        except Exception, e:
            logger.error(e)
            raise

        return j_string


    """
    -=================================================
    -.get customer portfolio..
    -=================================================
    """
    def _get_customer_portfolio_db(self,this,conn,limit=1000):

        j_string = None
        
        utils = Utils()

        msisdn = this.msisdn

        cnt = _get_porfolio_temp_size_db(msisdn,conn)

        try:
            if(int(cnt) == 0):
                sql = """
                      SELECT
                     `msisdn`,`asset_id` AS uid,`asset_acronym` AS name,`number_of_asset`,(SELECT `unit_price` FROM `db_freknur_investment`.`tbl_asset` WHERE `uid` = asset_id) AS unit_price,'0' AS has_secured_loan,CONCAT("",`date_created`,"") AS purchase_date 
                      FROM 
                     `db_freknur_investment`.`tbl_owner_portfolio` 
                      WHERE 
                     `msisdn` = %s AND `lock` = 0             
                      LIMIT %s
                      """
            else:
                sql = """
                      SELECT
                     `msisdn`,`asset_id` AS uid,`asset_acronym` AS name,`number_of_asset`,(SELECT `unit_price` FROM `db_freknur_investment`.`tbl_asset` WHERE `uid` = asset_id) AS unit_price,'1' AS has_secured_loan,CONCAT("",`date_created`,"") AS purchase_date 
                      FROM 
                     `db_freknur_investment`.`tbl_owner_portfolio_temp_list`
                      WHERE 
                     `msisdn` = %s AND `lock` = 0             
                      LIMIT %s
                      """
        
            params = (msisdn,limit,)
            
            recordset = db.retrieve_all_data_params(conn,sql,params)
            
            if(len(recordset) == 0):
                j_string = json.dumps({"ERROR":"1","RESULT":"FAIL","DATA":recordset,"MESSAGE":"User has no investments"},default=utils.decimal_default)
            else:
                j_string = json.dumps({"ERROR":"0","RESULT":"SUCCESS","DATA":recordset,"MESSAGE":"User has investments"},default=utils.decimal_default)
        except Exception,e:
            logger.error(e)
            raise

        return j_string    
