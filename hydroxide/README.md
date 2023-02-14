# Hydroxide

```shell
docker container run -ti \
	--rm \
	--mount type=bind,src=$HOME/Data/hydroxide,dst=/root/.config/hydroxide \
	juli3nk/hydroxide \
		auth <username>
```

```shell
docker container run -ti \
	--rm \
	--mount type=bind,src=$HOME/Data/hydroxide,dst=/root/.config/hydroxide \
	juli3nk/hydroxide \
		carddav
```
