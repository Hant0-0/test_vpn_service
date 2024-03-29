FROM python:3.10-alpine3.17

COPY requirements.txt /temp/requirements.txt
COPY core /core
WORKDIR /core
EXPOSE 8000

RUN apk add postgresql-client build-base postgresql-dev

RUN pip install -r /temp/requirements.txt
RUN adduser --disabled-password core-user

USER core-user
