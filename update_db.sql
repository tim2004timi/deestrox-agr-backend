-- Скрипт для обновления базы данных
-- Выполните эти команды в PostgreSQL для исправления автоинкрементных полей

-- Создаем последовательности для автоинкрементных полей
CREATE SEQUENCE IF NOT EXISTS chats_id_seq;
CREATE SEQUENCE IF NOT EXISTS messages_id_seq;

-- Устанавливаем текущие значения последовательностей
SELECT setval('chats_id_seq', COALESCE((SELECT MAX(id) FROM chats), 0) + 1, false);
SELECT setval('messages_id_seq', COALESCE((SELECT MAX(id) FROM messages), 0) + 1, false);

-- Изменяем колонки на SERIAL (автоинкрементные)
ALTER TABLE chats ALTER COLUMN id SET DEFAULT nextval('chats_id_seq');
ALTER TABLE chats ALTER COLUMN id SET NOT NULL;
ALTER TABLE chats ALTER COLUMN id SET DATA TYPE INTEGER;

ALTER TABLE messages ALTER COLUMN id SET DEFAULT nextval('messages_id_seq');
ALTER TABLE messages ALTER COLUMN id SET NOT NULL;
ALTER TABLE messages ALTER COLUMN id SET DATA TYPE INTEGER;

-- Привязываем последовательности к таблицам
ALTER SEQUENCE chats_id_seq OWNED BY chats.id;
ALTER SEQUENCE messages_id_seq OWNED BY messages.id;

-- Добавляем значение по умолчанию для поля is_awaiting_manager_confirmation
ALTER TABLE chats ALTER COLUMN is_awaiting_manager_confirmation SET DEFAULT FALSE;

-- Обновляем существующие записи, где is_awaiting_manager_confirmation = NULL
UPDATE chats SET is_awaiting_manager_confirmation = FALSE WHERE is_awaiting_manager_confirmation IS NULL; 