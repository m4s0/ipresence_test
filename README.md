# iPresence Tech Test

#### Docker

```
docker build
```

```
docker-composer up -d
```

#### Run Application

add to /etc/hosts

```
127.0.0.1   api.ipresence.com   ipresence.com
```

example:

```
http://api.ipresence.com/shout/albert-einstein?limit=7
```

#### Tests

run tests

```
docker-compose exec php-fpm sh -lc "./vendor/bin/phpunit"
````
