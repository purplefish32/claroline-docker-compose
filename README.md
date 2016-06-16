# claroline-docker-compose

```
docker-compose up -d
```

## Example usage - install Claroline Connect verison 16.05 
```
docker-compose run claroline "curl packages.claroline.net/releases/latest/claroline-16.05.tar.gz | tar xzv --strip 1"

docker-compose run claroline "chmod -R 777 app/cache app/config app/logs app/sessions files web"
```
