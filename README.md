# 🚀 DevOps test — Docker Nginx (A1)

Небольшое, тз от Яндекс_Браузер: статический сайт **"Hello from Skatinov_dev"** на Nginx в Docker-контейнере, запущенный через Docker Compose под WSL Ubuntu 24.04.

---

## 📦 Описание

- Контейнер с Nginx на базе лёгкого образа `nginx:alpine`.
- Статическая страница `index.html` с текстом **Hello from Skatinov_dev**.
- Запуск и управление через `docker-compose`.
- Всё крутится внутри WSL Ubuntu 24.04 на локальной машине.

---

## 🛠 Стек и требования

- 🛫 WSL **Ubuntu 24.04**
- 🐳 **Docker Engine**
- 📆 **Docker Compose**
- 🜐 Браузер (проверка `http://localhost:8080`)

---

## 📁 Структура проекта

```
devops-test
├── Dockerfile
├── docker-compose.yml
├── src
│   └── index.html        # Страница "Hello from Skatinovdev"
└── docs
    └── screenshots
        └── A1            # Скриншоты docker-compose и браузера
```

- `Dockerfile` — сборка образа на базе `nginx:alpine` и копирование `src/index.html` в веб-каталог Nginx.
- `docker-compose.yml` — сервис `web`, проброс порта `8080:80` и политика перезапуска `unless-stopped`.

---

## 🚱 Dockerfile

```dockerfile
FROM nginx:alpine

WORKDIR /usr/share/nginx/html
RUN rm -f /usr/share/nginx/html/*
COPY src/index.html /usr/share/nginx/html/index.html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

---

## ⚙️ docker-compose.yml

```yaml
version: "3.9"

services:
  web:
    build:
      context: .
      dockerfile: Dockerfile
    container_name: devops-test-web
    ports:
      - "8080:80"
    restart: unless-stopped
```

---

## ▶️ Запуск под WSL Ubuntu 24.04

```bash
# 1. Клонировать репозиторий
git clone https://github.com/thed1m3dr0ll/devops-test.git
cd devops-test

# 2. Собрать и запустить контейнер
docker-compose up -d --build

# 3. Проверить состояние сервиса
docker-compose ps

# 4. Проверить ответ Nginx через curl
curl http://localhost:8080 | head -n 5
```

После запуска страница доступна по адресу `http://localhost:8080` и отображает текст **Hello from Skatinov_dev**.

Остановить контейнер:

```bash
docker-compose down
```

---

## 🛶 Screenshots A1

Ниже скриншоты, подтверждающие выполнение задания A1:

- ✅ `A1-docker-compose-up.jpg` — успешный `docker-compose up -d --build`.
- ✅ `A1-docker-compose-ps.jpg` — контейнер `devops-test-web` в состоянии `Up`.
- ✅ `A1-curl-localhost.jpg` — ответ Nginx с кодом 200 на `curl http://localhost:8080`.
- ✅ `A1-browser-ok.jpg` — страница в браузере с текстом **Hello from Skatinov_dev**.

<p align="center"><em>Screenshots A1</em></p>
<p align="center"><img src="docs/screenshots/A1/A1-docker-compose-up.jpg" alt="A1 docker-compose up" width="75%"></p>
<p align="center"><img src="docs/screenshots/A1/A1-docker-compose-ps.jpg" alt="A1 docker-compose ps" width="75%"></p>
<p align="center"><img src="docs/screenshots/A1/A1-curl-localhost.jpg" alt="A1 curl localhost" width="75%"></p>
<p align="center"><img src="docs/screenshots/A1/A1-browser-ok.jpg" alt="A1 browser localhost" width="75%"></p>

---

## 📋 Кратко о задании A1

- 🚱 Собрать Docker-образ на базе `nginx:alpine` с кастомным `index.html`.
- 🌐 Поднять сервис через `docker-compose` с пробросом порта `8080 → 80`.
- 🔍 Зафиксировать результат скриншотами (`up`, `ps`, `curl`, браузер) в `docs/screenshots/A1`.
- 📝 Описать всё в этом README.md и выложить в GitHub репозиторий `devops-test`.

---


