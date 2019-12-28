.PHONY: localhost_app
localhost_app:
	export REDIS_HOSTNAME=localhost; sh sbin/run_app.sh

.PHONY: redis_app
redis_app:
	export REDIS_HOSTNAME=redis; sh sbin/run_app.sh

.PHONY: get_home
get_home:
	curl 0.0.0.0

.PHONY: set_price
set_price:
	curl 0.0.0.0/set_price/159

.PHONY: get_price
get_price:
	curl 0.0.0.0/get_price
