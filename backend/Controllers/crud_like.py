import sys
import os

# Thêm thư mục Models vào sys.path
models_path = os.path.abspath(os.path.join(os.path.dirname(__file__), '../../Middleware'))
if models_path not in sys.path:
    sys.path.append(models_path)

import pytz
from sqlalchemy.orm import Session
from Models import models
from datetime import datetime
from sqlalchemy import func
from sqlalchemy.orm.exc import MultipleResultsFound, NoResultFound
from sqlalchemy import and_, or_
from sqlalchemy.sql import func
from Middleware.like import is_liked

def total_likes(db: Session, post_id: int):
    total_likes = (
        db.query(
            func.count(models.Post_Like.liked_by).label('total_likes')
        )
        .filter(models.Post_Like.post_id == post_id)
    ).all()
    return total_likes

def add_like(db: Session, post_id: int, user_id: int):
    if is_liked(db, post_id, user_id)[0][0] == 1:
        return "User has already liked this post."
    new_like = models.Post_Like(
        post_id = post_id, 
        liked_by = user_id,
         liked_at=datetime.now(pytz.timezone('Asia/Ho_Chi_Minh'))
    )
    db.add(new_like)
    db.commit()
    return "Post liked successfully." , new_like.liked_at

def delete_like(db: Session, post_id: int, user_id: int):
    if is_liked(db, post_id, user_id)[0][0] == 0:
        return "User has not liked this post."
    db.query(models.Post_Like).filter(and_(models.Post_Like.post_id == post_id, models.Post_Like.liked_by == user_id)).delete()
    db.commit()
    return "Post unliked successfully."