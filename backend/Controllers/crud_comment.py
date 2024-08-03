import sys
import os

# Thêm thư mục Models vào sys.path
models_path = os.path.abspath(os.path.join(os.path.dirname(__file__), '../../Models'))
if models_path not in sys.path:
    sys.path.append(models_path)

import pytz
from sqlalchemy.orm import Session
from Models import models  # Import các models từ thư mục Models
from datetime import datetime
from sqlalchemy import func, asc, desc
from sqlalchemy.orm.exc import MultipleResultsFound, NoResultFound
from sqlalchemy import and_, or_
from sqlalchemy.sql import func
from Models import models

def show_comments(db: Session, post_id: int):
    comments = (
        db.query(
            models.Comment.comment_id,
            models.Comment.comment,
            models.Comment.created_at,
            models.Comment.user_id,
        )
        .filter(models.Comment.post_id == post_id)
        .order_by(desc(models.Comment.created_at))
    ).all()
    return comments

def count_comments(db: Session, post_id: int):
    total_comments = (
        db.query(
            func.count(models.Comment.comment_id).label('sum_comments')
        )
        .filter(models.Comment.post_id == post_id)
    ).all()
    return total_comments

def add_comment(db: Session, post_id: int, user_id: int, comment_text: str):
    new_comment = models.Comment(
        post_id=post_id, 
        user_id=user_id, 
        comment=comment_text,
        created_at=datetime.now(pytz.timezone('Asia/Ho_Chi_Minh'))
    )
    db.add(new_comment)
    db.commit()
    return "Comment added successfully.", new_comment.created_at

def delete_comment(db: Session, comment_id: int, user_id: int):
    try:
        post_id = db.query(models.Comment).filter(models.Comment.comment_id == comment_id).first().post_id
        own_post = db.query(models.Post).filter(and_(models.Post.post_id == post_id, models.Post.user_created == user_id)).first()
        # Thực hiện xóa và kiểm tra số lượng bản ghi được xóa
        result = db.query(models.Comment).filter(
            and_(
                models.Comment.comment_id == comment_id,
                or_(
                    models.Comment.user_id == user_id,
                    models.Comment.user_id == 1,
                    models.Comment.user_id == own_post.user_created
                )
            )
        ).delete()
        
        if result == 0:
            # Nếu không có bản ghi nào được xóa, trả về thông báo lỗi
            return "You cannot delete this comment."
        
        db.commit()
        return "Comment deleted successfully."
    except Exception as e:
        db.rollback()  # Đảm bảo rollback nếu có lỗi xảy ra
        return f"An error occurred: {str(e)}"
    
def edit_comment(db: Session, comment_id: int, comment_text: str, user_id: int):
    try:
        result = db.query(models.Comment).filter(and_(models.Comment.comment_id == comment_id,
                                             models.Comment.user_id == user_id,
                                             )
                                        ).update({models.Comment.comment: comment_text,
                                                  models.Comment.created_at: datetime.now(pytz.timezone('Asia/Ho_Chi_Minh'))
                                                })
        if result == 0:
            # Nếu không có bản ghi nào được cập nhật, trả về thông báo lỗi
            return "You cannot edit this comment."
        db.commit()
        return "Comment edited successfully."
    except Exception as e:
        db.rollback()  # Đảm bảo rollback nếu có lỗi xảy ra
        return f"An error occurred: {str(e)}"