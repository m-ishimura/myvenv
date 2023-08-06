#!/usr/bin/env bash
# exit on error
set -o errexit

pip install -r requirements.txt

python manage.py collectstatic --no-input
python manage.py migrate
python manage.py superuser
python manage.py makemigrations polls     #pollsアプリマイグレーション用
python manage.py sqlmigrate polls 0001
