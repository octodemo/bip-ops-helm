# Build

```sh
docker build -t wlpxy-nginx:latest .
```

# Run (locally)

```sh
# Add a -d to daemonize it and run in background.
docker run --name nginxtest --rm -p 1280:1280 wlpxy-nginx:latest
```
