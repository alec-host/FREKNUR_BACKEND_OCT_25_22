import sys
  

from sqlalchemy.schema import Column
from sqlalchemy.types import String, Integer, Float, DateTime

sys.path.insert(0,'/usr/local/lib/freknur/engine/fastapi/conn/')
from database import Base

class AssetDescription(Base):
    __tablename__ = "tbl_asset"
    #__table_args__ = {"schema": "database1.schema1"}

    _id = Column(Integer, primary_key=True, index=True)
    uid = Column(String)
    asset_acronym = Column(String)
    asset_name = Column(String)
    unit_price = Column(Float)
    total = Column(Float)
    asset_trend = Column(Integer)
    date_created = Column(DateTime)
    date_modified = Column(DateTime)
    has_collateral = Column(Integer)
    is_deleted = Column(Integer)

class OwnerPortfolioDescription(Base):
    __tablename__ = "tbl_owner_portfolio"
    #__table_args__ = {"schema": "database2.schema1"}

    _id = Column(Integer, primary_key=True, index=True)
    msisdn = Column(String)
    asset_id = Column(String)
    asset_acronym = Column(String)
    number_of_asset = Column(Float)
    unit_price = Column(Float)
    has_secured_loan = Column(Integer)
    date_created = Column(DateTime)
    date_modified = Column(DateTime)
    is_active = Column(Integer)
    lock = Column(Integer)

class OwnerPortfolioTempListDescription(Base):
    __tablename__ = "tbl_owner_portfolio_temp_list"

    _id = Column(Integer, primary_key=True, index=True)
    msisdn = Column(String)
    asset_id = Column(String)
    asset_acronym = Column(String)
    number_of_asset = Column(Float)
    unit_price = Column(Float)
    has_secured_loan = Column(Integer)
    date_created = Column(DateTime)
    date_modified = Column(DateTime)
    is_active = Column(Integer)
    lock = Column(Integer)

class SaleRequestDescription(Base):
    __tablename__ = "tbl_sale_request"

    _id = Column(Integer, primary_key=True, index=True)
    uid = Column(String)
    unit_price_no_markup = Column(Float)
    msisdn = Column(String)
    description = Column(String)
    unit_price = Column(Float)
    no_of_grain_sold = Column(Float)
    no_markup_cost = Column(Float)
    cost = Column(Float)
    date_created = Column(DateTime)
    date_modified = Column(DateTime)
    is_processed = Column(Integer)

class ConfigDescription(Base):
    __tablename__ = "tbl_config"

    cnf_id = Column(Integer, primary_key=True, index=True)
    trx_fee = Column(Float)
    tax = Column(Float)
    min_limit = Column(Float)
    max_limit = Column(Float)
    currency = Column(String)
    equity_markup = Column(Float)
    equity_offer_rate = Column(Float)
    early_payment_fee = Column(Float)
    setting_3 = Column(Float)
    time_stamp = Column(DateTime)
