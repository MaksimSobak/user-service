# User Service

Простой REST API сервис на FastAPI с использованием PostgreSQL и Alembic для управления миграциями базы данных.

Проект создан для демонстрации работы с Docker, Docker Compose, автоматическими тестами на pytest и CI автоматизацией через GitHub Actions.

Стек:

- Python 3.12
- FastAPI
- PostgreSQL
- SQLAlchemy
- Alembic
- Docker
- Docker Compose
- Pytest
- GitHub Actions

Возможности

- Создание REST API на FastAPI
- Работа с PostgreSQL
- Управление миграциями базы данных через Alembic
- Запуск приложения и базы данных через Docker Compose
- Автоматическая проверка проекта через GitHub Actions

Как запустить проект:

Клонировать репозиторий:

```bash
git clone <repository-url>
cd user-service

Запуск приложения:

docker compose up --build

Перейти в браузере:

http://localhost:8000

Миграция базы данных:

docker compose exec user-service alembic upgrade head

Запуск тестов:

pytest

====================================================================================================================================

В проекте настроен GitHub Actions workflow.

При каждом push в ветку main автоматически выполняются:

сборка Docker-образа;
запуск сервисов через Docker Compose;
проверка доступности приложения.

====================================================================================================================================


user-service/
├── app/
├── tests/
├── alembic/
├── Dockerfile
├── docker-compose.yml
├── requirements.txt
└── .github/
    └── workflows/
