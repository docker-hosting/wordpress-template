# Wordpress Template for Docker
In order to use this template, just clone this repo or create a new file called `docker-compose.yml` and insert the content of this repo's file. Then you need to create a `.env` file with the following environment variables (these will be filled in the docker compose file):

```bash
CONTAINER_NAME_WP=Wordpress-Template
CONTAINER_NAME_DB=Database-Template
URL=mysite.local
DB_PASSWORD=someDatabasepassword
```

Then run `docker-compose up -d` and you can install your Wordpress website!

In order to create your mail addresses head over to https://github.com/tomav/docker-mailserver, for creating aliases look at https://github.com/tomav/docker-mailserver/wiki/Configure-Aliases.
