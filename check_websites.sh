#!/bin/bash

# Масив сайтів
websites=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
)

# Назва лог-файлу
log_file="website_status.log"

# Очистити попередній лог
> "$log_file"

# Перевірка кожного сайту
for site in "${websites[@]}"; do
    http_status=$(curl -o /dev/null -s -w "%{http_code}" -L "$site")

    if [ "$http_status" -eq 200 ]; then
        echo "$site is UP" | tee -a "$log_file"
    else
        echo "$site is DOWN (Status code: $http_status)" | tee -a "$log_file"
    fi
done

echo "Результати записано у файл: $log_file"

