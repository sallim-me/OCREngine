# Use Python 3.10.17 slim base image
FROM python:3.10.17-slim

# Expose port
EXPOSE 8000

# Set working directory
WORKDIR /app

# Copy dependency file and install system dependencies
COPY requirements.txt /app/requirements.txt

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libgl1 \
        libgomp1 \
        libglib2.0-0 \
        libsm6 \
        libxrender1 \
        libxext6 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install -r requirements.txt

# Copy project files
COPY . /app

# Pre-download and extract model files
# RUN mkdir -p /root/.paddleocr/whl/det/en/ && \
#     mkdir -p /root/.paddleocr/whl/rec/en/ && \
#     curl -o /root/.paddleocr/whl/det/en/en_PP-OCRv3_det_infer.tar https://paddleocr.bj.bcebos.com/PP-OCRv3/english/en_PP-OCRv3_det_infer.tar && \
#     curl -o /root/.paddleocr/whl/rec/en/en_PP-OCRv4_rec_infer.tar https://paddleocr.bj.bcebos.com/PP-OCRv4/english/en_PP-OCRv4_rec_infer.tar && \
#     tar xf /root/.paddleocr/whl/det/en/en_PP-OCRv3_det_infer.tar -C /root/.paddleocr/whl/det/en/ && \
#     tar xf /root/.paddleocr/whl/rec/en/en_PP-OCRv4_rec_infer.tar -C /root/.paddleocr/whl/rec/en/ && \
#     rm -f /root/.paddleocr/whl/det/en/en_PP-OCRv3_det_infer.tar && \
#     rm -f /root/.paddleocr/whl/rec/en/en_PP-OCRv4_rec_infer.tar

# Start command
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--log-config", "./log_conf.yaml"]
