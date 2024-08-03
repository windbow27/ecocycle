from Middleware.token import generate_token, get_token
from sqlalchemy.orm import Session
from datetime import date
from Models import models

def register_account(db: Session, username: str, password: str, fullname: str):
    new_user = models.Users(username=username, password=password, fullname=fullname, isAdmin=False)
    query = (
        db.query(models.Users)
        .filter(models.Users.username == username)
    )

    if query.first() is not None:
        return {"status": "error", "message": "Username already exists"}
    else:
        db.add(new_user)
        db.commit()
        return {"status": "success", "message": "Account created"}
    
def login_account(db: Session, username: str, password: str):
    query = (
        db.query(models.Users)
        .filter(models.Users.username == username)
        .filter(models.Users.password == password)
    ).first()
    if query is not None:
        return {"status": "success", "message": "Login successful", "token": generate_token(query.id, username)}
    else:
        return {"status": "error", "message": "Login failed"}
    
# Log in with token
def login_with_token(db: Session, token: str):
    return get_token(token)

def logout_account(db: Session, token: str):    
    return {"status": "success", "message": "Logged out"}