-- Создание таблицы chats
CREATE TABLE chats (
    id SERIAL PRIMARY KEY,
    uuid TEXT NOT NULL,
    waiting BOOLEAN NOT NULL,
    ai BOOLEAN NOT NULL,
    tags TEXT[],
    name CHARACTER VARYING,
    messager CHARACTER VARYING NOT NULL,
    is_awaiting_manager_confirmation BOOLEAN NOT NULL DEFAULT FALSE,
    archived BOOLEAN NOT NULL DEFAULT FALSE,
    blocked BOOLEAN NOT NULL DEFAULT FALSE,
    status CHARACTER VARYING(16) NOT NULL DEFAULT 'ongoing'
);

-- Создание таблицы messages
CREATE TABLE messages (
    id SERIAL PRIMARY KEY,
    chat_id INTEGER NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE,
    message TEXT NOT NULL,
    message_type CHARACTER VARYING NOT NULL,
    ai BOOLEAN,
    is_image BOOLEAN NOT NULL,
    FOREIGN KEY (chat_id) REFERENCES chats(id) ON DELETE CASCADE
);

-- Создание таблицы bot_settings
CREATE TABLE bot_settings (
    key TEXT NOT NULL PRIMARY KEY,
    value TEXT,
    updated_at TIMESTAMP WITHOUT TIME ZONE
);



