#!/bin/sh
set -e

echo "🔑 Создаём docker config..."

DOCKER_USER='docker'
DOCKER_REGISTRY="registry.robointerativo.org"
PASSWD=$(echo "${DOCKER_USER}:${DOCKER_TOKEN}" | tr -d '\n' | base64 -w 0)

DOCKER_REGISTRY2="docker-int.robointerativo.org"


CONFIG="{\"auths\": {
  \"${DOCKER_REGISTRY}\": {\"auth\": \"${PASSWD}\"},

}}"

echo "$CONFIG" > config.json
DOCKER_CONFIG=$(echo "$CONFIG" | base64 -w 0)

# Подставляем в secret2.yml
sed -i "s|DOCKER_CONFIG|${DOCKER_CONFIG}|g" k8s/secret2.yml

echo "✅ config.json:"
cat config.json
echo "✅ k8s/secret2.yml:"
cat k8s/secret2.yml
