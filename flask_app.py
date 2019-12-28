import os

import redis
from flask import Flask

app = Flask(__name__)
redis_hostname = os.environ.get('REDIS_HOSTNAME', "redis")
print(f"Redis run on: {redis_hostname} \n")
cache = redis.Redis(host=redis_hostname, port=6379)

@app.route('/')
def home():
    return "What is your price?\n" 

@app.route('/set_price/<int:price>')
def set_price(price):
    cache.set("price", price)
    return f"Price set to {price} \n"

@app.route('/get_price')
def get_price():
    price = int(cache.get("price"))
    return f"The price is {price}.\n"
