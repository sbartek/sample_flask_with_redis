FROM python:3.6-alpine
WORKDIR /app
RUN apk add --no-cache --update make
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . /app
CMD ["make", "redis_app"]
