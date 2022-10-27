#!/usr/bin/env python2
  
import os
import sys
import json
import MySQLdb
import logging
import signal
import Queue
import requests

from threading import Thread
#from urllib import unquote

from flask import Flask, request

from flask_selfdoc import Autodoc

from conn.db_helper import create_connection,close_connection,NoResultException

from conn.RedisHelper import RedisHelper
from conn.helperUtils.JsonAddElement import JsonElementManager

log = logging.getLogger('waitress_2')

app = Flask(__name__)

auto = Autodoc(app)

#=====================================================================
#-.documentation class
#=====================================================================
class Post():
    def __init__(dself, title, content, author):
        self.title = title
        self.content = content
        posts.append(self)
        self.id = posts.index(self)

    def __repr__(self):
        return dumps(self.__dict__)

#=====================================================================
#-.route: custom notification incomplete
#=====================================================================
@app.route('/CreateNotificationApi/', methods = ['GET', 'POST'])
@auto.doc(groups=['posts','private'])
def CustomNotification():

        db = create_connection()

        redis_helper = RedisHelper()
        rd = redis_helper.create_redis_connection()
        try:
                if(request.method == 'GET'):
                        resp = {"ERROR":"1","RESULT":"FAIL","MESSAGE":"POST method not allowed"}
                elif(request.method == 'POST'):
                        if(request.data):

                                content = json.loads(request.data)

                                key = redis_helper.redis_access_key()[7]+str(content['msisdn'])

                                cache = redis_helper._read_redis_cache(key,rd)

                                json_element_manager = JsonElementManager()

                                if(cache is None):
                                        notification = json_element_manager._append_1st_element(content['message'])
                                        #-.save message.
                                        redis_helper._save_to_redis_cache(key,str(notification),rd)
                                else:
                                        notification = json_element_manager._append_nth_element(cache,content['message'])
                                        #-.save message.
                                        redis_helper._save_to_redis_cache(key,str(notification),rd)

                                resp = {"ERROR":"0","STATUS":"SUCCESS","MESSAGE": "Message has been stored.","data": cache,"key": key}
                        else:
                                resp = {"ERROR":"1","STATUS":"FAIL","MESSAGE":"MSISDN,MESSAGE has to be set."}
                return resp
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
                                close MySQL connection.
                                """
                                close_connection(db)
                except MySQLdb.Error, e:
                        log.error(e)

#=====================================================================
#-.main method.
#=====================================================================
if(__name__ == '__main__'):
    try:
        app.run("0.0.0.0:5002")
    except KeyboardInterrupt:
        pass
    finally:
        log.info("notification app is exiting...")
        exit();
