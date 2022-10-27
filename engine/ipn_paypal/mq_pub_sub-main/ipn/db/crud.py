from sqlalchemy.orm import Session

from model import IpnReceiptDescription
from schema import CreateAndUpdateIpnReceipt
from datetime import datetime

date = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
#method: log paypal ipn.
def _add_ipn_receipt(session: Session, ipn_info: CreateAndUpdateIpnReceipt) -> IpnReceiptDescription:
    details = session.query(IpnReceiptDescription).filter(IpnReceiptDescription.txn_id==ipn_info.get('txn_id')).first()
    #-.check duplicates.
    if details is None:
        IpnReceiptDescription.txn_id=ipn_info.get('txn_id')
        IpnReceiptDescription.ipn=ipn_info
        IpnReceiptDescription.date_created=date

        new_ipn = IpnReceiptDescription(txn_id=IpnReceiptDescription.txn_id,ipn=IpnReceiptDescription.ipn,date_created=IpnReceiptDescription.date_created)

        session.add(new_ipn)
        session.commit()
        session.refresh(new_ipn)
        session.close()

        return {"STATUS":"FAIL","DATA":[],"MESSAGE":"Record saved successfully."}
    else:
        new_ipn = None
        return {"STATUS":"FAIL","DATA":[],"MESSAGE":"Duplicate key"}


