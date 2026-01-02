# базовый образ nginx на alpine для лёгкого и предсказуемого контейнера
FROM nginx:alpine

# рабочая директория совпадает с корнем статичных файлов nginx
WORKDIR /usr/share/nginx/html

# очищаю дефолтный контент nginx, чтобы не мешался моему сайту
RUN rm -f /usr/share/nginx/html/*

# копирую свой index.html из папки src проекта внутрь контейнера
COPY src/index.html /usr/share/nginx/html/index.html

# фиксирую публичный HTTP-порт сервиса
EXPOSE 80

# запускаю nginx в foreground, чтобы контейнер не завершался сразу после старта
CMD ["nginx", "-g", "daemon off;"]
