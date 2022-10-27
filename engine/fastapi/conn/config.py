from dotenv import load_dotenv

import os

load_dotenv()

MYSQL_USER         = os.getenv("MYSQL_USER")
MYSQL_PASS         = os.getenv("MYSQL_PASS")
MYSQL_URL          = os.getenv("MYSQL_URL")
FREKNUR_LOAN       = os.getenv("FREKNUR_LOAN")
FREKNUR_GENERAL    = os.getenv("FREKNUR_GENERAL")
FREKNUR_INVESTMENT = os.getenv("FREKNUR_INVESTMENT")
FREKNUR_INVENTORY  = os.getenv("FREKNUR_INVENTORY")
FREKNUR_PAYPAL     = os.getenv("FREKNUR_PAYPAL")
REDIS_HOST         = os.getenv("REDIS_HOST")
REDIS_PORT         = os.getenv("REDIS_PORT")
REDIS_PASS         = os.getenv("REDIS_PASS")
OOWALLET_BAL_KEY   = os.getenv("OOWALLET_BAL_KEY")
OOPORTFOLIO_KEY    = os.getenv("OOPORTFOLIO_KEY")
OOASSET_STMT_KEY   = os.getenv("OOASSET_STMT_KEY")
OOLOAN_STMT_KEY    = os.getenv("OOLOAN_STMT_KEY")
OOWALLET_STMT_KEY  = os.getenv("OOWALLET_STMT_KEY")
OOSHOP_LIST_KEY    = os.getenv("OOSHOP_LIST_KEY")
OOASSET_LIST_KEY   = os.getenv("OOASSET_LIST_KEY")
OOPUSH_MESSAGE_KEY = os.getenv("OOPUSH_MESSAGE_KEY")
