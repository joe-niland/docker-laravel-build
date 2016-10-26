# Build box for Laravel projects

## Building

docker build -t joeniland/docker-laravel-build .

## Testing the Box

docker run -it --volume=/path/to/your/laravel/project:/localDebugRepo --workdir="/localDebugRepo" --memory=4g --memory-swap=4g --entrypoint=/bin/ash joeniland/docker-laravel-build:latest
