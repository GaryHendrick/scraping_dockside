FROM python:3.6.6-alpine

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
RUN pip install -r requirements.txt

RUN scrapy bench
 
ENV PYTHONUNBUFFERED 1
ENV version="1.0.3"

# seriously, if you have tips, don't be shy
LABEL maintainter="Gary Hendrick<gary.hendrick@gmail.com>"\
 version="${version}"\
 description="This image is used to start a basic scrapy build environment"

CMD ["./environmentals.sh"]
