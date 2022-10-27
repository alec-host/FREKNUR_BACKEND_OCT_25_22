#!usr/bin/ python3.9
'''
@author: alex
@name: freknur
'''

import uuid

from datetime import datetime

date = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

from pydantic import BaseModel,Field
from typing import Optional

class CreateAndUpdateAsset(BaseModel):
    uid: str
    asset_acronym: str
    asset_name: str
    unit_price: Optional[float] = 0.00
    total: Optional[float] = 0.00
    asset_trend: Optional[int] = 0
    date_created: Optional[str] = date
    date_modified: Optional[str] = date
    is_suspended: Optional[int] = 0
    is_deleted: Optional[int] = 0

class CreateAndUpdateOwnerPortfolio(BaseModel):
    msisdn: str
    asset_id: Optional[str] = Field(alias='uid')
    asset_acronym: Optional[str] = Field(alias='name')
    number_of_asset: Optional[float] = 0.00
    date_created: Optional[str] = date
    date_modified: Optional[str] = date
    is_active: Optional[int] = 0
    lock: Optional[int] = 0

class CreateAndUpdateOwnerPortfolioTempList(BaseModel):
    msisdn: str
    asset_id: Optional[str] = Field(alias='uid')
    asset_acronym: Optional[str] = Field(alias='name')
    number_of_asset: Optional[float] = 0.00
    date_created: Optional[str] = date
    date_modified: Optional[str] = date
    is_active: Optional[int] = 0
    lock: Optional[int] = 0

class CreateAndUpdateSaleRequest(BaseModel):
    uid: str
    unit_price_no_markup: Optional[float] = 0.00
    msisdn: str
    description: str
    unit_price: Optional[float] = 0.00
    no_of_grain_sold: Optional[float] = 0.00
    no_markup_cost: Optional[float] = 0.00
    cost: Optional[float] = 0.00
    date_created: Optional[str] = date
    date_modified: Optional[str] = date
    is_processed: Optional[int] = 0

class CreateAndUpdateConfig(BaseModel):
    trx_fee: Optional[float] = 0.00
    tax: Optional[float] = 0.00
    min_limit: Optional[float] = 0.00
    max_limit: Optional[float] = 0.00
    currency: str
    equity_markup: Optional[float] = 0.00
    equity_offer_rate: Optional[float] = 0.00
    early_payment_fee: Optional[float] = 0.00
    setting_3: Optional[float] = 0.00
    time_stamp: Optional[str] = date

class Asset(CreateAndUpdateAsset):
    msisdn: str

    class Config:
        orm_mode = True

class OwnerPortfolio(CreateAndUpdateOwnerPortfolio):
    msisdn: str

    class Config:
        orm_mode = True

class OwnerPortfolioTempList(CreateAndUpdateOwnerPortfolioTempList):
    msisdn: str

    class Config:
        orm_mode = True

class SaleRequest(CreateAndUpdateSaleRequest):
    msisdn: str

    class Config:
        orm_mode = True
