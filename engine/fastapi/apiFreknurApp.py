#!/usr/bin/env python3.6

import sys
import uvicorn
from fastapi import FastAPI
from pydantic import BaseModel

sys.path.insert(0,'/usr/local/lib/freknur/engine/fastapi/_system/')
import api_config

sys.path.insert(0,'/usr/local/lib/freknur/engine/fastapi/account/')
import api_account

sys.path.insert(0,'/usr/local/lib/freknur/engine/fastapi/loan/')
import api_loan

sys.path.insert(0,'/usr/local/lib/freknur/engine/fastapi/investment/')
import api_investment

sys.path.insert(0,'/usr/local/lib/freknur/engine/fastapi/shop/')
import api_shop


app = FastAPI(openapi_url="/api/v1/openapi.json")

app.include_router(api_config.config_router)
app.include_router(api_account.account_router)
app.include_router(api_loan.loan_router)
app.include_router(api_investment.investment_router)
app.include_router(api_shop.shop_router)

@app.get('/')
def root_api():
        return {"message":"Welcome to Freknur"}

if __name__ == "__main__":
    uvicorn.run("apiFreknurApp:app", host="127.0.0.1", port=8000, reload=False, log_level="info")
