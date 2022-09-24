DSN=postgresql://greenlight:pa55word@localhost:5433/?sslmode=disable
PATH=./migrations

migrate-up:
	@migrate -path ${PATH} -database ${DSN} up

migrate-down:
	@migrate -path ${PATH} -database ${DSN} down

dc-up:
	docker-compose up -d

dc-down:
	docker-compose down

