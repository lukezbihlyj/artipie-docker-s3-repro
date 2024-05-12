#!/bin/bash

echo "[+] Requesting upload UUID..."

uploadUuid=$(curl -is \
    -X POST \
    -H "Authorization: Basic YXJ0aXBpZTphcnRpcGll" \
    "http://localhost:8083/v2/test-image/blobs/uploads/" \
    | grep 'Docker-Upload-UUID: ' \
    | grep -Eo '[0-9a-z]+\-[0-9a-z]+\-[0-9a-z]+\-[0-9a-z]+\-[0-9a-z]+')

echo "[+] Found UUID: ${uploadUuid}"
echo "[+] Uploading the image layer..."

curl -X PATCH \
    -H "Authorization: Basic YXJ0aXBpZTphcnRpcGll" \
    -H "Content-Length: 6314729" \
    -H "Content-Type: application/octet-stream" \
    --data-binary "@docker-image-layer" \
    "http://localhost:8083/v2/test-image/blobs/uploads/$uploadUuid"
