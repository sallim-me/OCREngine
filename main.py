import uvicorn
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import yaml

from models.RestfulModel import *
from routers import ocr
from utils.ImageHelper import *

app = FastAPI(title="Paddle OCR API",
              description="Custom API based on Paddle OCR and FastAPI")

# Cross-Origin Resource Sharing (CORS) settings
origins = [
    "*"
]
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"]
)

app.include_router(ocr.router)

if __name__ == "__main__":
    uvicorn.run(app=app, host="0.0.0.0", port=8000)
