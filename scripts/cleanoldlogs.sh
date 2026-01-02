#!/bin/bash

# Проверка количества аргументов
if [ $# -ne 2 ]; then
    echo "Ошибка: необходимо указать 2 аргумента"
    echo "Использование: $0 <путь_к_директории> <количество_дней>"
    exit 1
fi

DIR_PATH="$1"
DAYS="$2"

# Проверка существования директории
if [ ! -d "$DIR_PATH" ]; then
    echo "Ошибка: директория '$DIR_PATH' не существует"
    exit 1
fi

# Проверка что второй аргумент - число
if ! [[ "$DAYS" =~ ^[0-9]+$ ]]; then
    echo "Ошибка: количество дней должно быть числом"
    exit 1
fi

# Поиск .log файлов старше N дней
echo "Поиск .log файлов старше $DAYS дней в директории: $DIR_PATH"
echo ""

FILES=$(find "$DIR_PATH" -name "*.log" -type f -mtime +$DAYS)

if [ -z "$FILES" ]; then
    echo "Файлы .log старше $DAYS дней не найдены"
    exit 0
fi

# Вывод списка файлов
echo "Найдены следующие файлы для удаления:"
echo "$FILES"
echo ""

# Подсчет количества файлов
FILE_COUNT=$(echo "$FILES" | wc -l)
echo "Всего файлов: $FILE_COUNT"
echo ""

# Запрос подтверждения
read -p "Удалить эти файлы? (Y/N): " CONFIRM

if [ "$CONFIRM" = "y" ] || [ "$CONFIRM" = "Y" ]; then
    echo "$FILES" | xargs rm -f
    echo "Файлы успешно удалены"
else
    echo "Отменено. Файлы не удалены"
fi
