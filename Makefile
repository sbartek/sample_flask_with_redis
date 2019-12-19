app:
	gunicorn app:app\
	    --bind 0.0.0.0:5000 -w 4
