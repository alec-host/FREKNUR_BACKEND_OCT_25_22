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
from RedisHelper import RedisHelper
from configs.freknur_settings import logger,mysql_params
from db_conn import DB,NoResultException

db = DB()

class LoanDbHelper():
    """
    -=================================================
    -.record new loan request.
    -=================================================
    """
    def _record_unsecured_loan_request_db(self,params,conn):
        
        date     = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        loan_uid = params.uid
        msisdn   = params.msisdn
        amount   = params.amount
        
        try:
            sql = """INSERT
                     INTO
                    `db_freknur_loan`.`tbl_loan_request`
                     (`msisdn`,`reference_no`,`amount`,`requested_by`,`date_created`)
                     VALUES
                     ('%s','%s','%s','%s','%s')
                     ON 
                     DUPLICATE KEY
                     UPDATE `date_modified` = '%s' """ % (msisdn,loan_uid,amount,msisdn,date,date)               

            params = ()

            db.execute_query(conn, sql, params)

            conn.commit()

            redis_helper = RedisHelper()

            rd = redis_helper.create_redis_connection()
            #-.get keys.
            key_1 = redis_helper.redis_access_key()[0]+str(msisdn)
            key_2 = redis_helper.redis_access_key()[1]+str(msisdn)
            key_3 = redis_helper.redis_access_key()[3]+str(msisdn)
            #-.reset cache.
            redis_helper._delete_from_redis_cache(key_1,rd)
            redis_helper._delete_from_redis_cache(key_2,rd)
            redis_helper._delete_from_redis_cache(key_3,rd)
        except Exception, e:
            logger.error(e)
            raise


    """
    -=================================================
    -.record new loan request.
    -=================================================
    """
    def _record_secured_loan_request_db(self,params,conn):

        date = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        loan_uid = params.uid
        msisdn   = params.msisdn
        amount   = params.amount
        collateral_size = params.collateral_size
        has_collateral  = params.has_collateral

        try:
            sql = """INSERT
                     INTO
                    `db_freknur_loan`.`tbl_loan_request`
                     (`msisdn`,`reference_no`,`amount`,`collateral_percentage`,`requested_by`,`date_created`,`has_collateral`)
                     VALUES
                     ('%s','%s','%s','%s','%s','%s','%s')
                     ON
                     DUPLICATE KEY
                     UPDATE `date_modified` = '%s' """ % (msisdn,loan_uid,amount,float(collateral_size),msisdn,date,has_collateral,date)

            params = ()

            db.execute_query(conn, sql, params)

            conn.commit()

            redis_helper = RedisHelper()

            rd = redis_helper.create_redis_connection()
            #-.get keys.
            key_1 = redis_helper.redis_access_key()[0]+str(msisdn)
            key_2 = redis_helper.redis_access_key()[1]+str(msisdn)
            key_3 = redis_helper.redis_access_key()[3]+str(msisdn)
            #-.reset cache.
            redis_helper._delete_from_redis_cache(key_1,rd)
            redis_helper._delete_from_redis_cache(key_2,rd)
            redis_helper._delete_from_redis_cache(key_3,rd)
        except Exception, e: 
            logger.error(e)
            raise


    """
    -=================================================
    -.method: check if customer has a loan.
    -=================================================
    """
    def _has_existing_loan_db(self,msisdn,conn):
        has_loan = 0
        try:
            sql = """SELECT COUNT(`msisdn`) AS has_loan FROM `db_freknur_general`.`tbl_loan_temp_list` WHERE `msisdn` = %s """
        
            param = (msisdn,)
        
            output = db.retrieve_all_data_params(conn,sql,param)
        
            for data in output:
                has_loan = data['has_loan']
        except Exception, e:
            logger.error(e)
            raise
        
        return has_loan


    """
    -=================================================
    -.method: get customer collateral worth.
    -=================================================
    """
    def _get_customer_porfolio_worth_db(self,msisdn,conn):
        total=0
        try:
            sql = """
                  SELECT SUM(`number_of_asset` * (SELECT `unit_price` FROM `db_freknur_investment`.`tbl_asset` WHERE `uid` = `asset_id`)) AS total
                  FROM
                 `db_freknur_investment`.`tbl_owner_portfolio`
                  WHERE
                 `msisdn` = %s AND `lock` = 0
                  """
            params = (msisdn,)
        
            recordset = db.retrieve_all_data_params(conn,sql,params)
        
            for record in recordset:
                total = record['total']

        except Exception, e:
            logger.error(e)
            raise

        return total


    """
    -=================================================
    -.method:generate loan uid.
    -=================================================
    """
    def _generate_loan_uid_db(self,conn):
        loan_uid = 0
        j_string = None
        try:
            sql = """
                  SELECT
                  CONCAT(CHAR(ROUND(RAND()*25)+97),
                  CHAR(ROUND(RAND()*25)+97),
                  ROUND((RAND()*9)),
                  CHAR(ROUND(RAND()*25)+97),
                  CHAR(ROUND(RAND()*25)+97),
                  CHAR(ROUND(RAND()*25)+97),
                  ROUND((RAND()*9)),
                  CHAR(ROUND(RAND()*25)+97),
                  CHAR(ROUND(RAND()*25)+97),
                  CHAR(ROUND(RAND()*25)+97)) AS loan_uid
                  FROM
                  dual
                  """
            params = ()
            output = db.retrieve_all_data_params(conn,sql,params)
        
            for data in output:
                loan_uid = 'LNR-'+data['loan_uid']
            
            conn.commit()
        except Exception, e:
            logger.error(e)
            raise
    
        return loan_uid


    """
    -=================================================
    -.method: has a queued loan request.
    -=================================================
    """
    def _has_queued_loan_request_db(self,msisdn,conn):
        size = 0
        amt  = 0
        try:

            sql = """SELECT COUNT(`id`) AS CNT,`amount` FROM `db_freknur_loan`.`tbl_loan_request` WHERE `msisdn` = %s AND `is_processed` = 0 """

            param = (msisdn,)
            output = db.retrieve_all_data_params(conn,sql,param)
        
            for data in output:
                size = data['CNT']
                amt  = data['amount']
        except Exception, e:
            logger.error(e)
            raise
    
        return [size,amt]


    """
    -=================================================
    -.method: log collateral information.
    -=================================================
    """
    def _log_customer_collateral_info_db(self,params,portfolio_worth,conn):
        msisdn  = params.msisdn
        loan_amount = params.amount
        collateral_size = float(params.collateral_size)
        try:
            sql = """INSERT
                     INTO
                    `db_freknur_general`.`tbl_loan_collateral`
                     (`msisdn`,`loan_amount`,`portfolio_worth`,`collateral_percentage`)
                     VALUES
                     ('%s','%s','%s','%s')
                     ON
                     DUPLICATE KEY
                     UPDATE `is_processed` = 0 """ % (msisdn,loan_amount,portfolio_worth,collateral_size)
        
            params = ()
            db.execute_query(conn, sql, params)
            conn.commit()
        except Exception, e:
            logger.error(e)
            raise


    """
    -=================================================
    -.lock asset committed to a loan.
    -=================================================
    """
    def _lock_customer_asset_portfolio(self,msisdn,conn):
        try:
            sql = """UPDATE `db_freknur_investment`.`tbl_owner_portfolio` SET  `lock` = 1 WHERE `msisdn` = '%s' AND `lock` = 0 """ % (msisdn)
        
            params = ()
        
            db.execute_query(conn, sql, params)
        
            conn.commit()
        except Exception, e:
            logger.error(e)
            raise


    """
    -=================================================
    -.delete processed loan request.
    -=================================================
    """
    def _del_processed_loan_request_db(self,msisdn,conn):
        try:
            sql = """DELETE FROM `db_freknur_loan`.`tbl_loan_request` WHERE `msisdn` = '%s' AND `is_processed` = 1 """ % (msisdn)

            params = ()

            db.execute_query(conn, sql, params)

            conn.commit()
        except Exception, e:
            logger.error(e)
            raise


    """
    -=================================================
    -.loan arrear amount.
    -=================================================
    """
    def _get_loan_arrears_db(self,msisdn,conn):
        loan_amount = 0.00
        try:

            sql = """
                  SELECT
                 `msisdn`,`loan_amount`
                  FROM
                 `db_freknur_general`.`tbl_loan_temp_list`
                  WHERE
                 `msisdn` = %s
                  """
            params = (msisdn,)
            output = db.retrieve_all_data_params(conn,sql,params)
            
            for data in output:
                loan_amount = data['loan_amount']
        except Exception,e:
            logger.error(e)
            raise

        return loan_amount


    """
    -=================================================
    -.get date due.
    -=================================================
    """
    def _get_loan_due_date_db(self,msisdn,conn):

        due_date = "0000-00-00"
        try:
            qry = """
                  SELECT
                 `expected_repayment_date`
                  FROM
                 `db_freknur_loan`.`tbl_debtor`
                  WHERE
                 `is_repaid` = '0' AND `msisdn` = '%s'
                  """ % (msisdn,)

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
    -.get loan limit.
    -=================================================
    """
    def _get_loan_limit_db(self,msisdn,conn):

        loan_limit = "0"
        try:
            qry = """
                  SELECT
                 `loan_limit`
                  FROM
                 `db_freknur_loan`.`tbl_wallet`
                  WHERE
                 `msisdn` = '%s'
                  """ % (msisdn,)

            params = ()

            recordset = db.retrieve_all_data_params(conn,qry,params)

            for data in recordset:
                loan_limit = data['loan_limit']
        except Exception,e:
            logger.error(e)
            raise

        return loan_limit


    """
    -=================================================
    -.method: screen a loan request.
    -=================================================
    """
    def _vet_loan_request_db(self,params,conn):

        _flag = 2
        date = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        j_string = None

        reference_no = params.uid
        msisdn = params.msisdn
        approved_by = params.approved_by
        remarks = params.remarks
        head = params.action_header

        try:
            sql = """
                  UPDATE
                 `db_freknur_loan`.`tbl_loan_request`
                  SET
                 `task_flag` = %s,
                 `approved_by` = '%s',
                 `date_modified` = '%s'
                  WHERE
                 `reference_no` = '%s' AND `msisdn` = '%s' AND `is_processed` = '0'
                  """ % (_flag,approved_by,date,reference_no,msisdn)

            params = ()
            db.execute_query(conn,sql,params)
            
            j_string = {"ERROR":"0","RESULT":"SUCCESS","MESSAGE":"Loan approval successful."}
            
            conn.commit()
        except Exception, e:
            logger.error(e)
            raise

        return j_string


    """
    -=================================================
    -.method: reject loan request.
    -=================================================
    """
    def _log_rejected_loan_request_db(self,params,conn):

        j_string = None
        msisdn = params.msisdn
        remarks = params.remarks
        try:
            sql = """CALL """+mysql_params['db']+""".`sProcLogRejectedLoanRequest`(%s,%s)"""
            params = (msisdn,remarks,)
            output = db.retrieve_all_data_params(conn,sql,params)
            for data in output:
                j_string = json.loads(data.get('_JSON'))

                #conn.commit()
        except Exception, e:
            logger.error(e)
            raise

        return j_string
