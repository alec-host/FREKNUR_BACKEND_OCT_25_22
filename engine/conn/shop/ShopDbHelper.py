#!/usr/bin/python
  
"""
developer skype: alec_host
"""

import os
import sys
import json
import uuid
import logging
import MySQLdb
import MySQLdb.cursors

from datetime import datetime

sys.path.append('/usr/local/lib/freknur/engine/conn')
from db_helper import _get_user_db,_get_uid_db,_get_last_record_db
from configs.freknur_settings import logger,mysql_params
from db_conn import DB,NoResultException

db = DB()

class ShopDbHelper():

    """
    -=================================================
    -.create a inventory record.
    -=================================================
    """
    def _create_inventory_item_db(self,content,conn):
        j_string = None
        date = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        uid   = content.uid
        name  = content.name
        qty   = content.qty
        price = content.price        
        try:
            sql = """
                      INSERT 
                      INTO
                     `db_freknur_inventory`.`tbl_inventory`
                      (`item_uid`,`item_name`,`qty_in`,`unit_price`,`date_created`)
                      VALUES
                      ('%s','%s','%s','%s','%s')
                      ON
                      DUPLICATE KEY
                      UPDATE `date_modified` = '%s'
                      """ % (uid,name,qty,price,date,date)

            params = ()

            db.execute_query(conn, sql, params)
            
            conn.commit()
            
            last_record = _get_last_record_db("inventory",conn)
            
            j_string = last_record
        except Exception,e:
            logger.error(e)
            raise
        
        return j_string

    """
    -=================================================
    -.modify inventory item.
    -=================================================
    """
    def _modify_inventory_item_db(self,content,conn):
        j_string = None
        uid   = content.uid
        qty   = content.qty
        total = content.total
        try:
            sql = """
                  UPDATE
                 `db_freknur_inventory`.`tbl_sales`
                  SET
                 `qty` = %s,
                 `total` = %s
                  WHERE
                 `product_uid` = '%s' AND `is_archived` = '0'
                  """ % (qty,total,product_uid)

            params = ()

            db.execute_query(conn, sql, params)
            
            j_string = {"ERROR":"0","RESULT":"SUCCESS","MESSAGE":"Item has been modified."}
            
            conn.commit()
        except Exception,e:
                logger.error(e)
                raise

        return j_string


    """
    -=================================================
    -.save image path.
    -=================================================
    """
    def _post_inventory_item_image_path_db(self,content,conn):
        j_string = None
        date = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        uid = content.uid
        path = content.path 
        try:
            sql = """
                  UPDATE
                 `db_freknur_inventory`.`tbl_inventory`
                  SET
                 `item_image` = '%s',
                 `date_modified` = '%s'
                  WHERE
                 `item_uid` = '%s'
                  """ % (path,date,uid)

            params = ()

            db.execute_query(conn, sql, params)

            j_string = {"ERROR":"0","RESULT":"SUCCESS","MESSAGE":"Image path has been updated."}

            conn.commit()

        except Exception,e:
            logger.error(e)
            raise

        return j_string

    """
    -=================================================
    -.create new customer.
    -=================================================
    """
    def _record_shop_sale_db(self,content,conn):

        date   = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        uid    = content.uid
        msisdn = content.msisdn
        qty    = content.qty
        price  = content.price

        total  = (float(qty) * float(price))

        try:
            qry = """
                  INSERT
                  INTO
                 `db_freknur_inventory`.`tbl_sales`
                  (`product_id`,`qty`,`total`,`msisdn`,`date_created`)
                  VALUES
                  ('%s','%s','%s','%s','%s')
                  """ % (uid,qty,total,msisdn,date)

            params = ()

            db.execute_query(conn, qry, params)

            conn.commit()
        except Exception, e:
            logger.error(e)
            raise


    """
    -=================================================
    -.create stats record.
    -=================================================
    """
    def _record_stats_db(self,content,conn):

        date   = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

        try:
            qry = """
                  INSERT
                  INTO
                 `db_freknur_stats`.%s
                  (`daily_cnt`,`total`,`time_stamp`)
                  VALUES
                  ('%s','%s','%s')
                  """ % (content['table'],content['count'],content['total'],date)

            params = ()
            db.execute_query(conn, qry, params)

            conn.commit()
        except Exception, e:
            logger.error(e)
            raise


    """
    -=================================================
    -.update stats record.
    -=================================================
    """
    def _update_stats_db(self,content,conn):

        try:
            qry = """
                  UPDATE
                 `db_freknur_stats`.%s
                  SET
                 `daily_cnt` = (`daily_cnt` + 1),
                 `total` = (`total` + '%s')
                  WHERE
                  DATE(`time_stamp`) = DATE(NOW())
                  """ % (content['table'],content['total'])

            params = ()
            db.execute_query(conn, qry, params)

            conn.commit()
        except Exception, e:
            logger.error(e)
            raise


    """
    -=================================================
    -.daily stats record.
    -=================================================
    """
    def _get_daily_stats_db(self,table_name,conn):
        cnt=0
        total=0
        try:
            qry = """
                  SELECT
                  SUM(`daily_cnt`) AS cnt,SUM(`total`) AS total
                  FROM
                 `db_freknur_stats`.%s
                  WHERE
                  DATE(`time_stamp`) = DATE(NOW())
                  """ % (table_name)
            params = ()
            recordset = db.retrieve_all_data_params(conn,qry,params)
            for record in recordset:
                cnt = record['cnt']
                total = record['total']
        except Exception, e:
            logger.error(e)
            raise
        return cnt,total


    """
    -=================================================
    -.monthly stats record.
    -=================================================
    """
    def _get_monthly_stats_db(self,table_name,conn):
        cnt=0
        total=0
        try:
            qry = """
                  SELECT
                  SUM(`daily_cnt`) AS cnt,SUM(`total`) AS total
                  FROM
                 `db_freknur_stats`.%s
                  WHERE
                  MONTH(`time_stamp`) = MONTH(NOW())
                  """ % (table_name)
            params = ()
            recordset = db.retrieve_all_data_params(conn,qry,params)
            for record in recordset:
                cnt   = record['cnt'] 
                total = record['total']
        except Exception, e:
            logger.error(e)
            raise
        return cnt,total
    

    """
    -=================================================
    -..
    -=================================================
    """
    def _get_stats_daily_count_db(self,table_name,conn):
        cnt=0
        try:
            qry = """
                  SELECT
                  SUM(`daily_cnt`) AS cnt
                  FROM
                 `db_freknur_stats`.%s
                  WHERE
                  DATE(`time_stamp`) = DATE(NOW())
                  """ % (table_name)
            params = ()
            recordset = db.retrieve_all_data_params(conn,qry,params)
            for record in recordset:
                cnt = record['cnt']
        except Exception, e:
            logger.error(e)
            raise
        return cnt

    """
    -=================================================
    -..
    -=================================================
    """
    def _get_stats_monthly_count_db(self,table_name,conn):
        cnt=0
        try:
            qry = """
                  SELECT
                  SUM(`daily_cnt`) AS cnt
                  FROM
                 `db_freknur_stats`.%s
                  WHERE
                  MONTH(`time_stamp`) = MONTH(NOW())
                  """ % (table_name)
            params = ()
            recordset = db.retrieve_all_data_params(conn,qry,params)
            for record in recordset:
                cnt = record['cnt'];
        except Exception, e:
            logger.error(e)
            raise
        return cnt

    """
    -=================================================
    -.create fcm broadcast record.
    -=================================================
    """
    def _add_fcm_broadcast_db(self,content,conn):
        j_string = None
        date = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        uid  = uuid.uuid1()
        msg  = content['message'] 
        name = content['broadcast_date']
        try:
            sql = """
                      INSERT 
                      INTO
                     `db_freknur_notification`.`tbl_broadcast`
                      (`uid`,`message`,`broadcast_date`,`date_created`)
                      VALUES
                      ('%s','%s','%s','%s')
                      ON
                      DUPLICATE KEY
                      UPDATE `date_modified` = '%s'
                      """ % (uid,msg,name,date,date)

            params = ()

            db.execute_query(conn, sql, params)

            conn.commit()

            last_record = _get_last_record_db("tbl_broadcast",conn)

            j_string = last_record
        except Exception,e:
            logger.error(e)
            raise

        return j_string

    """
    -=================================================
    -.modify fcm broadcast record.
    -=================================================
    """
    def _modify_fcm_broadcast_db(self,content,conn):
        j_string = None
        uid  = content.uid
        msg  = content.message
        name = content.broadcast_date
        try:
            sql = """
                  UPDATE
                 `db_freknur_notification`.`tbl_broadcast`
                  SET
                 `message` = %s,
                 `broadcast_date` = %s
                  WHERE
                 `uid` = '%s' AND `is_processed` = '0'
                  """ % (msg,name,uid)

            params = ()

            db.execute_query(conn, sql, params)

            j_string = {"ERROR":"0","RESULT":"SUCCESS","MESSAGE":"Broadcast has been modified."}

            conn.commit()
        except Exception,e:
                logger.error(e)
                raise
