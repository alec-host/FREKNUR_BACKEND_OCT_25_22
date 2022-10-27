#!/usr/bin/python3

import sys
import json
import logging

from interface import implements
from time import gmtime, strftime
from sqlalchemy.orm import Session

from .abstract.interface_mq_wrapper import InterfaceRabbitMqWrapper

sys.path.insert(0,'/usr/local/lib/freknur/engine/ipn_paypal/mq_pub_sub-main/ipn/db/')
from crud import _add_ipn_receipt

sys.path.insert(0,'/usr/local/lib/freknur/engine/fastapi/conn/')
from database import DatabaseManager

import config

class RabbitMQWrapper(implements(InterfaceRabbitMqWrapper)):
    def __init__(self,queue_name,exchange_name,exchange_type):
        self.queue_name = queue_name
        self.exchange_name = exchange_name
        self.exchange_type = exchange_type

    def consumer(self,channel):
        result = channel.queue_declare(queue=self.queue_name, exclusive=False)
        queue_name = result.method.queue
        
        channel.queue_bind(exchange=self.exchange_name, queue=queue_name)
        
        logging.basicConfig(level=logging.INFO)
        logging.info('[*] Waiting for logs. To exit press CTRL+C')
        
        def callback(ch, method, properties, body):
            in_time = "["+strftime("%Y-%m-%d %H:%M:%S", gmtime())+"]"
            resp = PayPalIpnLog().save_log(body)

            logging.basicConfig(level=logging.INFO)
            logging.info(str(in_time)+":"+str(resp))
        
        channel.basic_consume(queue=queue_name, on_message_callback=callback, auto_ack=True) 
        channel.start_consuming()
        
    def producer(self):
        pass
    
    def define_mq_queue(self,channel):
        channel.exchange_declare(exchange=self.exchange_name, exchange_type=self.exchange_type)

class PayPalIpnLog:
    def __init__(self):
        db_mgt_1 = DatabaseManager(config.FREKNUR_PAYPAL)
        self.session = next(db_mgt_1.get_db())

    def save_log(self, body):
        _dict = json.loads(json.dumps(body.decode('utf-8')))
        json_str = json.loads(_dict)
        response = _add_ipn_receipt(self.session,json_str)

        return response 
