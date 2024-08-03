
from PIL import Image
import io
import pandas as pd
import numpy as np
from typing import Optional
from ultralytics import YOLO
from ultralytics.utils.plotting import Annotator, colors
import os

# Initialize the models
# Get the current directory of the script
current_dir = os.path.dirname(os.path.abspath(__file__))

# Use a relative path to the model file
model_path = os.path.join(current_dir, 'best.pt')

# Initialize the model with the relative path
model_sample_model = YOLO(model_path)

def get_image_from_bytes(binary_image: bytes) -> Image:
    """Convert image from bytes to PIL RGB format"""
    input_image = Image.open(io.BytesIO(binary_image)).convert("RGB")
    return input_image

def get_bytes_from_image(image: Image) -> bytes:
    """Convert PIL image to Bytes"""
    return_image = io.BytesIO()
    image.save(return_image, format='JPEG', quality=85)  # save the image in JPEG format with quality 85
    return_image.seek(0)  # set the pointer to the beginning of the file
    return return_image

def transform_predict_to_df(results: list, labeles_dict: dict) -> pd.DataFrame:
    """Transform predict from yolov8 (torch.Tensor) to pandas DataFrame."""
    predict_bbox = pd.DataFrame(results[0].to("cpu").numpy().boxes.xyxy, columns=['xmin', 'ymin', 'xmax','ymax'])
    predict_bbox['confidence'] = results[0].to("cpu").numpy().boxes.conf
    predict_bbox['class'] = (results[0].to("cpu").numpy().boxes.cls).astype(int)
    predict_bbox['name'] = predict_bbox["class"].replace(labeles_dict)
    return predict_bbox

def get_model_predict(model: YOLO, input_image: Image, save: bool = False, image_size: int = 1248, conf: float = 0.5, augment: bool = False) -> pd.DataFrame:
    """Get the predictions of a model on an input image."""
    predictions = model.predict(
                        imgsz=image_size, 
                        source=input_image, 
                        conf=conf,
                        save=save, 
                        augment=augment,
                        flipud= 0.0,
                        fliplr= 0.0,
                        mosaic = 0.0,
                        )
    predictions = transform_predict_to_df(predictions, model.model.names)
    return predictions

def add_bboxs_on_img(image: Image, predict: pd.DataFrame()) -> Image:
    """Add a bounding box on the image"""
    annotator = Annotator(np.array(image))
    predict = predict.sort_values(by=['xmin'], ascending=True)
    for i, row in predict.iterrows():
        text = f"{row['name']}: {int(row['confidence']*100)}%"
        bbox = [row['xmin'], row['ymin'], row['xmax'], row['ymax']]
        annotator.box_label(bbox, text, color=colors(row['class'], True))
    return Image.fromarray(annotator.result())

def detect_sample_model(input_image: Image) -> pd.DataFrame:
    """Predict from sample_model. Base on YoloV8"""
    predict = get_model_predict(
        model=model_sample_model,
        input_image=input_image,
        save=False,
        image_size=640,
        augment=False,
        conf=0.5,
    )
    return predict


