source jellyfin-config.conf
podman run \
 --detach \
 --label "io.containers.autoupdate=registry" \
 --name $serverName \
 --publish 8096:8096/tcp \
 --rm \
 --user $(id -u):$(id -g) \
 --userns keep-id \
 --volume jellyfin-cache:/cache:Z \
 --volume jellyfin-config:/config:Z \
 --mount type=bind,source=$mediaSource,destination=/media,ro=true,relabel=private \
 docker.io/jellyfin/jellyfin:latest
