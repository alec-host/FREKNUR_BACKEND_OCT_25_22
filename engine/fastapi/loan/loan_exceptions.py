class LoanDescriptionException(Exception):
    ...


class LoanDescriptionAlreadyExistError(LoanDescriptionException):
    def __init__(self):
        self.status_code = 409
        self.details = {"ERROR": "1","MESSAGE":"Loan Request exist"}
