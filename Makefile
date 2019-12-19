.PHONY: app get_home set_price get_price

app:
	gunicorn flask_app:app --bind 0.0.0.0:5000 -w 4\
		--access-logfile logs/gunicorn-access.log\
		--error-logfile logs/gunicorn-error.log

get_home:
	curl 0.0.0.0:5000

set_price:
	curl 0.0.0.0:5000/set_price/159

get_price:
	curl 0.0.0.0:5000/get_price
