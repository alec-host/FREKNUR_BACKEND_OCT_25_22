
import uuid

from datetime import datetime

from sqlalchemy import func
from sqlalchemy.orm import Session

from investment_schema import CreateAndUpdateAsset,CreateAndUpdateSaleRequest
from investment_model import AssetDescription,OwnerPortfolioDescription,OwnerPortfolioTempListDescription,SaleRequestDescription,ConfigDescription,SaleRequestDescription

#-.method: customer portfolio.
def _get_customer_porfolio(session: Session, _msisdn: str) -> OwnerPortfolioDescription:
    result = session.query(func.sum(OwnerPortfolioDescription.number_of_asset * AssetDescription.unit_price).label('total')).\
                           join(AssetDescription, AssetDescription.uid==OwnerPortfolioDescription.asset_id).\
                           filter(OwnerPortfolioDescription.msisdn==_msisdn).\
                           filter(OwnerPortfolioDescription.lock==0)

    return result.scalar()

#-.methid: lock customer assets.
def _lock_customer_asset_portfolio(session: Session, _msisdn: str) -> OwnerPortfolioDescription:
    _user  = session.query(OwnerPortfolioDescription).where(OwnerPortfolioDescription.msisdn==_msisdn,OwnerPortfolioDescription.lock==0).\
                           values(OwnerPortfolioDescription.lock==1)

    session.commit()

#-.method: size of the temp.
def _get_customer_porfolio_temp_cnt(session: Session,_msisdn: str) -> OwnerPortfolioTempListDescription:
    result = session.query(OwnerPortfolioTempListDescription._id).where(OwnerPortfolioTempListDescription.msisdn==_msisdn)

    return result.count()

#-.method: customer portfolio.
def _get_customer_porfolio(session: Session, _msisdn: str) -> OwnerPortfolioDescription:
    result = session.query(OwnerPortfolioDescription.msisdn,
                           OwnerPortfolioDescription.asset_id.label('uid'),
                           OwnerPortfolioDescription.asset_acronym.label('name'),
                           OwnerPortfolioDescription.number_of_asset,
                           AssetDescription.unit_price,
                           OwnerPortfolioDescription.lock.label('has_secured_loan'),
                           OwnerPortfolioDescription.date_created.label('purchase_date')).\
                           join(AssetDescription, AssetDescription.uid==OwnerPortfolioDescription.asset_id).\
                           filter(OwnerPortfolioDescription.msisdn==_msisdn).\
                           filter(OwnerPortfolioDescription.lock==0)

    return result.all()

#-.method: customer portfolio temp.
def _get_customer_porfolio_temp(session: Session, _msisdn: str) -> OwnerPortfolioTempListDescription:
    result = session.query(OwnerPortfolioTempListDescription.msisdn,
                           OwnerPortfolioTempListDescription.asset_id.label('uid'),
                           OwnerPortfolioTempListDescription.asset_acronym.label('name'),
                           OwnerPortfolioTempListDescription.number_of_asset,
                           AssetDescription.unit_price,
                           OwnerPortfolioTempListDescription.lock.label('has_secured_loan'),
                           OwnerPortfolioTempListDescription.date_created.label('purchase_date')).\
                           join(AssetDescription, AssetDescription.uid==OwnerPortfolioTempListDescription.asset_id).\
                           filter(OwnerPortfolioTempListDescription.msisdn==_msisdn).\
                           filter(OwnerPortfolioTempListDescription.lock==0)

    return result.all()

#-.method: get sale request.
def _get_sale_request_list(session: Session, _msisdn: str, _limit: int) -> SaleRequestDescription:
    result = session.query(func.sum(SaleRequestDescription.no_of_grain_sold).label('QTY'),
                           SaleRequestDescription.description,
                           SaleRequestDescription.uid,
                           SaleRequestDescription.unit_price_no_markup,
                           SaleRequestDescription.unit_price,
                           func.sum(SaleRequestDescription.no_of_grain_sold * SaleRequestDescription.unit_price).label('total_cost')).\
                           where(SaleRequestDescription.msisdn != _msisdn).\
                           group_by(SaleRequestDescription.uid,SaleRequestDescription.unit_price_no_markup,SaleRequestDescription.description,SaleRequestDescription.unit_price).\
                           limit(_limit)

    return result.all()

#-.method: get own sale request.
def _get_sale_owner_request_list(session: Session, _msisdn: str, _limit: int) -> SaleRequestDescription:
    result = session.query(func.sum(SaleRequestDescription.no_of_grain_sold).label('QTY'),
                           SaleRequestDescription.description,
                           SaleRequestDescription.uid,
                           SaleRequestDescription.unit_price,
                           func.sum(SaleRequestDescription.no_of_grain_sold * SaleRequestDescription.unit_price).label('total_cost')).\
                           filter(SaleRequestDescription.msisdn==_msisdn).\
                           group_by(SaleRequestDescription.uid,SaleRequestDescription.description,SaleRequestDescription.unit_price).\
                           limit(_limit)

    return result.all()

#-.method: get asset list.
def _get_asset_list(session: Session, _msisdn: str, _price_markup: float, _limit: int) -> AssetDescription:
    result = session.query(AssetDescription.uid,
                           AssetDescription.asset_acronym.label('acronym'),
                           AssetDescription.asset_name.label('name'),
                           (AssetDescription.unit_price + _price_markup).label('price'),
                           AssetDescription.asset_trend,
                           AssetDescription.date_created).limit(_limit)

    return result.all()


#-.method. get asset config params.
def _get_asset_settings_params(session: Session) -> ConfigDescription:
    trx_fee = 0.00
    min_limit = 0
    max_limit = 0
    equity_markup = 0.00
    equity_offer_rate = 0.00

    result = session.query(ConfigDescription.trx_fee,
                           ConfigDescription.min_limit,
                           ConfigDescription.max_limit,
                           ConfigDescription.equity_markup,
                           ConfigDescription.equity_offer_rate)

    for row in result:
        trx_fee = row['trx_fee']
        min_limit = row['min_limit']
        max_limit = row['max_limit']
        equity_markup = row['equity_markup']
        equity_offer_rate = row['equity_offer_rate']


    return trx_fee,min_limit,max_limit,equity_markup,equity_offer_rate

#-.method: config params (external).
def _get_asset_settings(session: Session) -> ConfigDescription:
    result = session.query(ConfigDescription.trx_fee.label('fee'),
                           ConfigDescription.min_limit,
                           ConfigDescription.max_limit,
                           ConfigDescription.currency)

    return result.one()

'''
#-.method own sale request list.
def _get_sale_owner_request_list(session: Session, _msisdn: str, _limit: int) -> SaleRequestDescription:
    result = session.query(func.sum(SaleRequestDescription.no_of_grain_sold).label('QTY'),
                           SaleRequestDescription.description,
                           SaleRequestDescription.uid,
                           SaleRequestDescription.unit_price_no_markup,
                           SaleRequestDescription.unit_price,
                           func.sum(SaleRequestDescription.no_of_grain_sold * SaleRequestDescription.unit_price).label('total_cost')).\
                           filter(SaleRequestDescription.msisdn==_msisdn).\
                           group_by(SaleRequestDescription.uid,SaleRequestDescription.unit_price_no_markup,SaleRequestDescription.description,SaleRequestDescription.unit_price).\
                           limit(_limit)

    return result.all()

#-.method sale request list.
def _get_sale_request_list(session: Session, _msisdn: str, _limit: int) -> SaleRequestDescription:
    result = session.query(func.sum(SaleRequestDescription.no_of_grain_sold).label('QTY'),
                           SaleRequestDescription.description,
                           SaleRequestDescription.uid,
                           SaleRequestDescription.unit_price,
                           func.sum(SaleRequestDescription.no_of_grain_sold * SaleRequestDescription.unit_price).label('total_cost')).\
                           filter(SaleRequestDescription.msisdn!=_msisdn).\
                           group_by(SaleRequestDescription.uid,SaleRequestDescription.description,SaleRequestDescription.unit_price).\
                           limit(_limit)

    return result.all()
'''

#-.method delete.
def _delete_own_sale_request(session: Session, _msisdn: str, _uid: str) -> SaleRequestDescription:
    obj = session.query(SaleRequestDescription).filter(SaleRequestDescription.uid==_uid,SaleRequestDescription.msisdn==_msisdn)
    session.delete(obj)
    session.commit()

#-.method delete.
def _delete_own_sale_request_temp(session: Session, _msisdn: str, _uid: str) -> SaleRequestDescription:
    obj = session.query(SaleRequestDescription).filter(SaleRequestDescription.uid==_uid,SaleRequestDescription.msisdn==_msisdn)
    session.delete(obj)
    session.commit()

