#!/bin/bash

IMAGE="zasadus/zadanie1_proj_obj:latest"

if [[ "$(docker images -q $IMAGE 2> /dev/null)" == "" ]]; then
    echo "Obraz $IMAGE nie istnieje lokalnie. Pobieranie..."
    docker pull $IMAGE
else
    echo "Obraz $IMAGE już istnieje"
fi

docker run -it $IMAGE -name kontener_zasadus

docker rm kontener_zasadus