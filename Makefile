
deploy:
	gcloud run deploy my-php-app --source . --region europe-west8 --allow-unauthenticated

run-local:
	docker run -it -p 8080:8080 --env-file .env my-php-app
