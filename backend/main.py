from Controllers import account
from fastapi import Depends, FastAPI, HTTPException
from sqlalchemy.orm import Session
from fastapi.middleware.cors import CORSMiddleware
from Models.connect_db import SessionLocal, engine  # Import trực tiếp từ Models
from datetime import date
from typing import Union
from fastapi import FastAPI
from fastapi.encoders import jsonable_encoder
from fastapi.responses import JSONResponse
from pydantic import BaseModel

app = FastAPI()
db = SessionLocal()

app.add_middleware(
    CORSMiddleware,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# @app.get("/articles_by_category/{category}")
# def show_all_articles_by_category(category: str):
#     return search_by_category.show_all_articles_by_category(db,category)
# @app.get("/articles_by_keyword/{keyword}")
# def show_all_articles_by_keyword(keyword: str):
#     return search_by_keyword.show_all_articles_by_keyword(db,keyword)

@app.post("/account/register")
def register_account(username: str, password: str, fullname: str):
    return account.register_account(db,username,password,fullname)

@app.post("/account/login")
def login_account(username: str, password: str):
    return account.login_account(db,username,password)

@app.post("/account/login_with_token")
def login_with_token(token: str):
    return account.login_with_token(db,token)