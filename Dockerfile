FROM python:3.9-alpine

WORKDIR /app

COPY requirements.txt /usr/src/app/

# Optionally upgrade pip
RUN pip install --upgrade pip

