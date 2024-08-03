from sqlalchemy.orm import Session
from Models import models
from sqlalchemy.sql import func
from sqlalchemy import and_

def is_liked(db: Session, post_id: int, user_id: int):
    is_liked = (
        db.query(
            func.count(models.Post_Like.liked_by).label('is_liked')
        )
        .filter(and_(models.Post_Like.post_id == post_id, models.Post_Like.liked_by == user_id))
    ).all()
    
    return is_liked