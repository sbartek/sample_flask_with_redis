.PHONY: get_home set_price get_price

.PHONY: localhost_app
localhost_app:
	export REDIS_HOSTNAME=localhost; sh sbin/run_app.sh

.PHONY: redis_app
redis_app:
	export REDIS_HOSTNAME=redis; sh sbin/run_app.sh

get_home:
	curl 0.0.0.0

set_price:
	curl 0.0.0.0/set_price/159

get_price:
	curl 0.0.0.0/get_price

.PHONY: build_and_push
build_and_push: build_redis push_redis build_flask_for_redis push_flask_for_redis

.PHONY: build_redis
build_redis:
	docker build --tag=barteks/redis -f redis/Dockerfile .

.PHONY: build_flask_for_redis
build_flask_for_redis:
	docker build --tag=barteks/flaskappforredis -f app/Dockerfile .

.PHONY: push_redis
push_redis:
	docker push barteks/redis

.PHONY: push_flask_for_redis
push_flask_for_redis:
	docker push barteks/flaskappforredis

.PHONY: run_redis
run_redis:
	docker run --detach --publish=6379:6379 --name=redis barteks/redis

.PHONY: run_flask_for_redis
run_flask_for_redis:
	docker run --detach --publish=8080:80 --name=flaskappforredis barteks/flaskappforredis
