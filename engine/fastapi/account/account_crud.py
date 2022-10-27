import sys
import uuid

from datetime import datetime

from sqlalchemy import or_,desc
from sqlalchemy.orm import Session

from account_schema import CreateAndUpdateUserAccount,CreateAndUpdateUserAccountExtra,TransferOperationItem
from account_model import UserAccountDescription,UserAcoountExraDescription,WalletTransactionDescription

sys.path.insert(0,'/usr/local/lib/freknur/engine/fastapi/utils/')
import _uid_generator

date = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

#-.method: create customer wallet.
def _create_wallet(session: Session, customer_info: CreateAndUpdateUserAccount) -> UserAccountDescription:
    customer_details = session.query(UserAccountDescription.uid).filter(UserAccountDescription.msisdn==customer_info.msisdn)
    if(int(customer_details.count()) == 0):
        new_customer_info = UserAccountDescription(uid='CW'+str(_uid_generator.get_custom_uid()),
                                                   msisdn=customer_info.msisdn,
                                                   balance='0.00',
                                                   reference_no='0',
                                                   county_id=None,
                                                   language_id=None,
                                                   password=customer_info.password,
                                                   salt=None,
                                                   date_created=date,
                                                   date_modified=date,
                                                   is_active=1,
                                                   is_suspended=0)

        session.add(new_customer_info)
        session.commit()
        session.refresh(new_customer_info)
    else:
        new_customer_info=None

    return new_customer_info

#-.method: check if customer has a loan.
def _account_suspended(session: Session, _msisdn: str) -> UserAccountDescription:
    result = session.query(UserAccountDescription.id).where(UserAccountDescription.msisdn==_msisdn,UserAccountDescription.is_suspended==1)

    return result.count()

#-.method: check if customer has a loan.
def _account_exist(session: Session, _msisdn: str) -> UserAccountDescription:
    result = session.query(UserAccountDescription.id).where(UserAccountDescription.msisdn==_msisdn)

    return result.count()

#-.method: get customer wallet balance.
def _get_customer_balance_db(session: Session, _msisdn: str) -> UserAccountDescription:
    result = session.query(UserAccountDescription.balance,UserAccountDescription.reference_no).where(UserAccountDescription.msisdn==_msisdn,UserAccountDescription.is_suspended==0,UserAccountDescription.is_active==1)

    return result.one()

#-.method: get customer wallet statement.
def _get_customer_wallet_statement(session: Session, _msisdn: str, _limit: int) -> WalletTransactionDescription:
    try:
        result = session.query(WalletTransactionDescription.reference_no.label('Receipt_No'),
                               WalletTransactionDescription.date_created.label('Transaction_Date'),
                               WalletTransactionDescription.narration.label('Details'),
                               WalletTransactionDescription.cr.label('CR'),
                               WalletTransactionDescription.dr.label('DR'),
                               WalletTransactionDescription.balance.label('Balance')).\
                               where(WalletTransactionDescription.is_archived==0,WalletTransactionDescription.msisdn==_msisdn).\
                               order_by(desc(WalletTransactionDescription.date_created)).\
                               limit(1000)
    except Exception as ex:
        raise ex
    finally:
        session.close()

    return result.all()

#-.method: get loan statement.
def _get_customer_loan_statement(session: Session, _msisdn: str, _limit: int) -> WalletTransactionDescription:
    _search_1 = 'LNR-%'
    _search_2 = 'LNRE-%'
    try:
        result = session.query(WalletTransactionDescription.reference_no.label('Receipt_No'),
                               WalletTransactionDescription.date_created.label('Transaction_Date'),
                               WalletTransactionDescription.narration.label('Details'),
                               WalletTransactionDescription.cr.label('CR'),
                               WalletTransactionDescription.dr.label('DR'),
                               WalletTransactionDescription.balance.label('Balance')).\
                               filter(or_(WalletTransactionDescription.reference_no.ilike(_search_1),WalletTransactionDescription.reference_no.ilike(_search_2))).\
                               filter(WalletTransactionDescription.is_archived==0,WalletTransactionDescription.msisdn==_msisdn).\
                               order_by(desc(WalletTransactionDescription.date_created)).\
                               limit(_limit)
    except Exception as ex:
        raise ex
    finally:
        session.close()

    return result.all()

#-.method: get asset statement.
def _get_customer_asset_statement(session: Session, _msisdn: str, _limit: int) -> WalletTransactionDescription:
    _search_1 = 'GRN%'
    _search_2 = 'BID%%'
    try:
        result = session.query(WalletTransactionDescription.reference_no.label('Receipt_No'),
                               WalletTransactionDescription.date_created.label('Transaction_Date'),
                               WalletTransactionDescription.narration.label('Details'),
                               WalletTransactionDescription.cr.label('CR'),
                               WalletTransactionDescription.dr.label('DR'),
                               WalletTransactionDescription.balance.label('Balance')).\
                               filter(or_(WalletTransactionDescription.reference_no.ilike(_search_1),WalletTransactionDescription.reference_no.ilike(_search_2))).\
                               filter(WalletTransactionDescription.is_archived==0,WalletTransactionDescription.msisdn==_msisdn).\
                               order_by(desc(WalletTransactionDescription.date_created)).\
                               limit(_limit)
    except Exception as ex:
        raise ex
    finally:
        session.close()
    
    return result.all()

#-.method: withdraw monies.
def _withdraw_monies_operation(session: Session, _msisdn: str, _amount: float):
    try:
        session.query(UserAccountDescription).filter(False)
        result = session.execute("CALL sProcWithdrawECash(:p_1,:p_2)",{'p_1': _amount, 'p_2': _msisdn})
    except:
        session.rollback()
        raise
    finally:
        session.close()
    
    return result.scalar()

#-.method: deposit monies.
def _deposit_monies_operation(session: Session, _msisdn: str, _amount: float):
    try:
        update = session.query(UserAccountDescription).filter_by(msisdn=_msisdn,is_suspended=0).first()
        update.balance = (update.balance + _amount)
        
        session.commit()
    except Exception as ex:
        raise ex
    finally:
        session.close()

#-.method: transfer monies.
def _wallet_transfer_operation(session: Session, transfer_info: TransferOperationItem):
    try:
        session.query(UserAccountDescription).filter(False)
        result = session.execute("CALL sProcWalletToWalletTransfer(:p_1,:p_2,:p_3,:p_4)",{'p_1':transfer_info.amount,'p_2':transfer_info.balance,'p_3':transfer_info.msisdn,'p_4':transfer_info.beneficiary_msisdn})
    except:
        session.rollback()
        raise
    finally:
        session.close()

    return result.scalar()
