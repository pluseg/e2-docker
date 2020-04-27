# e2-docker

Dockerization of blog engine Aegea: [RU](https://blogengine.ru) or [EN](http://blogengine.me/).

## Install

1. Clone this git repo
   `git clone git@github.com:pluseg/e2-docker.git .`
2. Create `.env` file
   `cp .env.example .env`
3. Specify needed `VERSION` and `VIRTUAL_HOST`
4. Run with `--build` flag for the first time
   `docker-compose up -d --build`
5. Go to VIRTUAL_HOST address and fill the Aegeya setup form with data:
   ```
   DB Host: db
   DB User: root
   DB Pass: egeya
   DB Database: <select "egeya" from the list>
   Admin pass: <specify yours>
   ```
6. That's all.

![Installation screenshot](/install-screenshot.png)

## Start / Stop

```
docker-compose up -d
docker-compose stop
```

## Updates

- To update PHP version, go to .env, change version and run
  `docker-compose up -d`
- To update MySQL version, go to .env, change version and run
  `docker-compose up -d`
- To update blog version, go to .env, change version and run
  `docker-compose up -d`

It doesn't affect an important data as it's been stored in

- `./data/theme` — here you can paste your custom theme
- `./data/user` — all user-specific settings
- `./data/pictures` — uploaded images
- `./data/mysql` — database data
