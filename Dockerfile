FROM python:3.6-buster

RUN apt-get update \
    && apt-get -y install \
    build-essential \
    tesseract-ocr \
    libtesseract4 \
    libtesseract-dev \
    libleptonica-dev

RUN mkdir /usr/src/app
WORKDIR /usr/src/app
COPY ./requirements.txt .
RUN python -m pip install -r requirements.txt

ENV PYTHONUNBUFFERED 1
 
CMD jupyter notebook --port 8888 --ip 0.0.0.0 --allow-root --NotebookApp.token='' --notebook-dir='/src'
