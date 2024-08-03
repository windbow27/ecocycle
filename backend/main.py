from Controllers import account, crud_article, crud_like, crud_comment
from fastapi import Depends, FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from Models.connect_db import SessionLocal, engine
from fastapi import FastAPI, File
from fastapi.encoders import jsonable_encoder
from fastapi.responses import StreamingResponse
from yolov8.app import get_bytes_from_image, get_image_from_bytes, detect_sample_model, add_bboxs_on_img
import threading

app = FastAPI()
db = SessionLocal()

app.add_middleware(
    CORSMiddleware,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.post("/account/register")
def register_account(username: str, password: str, fullname: str):
    return account.register_account(db,username,password,fullname)

@app.get("/account/login")
def login_account(username: str, password: str):
    return account.login_account(db,username,password)

@app.get("/account/login_with_token")
def login_with_token(token: str):
    return account.login_with_token(db,token)

@app.post("/account/logout")
def logout_account(token: str):
    return account.logout_account(db,token)
#search
@app.get("/search/articles_by_category/{category}")
def show_all_articles_by_category(category: str):
    return crud_article.show_all_articles_by_category(db,category)
@app.get("/search/articles_by_keyword/{keyword}")
def show_all_articles_by_keyword(keyword: str):
    return crud_article.show_all_articles_by_keyword(db,keyword)

#article
@app.get("/article/show_article")
def show_article(post_id: int):
    return crud_article.show_article(db,post_id)

@app.post("/article/add_article")
def add_article(user_created: int, metal: bool, paper: bool, glass: bool, plastic: bool, cardboard: bool, battery:bool, post_title: str, post_text: str, url_cover: str):
    categories = []
    if metal:
        categories.append("metal")
    if paper:
        categories.append("paper")
    if glass:
        categories.append("glass")
    if plastic:
        categories.append("plastic")
    if cardboard:
        categories.append("cardboard")
    if battery:
        categories.append("battery")

    return crud_article.add_article(db,user_created,categories,post_title,post_text,url_cover)
@app.delete("/article/delete_article")
def delete_article(post_id: int, user_id: int):
    return crud_article.delete_article(db,post_id,user_id)

@app.put("/article/update_article")
def edit_article(post_id: int, user_id:int, category:str | None = None, post_title: str | None = None, post_text: str | None = None, url_cover: str | None = None):
    return crud_article.update_article(db,post_id, user_id, category, post_title, post_text,url_cover) 

#comment
@app.get("/article/comment/show_comments")
def show_comments(post_id: int):
    return crud_comment.show_comments(db,post_id)

@app.get("/article/comment/count_comments")
def count_comments(post_id: int):
    return crud_comment.count_comments(db,post_id)

@app.post("/article/comment/add_comment")
def add_comment(post_id: int, user_id: int, comment_text: str):
    return crud_comment.add_comment(db,post_id,user_id,comment_text)

@app.delete("/article/comment/delete_comment")
def delete_comment(comment_id: int, user_id: int):
    return crud_comment.delete_comment(db,comment_id,user_id)

@app.put("/article/comment/update_comment")
def update_comment(comment_id: int, user_id: int, comment_text: str):
    return crud_comment.update_comment(db,comment_id,user_id,comment_text)

#like
@app.get("/article/like/total_likes")
def total_likes(post_id: int):
    return crud_like.total_likes(db,post_id)

@app.post("/article/like/add_like")
def add_like(post_id: int, user_id: int):
    return crud_like.add_like(db,post_id,user_id)

@app.delete("/article/like/delete_like")
def delete_like(post_id: int, user_id: int):
    return crud_like.delete_like(db,post_id,user_id)

@app.post("/img_object_detection_to_img")
def img_object_detection_to_img(file: bytes = File(...)):
    """
    Object Detection from an image plot bbox on image

    Args:
        file (bytes): The image file in bytes format.
    Returns:
        Image: Image in bytes with bbox annotations.
    """
    input_image = get_image_from_bytes(file)
    predict = detect_sample_model(input_image)
    final_image = add_bboxs_on_img(image=input_image, predict=predict)
    return StreamingResponse(content=get_bytes_from_image(final_image), media_type="image/jpeg")


