import jwt
from typing import Union, Any
from datetime import datetime, timedelta

SECURITY_ALGORITHM = 'HS256'
SECRET_KEY = '123456'

def generate_token(userid: Union[int, Any], username: Union[str, Any]) -> str:
    expire = datetime.now() + timedelta(
        seconds=60 * 15 # Expire in 15 minutes
    )
    to_encode = {
        "exp": expire, "userid": userid, "username": username
    }
    encoded_jwt = jwt.encode(to_encode, SECRET_KEY, algorithm=SECURITY_ALGORITHM)
    return encoded_jwt

def get_token(token: str):
    try:
        decoded = jwt.decode(token, SECRET_KEY, algorithms=[SECURITY_ALGORITHM])
        return {"status": "success", "message": "Token is valid", "userid": decoded["userid"], "username": decoded["username"]}
    except jwt.ExpiredSignatureError:
        return {"status": "error", "message": "Token expired"}
    except jwt.InvalidTokenError:
        return {"status": "error", "message": "Invalid token"}