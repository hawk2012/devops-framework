#!/bin/bash

CONFIG_FILE="config/servers.yaml"

SERVERS=$(cat $CONFIG_FILE | yq e '.servers' -)

function load_servers() {
  echo "$SERVERS" | yq e 'keys[]' -
}

function get_server_ip() {
  local name=$1
  echo "$SERVERS" | yq e ".\"$name\".ip" -
}

function get_server_user() {
  local name=$1
  echo "$SERVERS" | yq e ".\"$name\".user" -
}

function connect_to_server() {
  echo "Доступные серверы:"
  SERVER_LIST=($(load_servers))
  select name in "${SERVER_LIST[@]}"; do
    IP=$(get_server_ip "$name")
    USER=$(get_server_user "$name")
    echo "[+] Подключение к $name ($IP) как $USER"
    ssh "$USER@$IP"
    break
  done
}

connect_to_server