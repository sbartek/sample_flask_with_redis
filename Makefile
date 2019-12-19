app:
	gunicorn app:app --bind 0.0.0.0:5000 -w 4\
		--access-logfile logs/gunicorn-access.log\
		--error-logfile logs/gunicorn-error.log

set_price:
	curl 0.0.0.0:5000/set_price/159

get_price:
	curl 0.0.0.0:5000/get_price
