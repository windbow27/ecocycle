import string
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

def show_article(db: Session, post_id: int):
    text = (
        db.query(
            models.Post.post_text,
        )
        .filter(models.Post.post_id == post_id)
    ).all()
    return text

def add_article(db: Session, user_created: int, categories: list[str], post_title: str, post_text: str, url_cover: str):
    new_article = models.Post(
        user_created=user_created,
        post_title=post_title,
        post_text=post_text,
        cover_url=url_cover,
        created_at=datetime.now(pytz.timezone('Asia/Ho_Chi_Minh'))
    )
    db.add(new_article)
    db.commit()
    db.refresh(new_article)
    
    category_id_list = []
    for category in categories:
        text = (
            db.query(
                models.Category.id,
            )
            .filter(models.Category.category==category)
        ).all()
        category_id_list.append(text[0][0])

    for category_id in category_id_list:
        new_post_category = models.Post_Category(
            post_id = new_article.post_id,
            category_id = category_id
        )
        db.add(new_post_category)
        db.commit()

    return "Article added successfully."

def delete_article(db: Session, post_id: int, user_id: int):
    try:
        # Thực hiện xóa và kiểm tra số lượng bản ghi được xóa
        result = db.query(models.Post).filter(
            and_(
                models.Post.post_id == post_id,
                or_(models.Post.user_created == user_id, user_id == 1)
            )
        ).delete()
        if result == 0:
            # Nếu không có bản ghi nào được xóa, trả về thông báo lỗi
            return "You cannot delete this article."
        
        db.commit()
        return "Article deleted successfully."
    except Exception as e:
        db.rollback()  # Đảm bảo rollback nếu có lỗi xảy ra
        return f"An error occurred: {str(e)}"
    
def edit_article(db: Session, post_id: int, user_id:int, category:str | None = None, post_title: str | None = None, post_text: str | None = None, url_cover: str | None = None):
    try:
        # Kiểm tra xem bài viết có tồn tại không
        post = db.query(models.Post).filter(models.Post.post_id == post_id).one()
        
        # Kiểm tra xem người dùng có quyền sửa bài viết không
        if post.user_created != user_id and user_id != 1:
            return "You cannot edit this article."
        
        # Cập nhật thông tin bài viết
        if category:
            text = (
                db.query(
                    models.Category.id,
                )
                .filter(models.Category.category==category)
            ).all()
            post_category = db.query(models.Post_Category).filter(models.Post_Category.post_id == post_id).delete()
            new_post_category = models.Post_Category(
                post_id = post_id,
                category_id = text[0][0],
            )
            db.add(new_post_category)
        if post_title:
            post.post_title = post_title
        if post_text:
            post.post_text = post_text
        if url_cover:
            post.cover_url = url_cover
        post.created_at=datetime.now(pytz.timezone('Asia/Ho_Chi_Minh'))

        db.commit()
        return "Article edited successfully."
    except NoResultFound:
        return "Article not found."
    except MultipleResultsFound:
        return "Multiple articles found."
    except Exception as e:
        db.rollback()
        return f"An error occurred: {str(e)}"    