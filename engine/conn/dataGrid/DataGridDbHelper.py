#!/usr/bin/python
  
"""
developer skype: alec_host
"""
import os
import sys
import ast
import json
import logging
import decimal
import MySQLdb
import MySQLdb.cursors

import requests

sys.path.append('/usr/local/lib/freknur/engine/conn')
from Utils import Utils
from Utils import DecimalEncoder
from configs.freknur_settings import logger,mysql_params
from db_conn import DB,NoResultException

db = DB()

class DataGridDbHelper():
    """
    -.===============================================
    -.method:customer list.
    -.===============================================
    """
    def _get_customer_list_db(self,this,conn):

        j_string = None

        search = this.search
        lower_limit = this.lower_limit
        upper_limit = this.upper_limit
    
        try:
            if(str(search) == '0'):
                qry = """
                      SELECT
                      A.`_id`,A.`msisdn`,A.`first_name`,A.`second_name`,A.`birth_date`,A.`mail`,A.`country_code`,CONCAT("",A.`time_stamp`,"") AS time_stamp,B.`is_suspended`
                      FROM
                      `db_freknur_loan`.`tbl_wallet_extra` A
                      INNER JOIN
                      `db_freknur_loan`.`tbl_wallet` B
                      ON
                      A.`msisdn` = B.`msisdn`
                      LIMIT %i, %i
                      """ % (int(lower_limit),int(upper_limit))

                qry = """
                      SELECT
                     `userID` AS _id,`phoneNumber` AS msisdn,`firstName` AS first_name,`lastName` AS second_name,CONCAT("",`birthDate`,"") AS birth_date,`homeAddress`,LEFT(`phoneNumber`,3) AS countryPhonePrefix,`emailAddress` AS mail,`countryCode` AS country_code,'0' AS latlong,'0' AS time_stamp,B.`is_suspended`
                      FROM
                     `db_freknur_wallet`.`users` A
                      INNER JOIN
                     `db_freknur_loan`.`tbl_wallet` B
                      ON
                      A.`phoneNumber` = B.`msisdn`
                      LIMIT %i, %i
                      """ % (int(lower_limit),int(upper_limit))
            else:
                qry = """
                      SELECT
                      A.`_id`,A.`msisdn`,A.`first_name`,A.`second_name`,A.`birth_date`,A.`mail`,A.`country_code`,CONCAT("",A.`time_stamp`,"") AS time_stamp,B.`is_suspended`
                      FROM
                      `db_freknur_loan`.`tbl_wallet_extra` A
                      INNER JOIN
                      `db_freknur_loan`.`tbl_wallet` B
                      ON
                      A.`msisdn` = B.`msisdn`
                      WHERE
                      A.`msisdn` = '%s'
                      LIMIT %i, %i
                      """ % (search,int(lower_limit),int(upper_limit))

                qry = """
                      SELECT
                     `userID` AS _id,`phoneNumber` AS msisdn,`firstName` AS first_name,`lastName` AS second_name,CONCAT("",`birthDate`,"") AS birth_date,`homeAddress`,LEFT(`phoneNumber`,3) AS countryPhonePrefix,`emailAddress` AS mail,`countryCode` AS country_code,'0' AS latlong,'0' AS time_stamp,B.`is_suspended`
                      FROM
                      `db_freknur_wallet`.`users` A
                      INNER JOIN
                      `db_freknur_loan`.`tbl_wallet` B
                      ON
                      A.`phoneNumber` = B.`msisdn`
                      WHERE
                      phoneNumber = '%s'
                      LIMIT %i, %i
                      """ % (search,int(lower_limit),int(upper_limit))                      

            params = ()
            
            recordset = db.retrieve_all_data_params(conn,qry,params)
            
            jsonArray = ast.literal_eval(json.dumps(recordset))
            jsonArraySize = len(jsonArray)
            j_string = json.dumps({"Result":"OK","Records":recordset,"TotalRecordCount":str(jsonArraySize)})
            
        except Exception, e:
            logger.error(e)
            raise

        return j_string


    """
    -=================================================
    -.account summary.
    -=================================================      
    """
    def _get_account_summary_db(self,this,conn):
        
        j_string = None
        utils = Utils()


        lower_limit = this.lower_limit
        upper_limit = this.upper_limit
        
        try:
            sql = """
                  SELECT 
                 `id`,`account_code`,`account_name`,ROUND(`balance`,2) AS balance,CONCAT("",`date_created`,"") AS date_created
                  FROM 
                 `tbl_account`
                  LIMIT %i, %i  
                  """ % (int(lower_limit),int(upper_limit))
    
            params = ()
            
            recordset = db.retrieve_all_data_params(conn,sql,params)
            
            jsonArray = ast.literal_eval(json.dumps(recordset,default=utils.decimal_default))
            jsonArraySize = len(jsonArray)
            
            j_string = json.dumps({"Result":"OK","Records":recordset,"TotalRecordCount":str(jsonArraySize)},default=utils.decimal_default)

        except Exception,e:
            logger.error(e)
            raise
            
        return j_string


    """
    -=================================================
    -.method: stock account summary.
    -=================================================      
    """
    def _get_stock_account_summary_db(self,this,conn):

        j_string = None
        utils = Utils()

        lower_limit = this.lower_limit
        upper_limit = this.upper_limit

        try:
            sql = """
                  SELECT 
                 `id`,`account_code`,`account_name`,ROUND(`balance`,2),CONCAT("",`date_created`,"") AS date_created
                  FROM 
                 `db_freknur_investment`.`tbl_account`
                  LIMIT %i, %i  
                  """ % (int(lower_limit),int(upper_limit))

            params = ()

            recordset = db.retrieve_all_data_params(conn,sql,params)

            jsonArray = ast.literal_eval(json.dumps(recordset,default=utils.decimal_default))
            jsonArraySize = len(jsonArray)

            j_string = json.dumps({"Result":"OK","Records":recordset,"TotalRecordCount":str(jsonArraySize)},default=utils.decimal_default)

        except Exception,e:
            logger.error(e)
            raise

        return j_string


    """
    -=================================================
    -.method: loan request list.
    -=================================================
    """
    def _get_loan_request_list_db(self,this,conn):

        is_processed  = 0
        j_string = None
        utils = Utils()

        search = this.search
        lower_limit = this.lower_limit
        upper_limit = this.upper_limit

        try:
            if(str(search) == '0'):
                qry = """
                      SELECT 
                     `reference_no`,`msisdn`,`amount`,`requested_by`,IFNULL(`task_flag`,0) AS task_flag,CONCAT("",`date_created`,"") AS date_created,
                      CONCAT("",`date_modified`,"") AS date_modified
                      FROM 
                     `tbl_loan_request`
                      WHERE 
                     `is_processed` = %s 
                      ORDER BY `date_created` DESC
                      LIMIT %i, %i 
                      """ % (is_processed,int(lower_limit),int(upper_limit))
            else:
                qry = """
                      SELECT 
                     `reference_no`,`msisdn`,`amount`,`requested_by`,IFNULL(`task_flag`,0) AS task_flag,CONCAT("",`date_created`,"") AS date_created,
                      CONCAT("",`date_modified`,"") AS date_modified
                      FROM 
                     `tbl_loan_request`
                      WHERE 
                     `is_processed` = %s AND `msisdn` = '%s'
                      ORDER BY `date_created` DESC
                      LIMIT %i, %i 
                      """ % (is_processed,search,int(lower_limit),int(upper_limit))

            params = ()
                
            recordset = db.retrieve_all_data_params(conn,qry,params)
                
            jsonArray = ast.literal_eval(json.dumps(recordset,default=utils.decimal_default))
                
            jsonArraySize = len(jsonArray)
                
            j_string = json.dumps({"Result":"OK","Records":recordset,"TotalRecordCount":str(jsonArraySize)},default=utils.decimal_default)

        except Exception, e:
            logger.error(e)
            raise
        
        return j_string


    """
    -=================================================
    -.method: rejected loan list.
    -=================================================
    """
    def _get_rejected_loan_list_db(self,this,conn):

        j_string = None

        search = this.search
        lower_limit = this.lower_limit
        upper_limit = this.upper_limit

        try:
            if(str(search) == '0'):
                qry = """
                      SELECT 
                     `_id`,`msisdn`,`remarks`,CONCAT("",`date_created`,"") AS date_created
                      FROM 
                     `db_freknur_general`.`tbl_rejected_loan`
                      ORDER BY `date_created` DESC
                      LIMIT %i, %i 
                      """ % (int(lower_limit),int(upper_limit))
            else:
                qry = """
                      SELECT 
                     `_id`,`msisdn`,`remarks`,CONCAT("",`date_created`,"") AS date_created
                      FROM 
                     `db_freknur_general`.`tbl_rejected_loan`
                      WHERE 
                     `msisdn` = '%s'
                      ORDER BY `date_created` DESC
                      LIMIT %i, %i 
                      """ % (search,int(lower_limit),int(upper_limit))

            params = ()

            recordset = db.retrieve_all_data_params(conn,qry,params)

            jsonArray = ast.literal_eval(json.dumps(recordset))

            jsonArraySize = len(jsonArray)

            j_string = json.dumps({"Result":"OK","Records":recordset,"TotalRecordCount":str(jsonArraySize)})

        except Exception, e:
            logger.error(e)
            raise

        return j_string


    """
    -=================================================
    -.method:debtor list.
    -=================================================
    """
    def _get_debtor_list_db(self,this,conn):
        status  = 0
        j_string = None
        utils = Utils()

        search = this.search
        lower_limit = this.lower_limit
        upper_limit = this.upper_limit

        try:
            if(str(search) == '0'):
                sql = """
                      SELECT
                     `id`,`reference_no`,`msisdn`,`amount_requested`,`amount_disbursed`,`repayment_amount`,CONCAT("",`repayment_date`,"") AS repayment_date,CONCAT("",`expected_repayment_date`,"") AS expected_repayment_date,
                      CONCAT("",`date_created`,"") AS date_created
                      FROM
                     `tbl_debtor`
                      WHERE
                     `is_archived` = %s AND `is_repaid` = 0
                      ORDER BY
                     `date_created` DESC
                      LIMIT %i, %i
                      """ % (status,int(lower_limit),int(upper_limit))
            else:
                sql = """
                      SELECT
                     `id`,`reference_no`,`msisdn`,`amount_requested`,`amount_disbursed`,`repayment_amount`,CONCAT("",`repayment_date`,"") AS repayment_date,CONCAT("",`expected_repayment_date`,"") AS expected_repayment_date,
                      CONCAT("",`date_created`,"") AS date_created
                      FROM
                     `tbl_debtor`
                      WHERE
                     `is_archived` = %s AND `msisdn` = '%s' AND AND `is_repaid` = 0
                      ORDER BY
                     `date_created` DESC
                      LIMIT %i, %i
                      """ % (status,search,int(lower_limit),int(upper_limit))

            params = ()
                
            recordset = db.retrieve_all_data_params(conn,sql,params)

            jsonArray = ast.literal_eval(json.dumps(recordset,default=utils.decimal_default))

            jsonArraySize = len(jsonArray)

            j_string = json.dumps({"Result":"OK","Records":recordset,"TotalRecordCount":str(jsonArraySize)},default=utils.decimal_default)
        
        except Exception,e:
            logger.error(e)
            raise

        return j_string



    """
    -=================================================
    -.method: defaulter list.
    -=================================================
    """
    def _get_defaulter_list_db(self,this,conn):
        status  = 0
        j_string = None
        utils = Utils()

        search = this.search
        lower_limit = this.lower_limit
        upper_limit = this.upper_limit

        try:
            if(str(search) == '0'):
                sql = """
                      SELECT
                     `id`,`msisdn`,`loan_amount`,`amount_repaid`,CONCAT("",`expected_repayment_date`,"") AS repayment_date,
                      (CASE WHEN (`date_repaid` IS NULL) THEN 'Loan outstanding' ELSE CONCAT("",`date_repaid`,"") END) AS date_repaid,
                     `roll_count`,CONCAT("",`date_created`,"") AS date_created
                      FROM
                     `db_freknur_general`.`tbl_defaulter`
                      WHERE
                     `is_archived` = %s
                      LIMIT %i, %i
                      """ % (status,int(lower_limit),int(upper_limit))
            else:
                sql = """
                      SELECT
                     `id`,`msisdn`,`loan_amount`,`amount_repaid`,CONCAT("",`expected_repayment_date`,"") AS repayment_date,
                      (CASE WHEN (`date_repaid` IS NULL) THEN 'Loan outstanding' ELSE CONCAT("",`date_repaid`,"") END) AS date_repaid,
                     `roll_count`,CONCAT("",`date_created`,"") AS date_created
                      FROM
                     `db_freknur_general`.`tbl_defaulter`
                      WHERE
                     `is_archived` = %s AND `msisdn` = '%s'
                      LIMIT %i, %i
                      """ % (status,search,int(lower_limit),int(upper_limit))

            params = ()
            
            recordset = db.retrieve_all_data_params(conn,sql,params)

            jsonArray = ast.literal_eval(json.dumps(recordset,default=utils.decimal_default))
            jsonArraySize = len(jsonArray)

            j_string = json.dumps({"Result":"OK","Records":recordset,"TotalRecordCount":str(jsonArraySize)},default=utils.decimal_default)

        except Exception,e:
            logger.error(e)
            raise
        
        return j_string



    """
    -=================================================
    -.method: dispatch list.
    -=================================================
    """
    def _get_loan_dispatch_list_db(self,this,conn):
        is_processsed = 0
        j_string = None
        utils = Utils()

        search = this.search
        lower_limit = this.lower_limit
        upper_limit = this.upper_limit

        try:
            if(str(search) == '0'):
                sql  =   """
                         SELECT 
                        `reference_no`,`msisdn`,`amount`,`status`,`approved_by`,CONCAT("",`date_created`,"") AS date_created,CONCAT("",`date_modified`,"") AS date_modified
                         FROM 
                        `db_freknur_general`.`tbl_loan_payout`
                         WHERE 
                        `is_processed` = %s
                         ORDER BY `date_created` DESC
                         LIMIT %i, %i 
                         """ % (is_processsed,int(lower_limit),int(upper_limit))
            else:
                sql  =   """
                         SELECT 
                        `reference_no`,`msisdn`,`amount`,`status`,`approved_by`,CONCAT("",`date_created`,"") AS date_created,CONCAT("",`date_modified`,"") AS date_modified
                         FROM 
                        `db_freknur_general`.`tbl_loan_payout`
                         WHERE 
                        `is_processed` = %s
                         ORDER BY `date_created` DESC
                         LIMIT %i, %i 
                         """ % (is_processsed,int(lower_limit),int(upper_limit))

            params = ()
            
            recordset = db.retrieve_all_data_params(conn,sql,params)

            if(recordset is not None): 
                jsonArray = ast.literal_eval(json.dumps(recordset,default=utils.decimal_default))
                jsonArraySize = len(jsonArray)
            else:
                jsonArraySize = 0
            
            j_string = json.dumps({"Result":"OK","Records":recordset,"TotalRecordCount":str(jsonArraySize)},default=utils.decimal_default)

        except Exception, e:
            logger.error(e)
            raise
        
        return j_string



    """
    -=================================================
    -.method: general accounts.
    -=================================================
    """
    def _get_general_account_list_db(self,this,conn):
        status  = 0
        j_string = None
        utils = Utils()

        code = this.code
        search = this.search
        lower_limit = this.lower_limit
        upper_limit = this.upper_limit

        utils = Utils()

        try:
            if(str(code) == 'GEN'):
                if(str(search) == '0'):
                    sql = """
                          SELECT
                         `account_code`,`reference_no`,`msisdn`,`cr`,`dr`,`balance`,`narration`,CONCAT("",`date_created`,"") AS date_created
                          FROM
                         `tbl_transaction`
                          WHERE
                         `is_archived` = %s AND `account_code` != '%s'
                          ORDER BY
                         `date_created` DESC
                          LIMIT %i, %i
                          """ % (status,str(code),int(lower_limit),int(upper_limit))
                else:
                    sql = """
                          SELECT
                         `account_code`,`reference_no`,`msisdn`,`cr`,`dr`,`balance`,`narration`,CONCAT("",`date_created`,"") AS date_created
                          FROM
                         `tbl_transaction`
                          WHERE
                         `is_archived` = %s AND `account_code` != '%s' AND `msisdn` = '%s'
                          ORDER BY
                         `date_created` DESC
                          LIMIT %i, %i
                          """ % (status,str(code),search,int(lower_limit),int(upper_limit))
            elif(str(code) == 'GEN_INV'):
                if(str(search) == '0'):
                    sql = """
                          SELECT
                         `account_code`,`reference_no`,`msisdn`,`cr`,`dr`,`balance`,`narration`,CONCAT("",`date_created`,"") AS date_created
                          FROM
                         `db_freknur_investment`.`tbl_transaction`
                          WHERE
                         `is_archived` = %s AND `account_code` != '%s'
                          ORDER BY
                         `date_created` DESC
                          LIMIT %i, %i
                          """ % (status,str(code),int(lower_limit),int(upper_limit))
                else:
                    sql = """
                          SELECT
                         `account_code`,`reference_no`,`msisdn`,`cr`,`dr`,`balance`,`narration`,CONCAT("",`date_created`,"") AS date_created
                          FROM
                         `db_freknur_investment`.`tbl_transaction`
                          WHERE
                         `is_archived` = %s AND `account_code` != '%s' AND `msisdn` = '%s'
                          ORDER BY
                         `date_created` DESC
                          LIMIT %i, %i
                          """ % (status,str(code),search,int(lower_limit),int(upper_limit))                
            elif(str(code) == 'STMT'):
                if(str(search) == '0'):
                    sql = """
                          SELECT
                          'SELF' AS account_code,`reference_no`,`msisdn`,`cr`,`dr`,`balance`,`narration`,CONCAT("",`date_created`,"") AS date_created
                          FROM
                         `db_freknur_loan`.`tbl_wallet_transaction`
                          WHERE
                         `is_archived` = %s
                          ORDER BY
                         `date_created` DESC
                          LIMIT %i, %i
                          """ % (status,int(lower_limit),int(upper_limit))                    
                else:
                    sql = """
                          SELECT
                          'SELF' AS account_code,`reference_no`,`msisdn`,`cr`,`dr`,`balance`,`narration`,CONCAT("",`date_created`,"") AS date_created
                          FROM
                         `db_freknur_loan`.`tbl_wallet_transaction`
                          WHERE
                         `is_archived` = %s AND `msisdn` = '%s'
                          ORDER BY
                         `date_created` DESC
                          LIMIT %i, %i
                          """ % (status,search,int(lower_limit),int(upper_limit))
            else:
                if(str(search) == '0'):
                    sql = """
                          SELECT
                         `account_code`,`reference_no`,`msisdn`,`cr`,`dr`,`balance`,`narration`,CONCAT("",`date_created`,"") AS date_created
                          FROM
                         `db_freknur_loan`.`tbl_transaction`
                          WHERE
                         `is_archived` = %s AND `account_code` = '%s'
                          ORDER BY
                         `date_created` DESC
                          LIMIT %i, %i
                          """ % (status,str(code),int(lower_limit),int(upper_limit))
                else:
                     sql = """
                           SELECT
                          `account_code`,`reference_no`,`msisdn`,`cr`,`dr`,`balance`,`narration`,CONCAT("",`date_created`,"") AS date_created
                           FROM
                          `db_freknur_loan`.`tbl_transaction`
                           WHERE
                          `is_archived` = %s AND `account_code` = '%s' AND `msisdn` = '%s'
                           ORDER BY
                          `date_created` DESC
                           LIMIT %i, %i
                           """ % (status,str(code),search,int(lower_limit),int(upper_limit))


            params = ()

            recordset = db.retrieve_all_data_params(conn,sql,params)

            jsonArray = ast.literal_eval(json.dumps(recordset,default=utils.decimal_default))
            jsonArraySize = len(jsonArray)
            
            j_string = json.dumps({"Result":"OK","Records":recordset,"TotalRecordCount":str(jsonArraySize)},default=utils.decimal_default)

        except Exception,e:
            logger.error(e)
            raise

        return j_string


    """
    -=================================================
    -.method:activity log.
    -=================================================
    """
    def _get_activity_list_db(self,this,conn):
        j_string = None

        search = this.search
        lower_limit = this.lower_limit
        upper_limit = this.upper_limit

        try:
            if(str(search) == '0'):
                sql = """
                      SELECT
                     `_id`,`msisdn`,`activity`,CONCAT("",`time_stamp`,"") AS time_stamp,`flag`
                      FROM
                     `db_freknur_general`.`tbl_activity_log`
                      WHERE
                     `flag` = 0
                      ORDER BY
                     `time_stamp` DESC
                      LIMIT %i, %i
                      """ % (int(lower_limit),int(upper_limit))
            else:
                 sql = """
                       SELECT
                      `_id`,`msisdn`,`activity`,CONCAT("",`time_stamp`,"") AS time_stamp,`flag`
                       FROM
                      `db_freknur_general`.`tbl_activity_log`
                       WHERE
                      `flag` = 0 AND `msisdn` = '%s'
                       ORDER BY
                      `time_stamp` DESC
                       LIMIT %i, %i
                       """ % (search,int(lower_limit),int(upper_limit))

            params = ()
            
            recordset = db.retrieve_all_data_params(conn,sql,params)
            
            jsonArray = ast.literal_eval(json.dumps(recordset))
            jsonArraySize = len(jsonArray)
            
            j_string = json.dumps({"Result":"OK","Records":recordset,"TotalRecordCount":str(jsonArraySize)})

        except Exception,e:
            logger.error(e)
            raise

        return j_string



    """
    -=================================================
    -.method:inventory list.
    -=================================================
    """
    def _inventory_list_db(self,this,conn):
        available = 0
        j_string = None

        search = this.search
        lower_limit = this.lower_limit
        upper_limit = this.upper_limit

        utils = Utils()

        try:
            if(str(search) == '0'):
                sql = """
                      SELECT
                     `_id`,`item_uid`,`item_name`,`item_image`,`qty_in`,`qty_out`,CONCAT("",`unit_price`,"") AS unit_price,CONCAT("",`date_created`,"") AS date_created,CONCAT("",`date_modified`,"") AS date_modified,`is_available`
                      FROM
                     `db_freknur_inventory`.`tbl_inventory`
                      WHERE
                     `is_available` = %s
                      ORDER BY `date_created` DESC
                      LIMIT %i, %i
                      """ % (available,int(lower_limit),int(upper_limit))
            else:
                sql = """
                      SELECT
                     `_id`,`item_uid`,`item_name`,`item_image`,`qty_in`,`qty_out`,CONCAT("",`unit_price`,"") AS unit_price,CONCAT("",`date_created`,"") AS date_created,CONCAT("",`date_modified`,"") AS date_modified,`is_available`
                      FROM
                     `db_freknur_inventory`.`tbl_inventory`
                      WHERE
                     `is_available` = %s AND `item_name` LIKE '%s'
                      ORDER BY `date_created` DESC
                      LIMIT %i, %i
                      """ % (available,("%%" + search + "%%"),int(lower_limit),int(upper_limit))

            params = ()

            recordset = db.retrieve_all_data_params(conn,sql,params)
            
            jsonArray = ast.literal_eval(json.dumps(recordset,default=utils.decimal_default))
            jsonArraySize = len(jsonArray)
            
            
            j_string = json.dumps({"Result":"OK","Records":recordset,"TotalRecordCount":str(jsonArraySize)},default=utils.decimal_default)

        except Exception, e:
            logger.error(e)
            raise
        
        return j_string



    """
    -=================================================
    -.method: sales inventory list.
    -=================================================
    """
    def get_sale_inventory_list_db(self,this,conn):
        is_archived = 0
        j_string = None
        utils = Utils()

        search = this.search
        lower_limit = this.lower_limit
        upper_limit = this.upper_limit

        try:
            if(str(search) == '0'):
                sql = """
                      SELECT
                     `_id`,`product_uid`,`qty`,`total`,CONCAT("",`date_created`,"") AS date_created
                      FROM
                     `db_freknur_inventory`.`tbl_sales`
                      WHERE
                     `is_archived` = %s
                      ORDER BY `date_created` DESC
                      LIMIT %i, %i
                      """ % (is_archived,int(lower_limit),int(upper_limit))
            else:
                sql = """
                      SELECT
                     `_id`,`product_uid`,`qty`,`total`,CONCAT("",`date_created`,"") AS date_created
                      FROM
                     `db_freknur_inventory`.`tbl_sales`
                      WHERE
                     `is_archived` = %s
                      ORDER BY `date_created` DESC
                      LIMIT %i, %i
                      """ % (is_archived,int(lower_limit),int(upper_limit))

            params = ()
            
            recordset = db.retrieve_all_data_params(conn,sql,params)
            
            jsonArray = ast.literal_eval(json.dumps(recordset,default=utils.decimal_default))
            jsonArraySize = len(jsonArray)
            
            j_string = json.dumps({"Result":"OK","Records":recordset,"TotalRecordCount":str(jsonArraySize)},default=utils.decimal_default)

        except Exception, e:
            logger.error(e)
            raise
        
        return j_string



    """
    -=================================================
    -.method:asset config list.
    -=================================================
    """
    def _get_asset_config_list_db(self,this,conn):
        status  = 0
        j_string = None
        utils = Utils()

        search = this.search
        lower_limit = this.lower_limit
        upper_limit = this.upper_limit

        try:
            sql = """
                  SELECT
                 `cnf_id`,`trx_fee`,`min_limit`,`max_limit`,`equity_markup`,`currency`,CONCAT("",`time_stamp`,"") AS time_stamp
                  FROM
                 `db_freknur_investment`.`tbl_config`
                  LIMIT %i, %i
                  """ % (int(lower_limit),int(upper_limit))

            params = ()
            
            recordset = db.retrieve_all_data_params(conn,sql,params)
            
            jsonArray = ast.literal_eval(json.dumps(recordset,default=utils.decimal_default))
            jsonArraySize = len(jsonArray)
            
            j_string = json.dumps({"Result":"OK","Records":recordset,"TotalRecordCount":str(jsonArraySize)},default=utils.decimal_default)

        except Exception,e:
            logger.error(e)
            raise
        
        return j_string


    """
    -=================================================
    -.asset list.
    -=================================================
    """
    def _get_asset_list_db(self,this,conn):
        status  = 0
        j_string = None
        utils = Utils()
        
        search = this.search
        lower_limit = this.lower_limit
        upper_limit = this.upper_limit

        try:
            sql = """
                      SELECT
                     `_id`,`uid`,`asset_acronym`,`asset_name`,`unit_price`,CONCAT("",`total`,"") AS total,`asset_trend`,CONCAT("",`date_created`,"") AS date_created,CONCAT("",`date_modified`,"") AS date_modified
                      FROM
                     `db_freknur_investment`.`tbl_asset`
                      LIMIT %i, %i
                  """ % (int(lower_limit),int(upper_limit))

            params = ()
            
            recordset = db.retrieve_all_data_params(conn,sql,params)
            
            jsonArray = ast.literal_eval(json.dumps(recordset,default=utils.decimal_default))
            
            jsonArraySize = len(jsonArray)
            
            j_string = json.dumps({"Result":"OK","Records":recordset,"TotalRecordCount":str(jsonArraySize)},default=utils.decimal_default)

        except Exception,e:
            logger.error(e)
            raise

        return j_string
       

    """
    -=================================================
    -.frk token list.
    -=================================================
    """
    def _get_frk_token_list_db(self,this,conn):
        status  = 0
        j_string = None

        search = this.search
        lower_limit = this.lower_limit
        upper_limit = this.upper_limit

        utils = Utils()

        try:
            sql = """
                      SELECT
                     `ID`,`PhoneNumber`,CONCAT("",`CR`,"") AS CR ,CONCAT("",`DR`,"") AS DR,CONCAT("",`Balance`,"") AS Balance,CONCAT("",`Date`,"") AS date_created
                      FROM
                     `db_freknur_wallet`.`token_transactions`
                      LIMIT %i, %i
                  """ % (int(lower_limit),int(upper_limit))

            params = ()

            recordset = db.retrieve_all_data_params(conn,sql,params)

            jsonArray = ast.literal_eval(json.dumps(recordset,default=utils.decimal_default))

            jsonArraySize = len(jsonArray)

            j_string = json.dumps({"Result":"OK","Records":recordset,"TotalRecordCount":str(jsonArraySize)},default=utils.decimal_default)

        except Exception,e:
            logger.error(e)
            raise

        return j_string


    """
    -=================================================
    -.fcm broadcast list.
    -=================================================
    """
    def _get_fcm_broadcast_list_db(self,this,conn):
        status  = 0
        j_string = None

        search = this.search
        lower_limit = this.lower_limit
        upper_limit = this.upper_limit

        utils = Utils()

        try:
            sql = """
                      SELECT
                     `_id`,`message`,CONCAT("",`broadcast_date`,"") AS broadcast_date,CONCAT("",`date_created`,"") AS date_created,CONCAT("",`date_modified`,"") AS date_modified ,`is_processed`
                      FROM
                     `db_freknur_notification`.`tbl_broadcast`
                      LIMIT %i, %i
                  """ % (int(lower_limit),int(upper_limit))

            params = ()

            recordset = db.retrieve_all_data_params(conn,sql,params)

            jsonArray = ast.literal_eval(json.dumps(recordset,default=utils.decimal_default))

            jsonArraySize = len(jsonArray)

            j_string = json.dumps({"Result":"OK","Records":recordset,"TotalRecordCount":str(jsonArraySize)},default=utils.decimal_default)

        except Exception,e:
            logger.error(e)
            raise

        return j_string


    """
    -=================================================
    -.frk token stats.
    -=================================================
    """
    def _get_frk_token_stats(self):
        url = 'https://api.freknur.com/frk';
        param = {"filter": None}

        r = requests.get(url=url,params=param)
        
        return json.loads(json.dumps(r.json()))
