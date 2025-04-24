# OCR Engine

# 1. Docker Compose Deployment

![Docker Pulls](https://img.shields.io/docker/pulls/kimbank/ocrengine)
![Docker Image Size](https://img.shields.io/docker/image-size/kimbank/ocrengine/latest)
![Docker Version](https://img.shields.io/docker/v/kimbank/ocrengine?sort=semver)
![Build](https://github.com/sallim-me/OCREngine/actions/workflows/docker.yml/badge.svg?branch=main)

## Prerequisites
- Docker Engine (20.10.0 or later)

## Installation
1. Clone the repository:
    ```bash
    git clone https://github.com/sallim-me/OCREngine.git
    ```
2. Navigate to the project directory:
    ```bash
    cd OCREngine
    ```
3. Build and run the Docker containers:
    ```bash
    docker compose up --build
    ```


# 2. Local Deployment

## Prerequisites
- Python 3.10 or later
- pip

## Installation
1. Clone the repository:
    ```bash
    git clone https://github.com/sallim-me/OCREngine.git
    ```
2. Navigate to the project directory:
    ```bash
    cd OCREngine
    ```
3. Install the required packages:
    ```bash
    pip install -r requirements.txt
    ```
    or
    ```bash
    pip install -r requirements.in
    ```

## Usage
1. Run the OCR engine:
    ```bash
    python main.py
    ```
    or
    ```bash
    python3 main.py
    ```
2. Access the API at `http://localhost:8000/docs` to test the OCR functionality.



