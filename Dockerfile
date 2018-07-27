FROM python:3.7.0-alpine

RUN apk update && \
	apk add --virtual \
		build-dependencies \
		build-base \
		openssl-dev \
		libffi-dev \ 
		libxslt-dev \
		python-dev

RUN mkdir /usr/src/app

WORKDIR /usr/src/app
COPY ./requirements.txt .
run pip install -r requirements.txt

ENV PYTHONUNBUFFERED 1

COPY . .


CMD ["python", "scraping.py"]
