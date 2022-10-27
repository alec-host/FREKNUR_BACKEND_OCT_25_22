
from datetime import datetime

from sqlalchemy.orm import Session

from config_schema import CreateAndUpdateActivityLog
from config_model import ActivityLogDescription

#-.record new loan request.
def _record_activity_log(session: Session, activity_info: CreateAndUpdateActivityLog) -> ActivityLogDescription:
    date = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    details = session.query(ActivityLogDescription).filter(ActivityLogDescription.msisdn==activity_info.msisdn)

    if details is not None:
        pass

    new_activity_info = ActivityLogDescription(msisdn=activity_info.msisdn,
                                               activity=activity_info.activity,
                                               time_stamp=date,
                                               flag=0)
    session.add(new_activity_info)
    session.commit()
    session.refresh(new_activity_info)
    session.close()

    return new_activity_info
