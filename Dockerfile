FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    poppler-utils \
    ghostscript \
    libreoffice \
    wkhtmltopdf \
    tesseract-ocr \
    unpaper \
    pngquant \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

CMD ["python", "main.py"]
