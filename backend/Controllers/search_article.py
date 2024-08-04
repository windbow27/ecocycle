import sys
import os

# Thêm thư mục Models vào sys.path
models_path = os.path.abspath(os.path.join(os.path.dirname(__file__), '../../Models'))
if models_path not in sys.path:
    sys.path.append(models_path)

from sqlalchemy.orm import Session
from Models import models  # Import các models từ thư mục Models
from datetime import date
from sqlalchemy import func, asc, desc
from sqlalchemy.orm.exc import MultipleResultsFound, NoResultFound
from sqlalchemy import and_, or_
from sqlalchemy.sql import func,case
import sys
import crud_comment,crud_like

def show_all_articles_by_category(db: Session, category: str):
    query = (
        db.query(
            models.Post.post_id,
            models.Post.post_title,
            func.substr(models.Post.post_text, 1, 255).label('post_text'),
            models.Post.cover_url,
            models.Post.created_at,
            models.Category.category
        )
        .join(models.Post_Category, models.Post_Category.post_id == models.Post.post_id)
        .join(models.Category, models.Category.id == models.Post_Category.category_id)
        .filter(models.Category.category == category)
        .group_by(models.Post.post_id)
        .order_by(desc(models.Post.created_at))
    ).all()

    return query,crud_comment.count_comments,crud_like.total_likes  # Optional, if you need the results for further processing



def show_all_articles_by_keyword(db: Session, keyword: str):
    query_articles = (
        db.query(
            models.Post.post_id,
            models.Post.post_title, 
            func.substr(models.Post.post_text, 1, 255).label('post_text'),
            models.Post.cover_url, 
            models.Post.created_at,
            )        
        .filter(models.Post.post_title.ilike(f'%{keyword}%'))
        .group_by(models.Post.post_id)
        .order_by(desc(models.Post.created_at))
    ).all()
    return query_articles  # Optional, if you need the results for further processing