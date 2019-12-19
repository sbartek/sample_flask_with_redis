import redis
from flask import Flask

app = Flask(__name__)
cache = redis.Redis(host='localhost', port=6379)


@app.route('/')
def home():
    return "What is your price?"

@app.route('/set_price/<int:price>')
def set_price(price):
    cache.set("price", price)
    return f"Price set to {price}"

@app.route('/get_price')
def get_price():
    price = int(cache.get("price"))
    return f"The price is {price}."
