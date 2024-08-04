from Controllers import account, crud_article, crud_like, crud_comment
from fastapi import Depends, FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from Models.connect_db import SessionLocal, engine
from fastapi import FastAPI, File, Header, UploadFile
from fastapi.staticfiles import StaticFiles
from fastapi.encoders import jsonable_encoder
from fastapi.responses import StreamingResponse, JSONResponse
from yolov8.app import get_bytes_from_image, get_image_from_bytes, detect_sample_model, add_bboxs_on_img
import threading
from typing import List
import os
import shutil
import cv2
from ultralytics import YOLO
from io import BytesIO

app = FastAPI()
model = YOLO(r"D:\Workspace\ecocycle\backend\yolov8\best.pt")
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
@app.get("/search/articles_by_categories")
def show_all_articles_by_categories(category: str):
    return crud_article.show_all_articles_by_categories(db,category)
@app.get("/search/articles_by_keyword/{keyword}")
def show_all_articles_by_keyword(keyword: str):
    return crud_article.show_all_articles_by_keyword(db,keyword)

#article
@app.get("/article/show_all_articles")
def show_all_articles():
    return crud_article.show_all_articles(db)
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

UPLOAD_DIRECTORY = "uploaded_images"
if not os.path.exists(UPLOAD_DIRECTORY):
    os.makedirs(UPLOAD_DIRECTORY)

app.mount("/uploaded_images", StaticFiles(directory=UPLOAD_DIRECTORY), name="uploaded_images")

@app.post("/img_object_detection_to_img")
async def upload_image(file: UploadFile = File(...)):
    file_path = os.path.join(UPLOAD_DIRECTORY, file.filename)
    with open(file_path, "wb") as buffer:
        shutil.copyfileobj(file.file, buffer)
    
    # Read the uploaded image
    frame = cv2.imread(file_path)
    if frame is None:
        raise HTTPException(status_code=400, detail="Invalid image file")

    # Detect objects
    result = model.predict(frame, device='cpu')
    
    # Extract labels from predictions
    labels = []
    for cls in result[0].boxes.cls:
        label = model.names[int(cls)]
        if label:  # Check if the label is valid
            labels.append(label)
    
    # Draw bounding boxes on the image and plot the results
    frame_result = result[0].plot()
    cv2.imwrite(file_path, frame_result)

    # Convert image to bytes
    _, img_encoded = cv2.imencode('.jpg', frame_result)
    img_bytes = BytesIO(img_encoded.tobytes())
    
    # Create response with headers containing the detected label (only one label)
    detected_label = labels[0] if labels else "No Label"
    headers = {"Detected-Labels": detected_label}
    return StreamingResponse(content=img_bytes, headers=headers, media_type="image/jpeg")



@app.get("hightlight")
def hightlight(text:str):
    return crud_article.hightlight(db)