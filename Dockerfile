FROM python:3.7.0-alpine

RUN apk update && \
	apk add --virtual\
		build-dependencies \
		build-base \
		openssl-dev \
		libffi-dev \ 
		libxslt-dev

RUN mkdir /usr/src/app
VOLUME /usr/src/app
WORKDIR /usr/src/app

COPY ./requirements.txt .
run pip install -r requirements.txt

ENV PYTHONUNBUFFERED 1
ENV version="0.2.3"

# seriously, if you have tips, don't be shy
LABEL maintainter="Gary Hendrick<gary.hendrick@gmail.com>"\
 version="${version}"\
 description="This image is used to start a basic scrapy build environment"

CMD ["environmentals.sh"]
