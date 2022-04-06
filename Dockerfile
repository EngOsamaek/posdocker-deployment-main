FROM python:3.10-alpine3.14

ENV PYTHONUNBUFFERED 1
ENV PATH="/scripts:${PATH}"
COPY ./requirements.txt /requirements.txt

RUN apk update \
    && apk add --virtual build-deps gcc python3-dev musl-dev libc-dev linux-headers \
    && apk add --no-cache mariadb-dev build-base postgresql-dev

RUN pip install -r /requirements.txt
RUN apk del build-deps

RUN mkdir /app
COPY ./POS_Demo /app
WORKDIR /app
COPY ./scripts /scripts

RUN chmod +x /scripts/*

RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static

RUN adduser -D user
RUN chown -R user:user /vol
RUN chmod -R 755 /vol/web
RUN chown user:user /app/POS_App/migrations
USER user


CMD [ "run.sh" ]