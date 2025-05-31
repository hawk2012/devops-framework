#!/bin/bash

LOGFILE="logs/activity.log"

log_action() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') [ACTION] $1" >> "$LOGFILE"
}

show_menu() {
  echo "=== DevOps Framework ==="
  echo "1. Подключиться к серверу"
  echo "2. Управление Kubernetes"
  echo "3. Бэкап в S3"
  echo "4. Zabbix алерты"
  echo "5. GitLab CI пайплайн"
  echo "6. Отчёт в Confluence"
  echo "0. Выход"
}

while true; do
  show_menu
  read -p "Выберите действие: " choice

  case $choice in
    1)
      source scripts/connect.sh
      log_action "Подключение к серверу"
      ;;
    2)
      source scripts/k8s.sh
      log_action "Управление Kubernetes"
      ;;
    3)
      source scripts/s3.sh
      log_action "Бэкап в S3"
      ;;
    4)
      source scripts/zabbix.sh
      log_action "Получение Zabbix алертов"
      ;;
    5)
      source scripts/gitlab.sh
      log_action "Запуск GitLab CI пайплайна"
      ;;
    6)
      source scripts/confluence.sh
      log_action "Создание страницы в Confluence"
      ;;
    0)
      echo "Выход..."
      exit 0
      ;;
    *)
      echo "Неверный выбор"
      ;;
  esac
done
