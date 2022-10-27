
import sys

from datetime import datetime

from sqlalchemy.orm import Session

from loan_schema import CreateAndUpdateUnsecuredLoan,CreateAndUpdateSecuredLoan
from loan_model import LoanDescription,LoanTempDescription,LoanCollateralDescription

sys.path.insert(0,'/usr/local/lib/freknur/engine/fastapi/utils/')
import _uid_generator

date = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

#-.record new loan request.
def _create_unsecured_loan(session: Session, loan_info: CreateAndUpdateUnsecuredLoan) -> LoanDescription:
    loan_details = session.query(LoanDescription).filter(LoanDescription.msisdn == loan_info.msisdn, LoanDescription.reference_no == loan_info.reference_no).first()

    if loan_details is not None:
        pass
        
    loan_info.reference_no = 'LNR-'+str(_uid_generator.get_custom_alpha_uid())
    loan_info.collateral_percentage = 0.00
    loan_info.task_flag = 0
    loan_info.requested_by = loan_info.msisdn
    loan_info.date_created = date
    loan_info.date_modified = date
    loan_info.has_collateral = 0
    loan_info.is_processed = 0
    
    new_loan_info = LoanDescription(reference_no=loan_info.reference_no,
                                    msisdn=loan_info.msisdn,
                                    amount=loan_info.amount,
                                    collateral_percentage=loan_info.collateral_percentage,
                                    task_flag=loan_info.task_flag,
                                    requested_by=loan_info.requested_by,
                                    approved_by=loan_info.approved_by,
                                    has_collateral=loan_info.has_collateral,
                                    date_created=loan_info.date_created,
                                    date_modified=loan_info.date_modified,
                                    is_processed=loan_info.is_processed)
    session.add(new_loan_info)
    session.commit()
    session.refresh(new_loan_info)

    return new_loan_info

#-.record new loan request.
def _create_secured_loan(session: Session, loan_info: CreateAndUpdateSecuredLoan) -> LoanDescription:
    loan_details = session.query(LoanDescription).filter(LoanDescription.msisdn == loan_info.msisdn, LoanDescription.reference_no == loan_info.reference_no).first()

    if loan_details is not None:
        pass

    loan_info.reference_no = 'LNR-'+str(_uid_generator.get_custom_alpha_uid())
    loan_info.collateral_percentage = str(float(str(loan_info.collateral_percentage).replace("p",""))/100)
    loan_info.task_flag = 0
    loan_info.requested_by = loan_info.msisdn
    loan_info.date_created = date
    loan_info.date_modified = date
    loan_info.has_collateral = 1
    loan_info.is_processed = 0

    new_loan_info = LoanDescription(reference_no=loan_info.reference_no,
                                    msisdn=loan_info.msisdn,
                                    amount=loan_info.amount,
                                    collateral_percentage=loan_info.collateral_percentage,
                                    task_flag=loan_info.task_flag,
                                    requested_by=loan_info.requested_by,
                                    approved_by=loan_info.approved_by,
                                    has_collateral=loan_info.has_collateral,
                                    date_created=loan_info.date_created,
                                    date_modified=loan_info.date_modified,
                                    is_processed=loan_info.is_processed)
    session.add(new_loan_info)
    session.commit()
    session.refresh(new_loan_info)

    return new_loan_info

#-.record loan collateral.
def _create_loan_collateral_info(session: Session, total_portfolio: float, loan_info: CreateAndUpdateSecuredLoan) -> LoanCollateralDescription:
    collateral_details = session.query(LoanCollateralDescription).filter(LoanCollateralDescription.msisdn==collateral_info.msisdn).first()

    if loan_info is not None:
        pass
    
    new_collateral_info = LoanCollateralDescription(msisdn=loan_info.msisdn,
                                                    loan_amount=loan_info.amount,
                                                    portfolio_worth=total_portfolio,
                                                    collateral_percentage=str(float(str(loan_info.collateral_percentage).replace("p",""))/100),
                                                    is_processed=0)
    session.add(new_collateral_info)
    session.commit()
    session.refresh(new_collateral_info)

#-.method: check if customer has a loan.
def _has_existing_loan(session: Session, _msisdn: str) -> LoanTempDescription:
    result = session.query(LoanTempDescription.id).where(LoanTempDescription.msisdn==_msisdn)

    return result.count()

#-.method: has a queued loan request.
def _has_queued_loan(session: Session, _msisdn: str) -> LoanDescription:
    count = 0
    amount = 0
    result = session.query(LoanDescription.amount).where(LoanDescription.msisdn==_msisdn)
    for row in result:
        count = 1
        amount = row['amount']

    return [count,amount]

def _get_customer_loan_arrears(session: Session, _msisdn: str) -> LoanTempDescription:
    msisdn = 0
    amount = 0
    result = session.query(LoanTempDescription.msisdn,LoanTempDescription.loan_amount).where(LoanTempDescription.msisdn==_msisdn)
    for row in result:
        msisdn = row['msisdn']
        amount = row['loan_amount']

    return [msisdn,amount]
