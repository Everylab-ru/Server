CREATE TABLE nsi_file_types
(
    id   INTEGER      NOT NULL,
    name VARCHAR(255) NOT NULL,

    CONSTRAINT nsi_file_type_pkey PRIMARY KEY (id)
);

CREATE TABLE files
(
    id           INTEGER      NOT NULL,
    url          UUID         NOT NULL,
    user_id      UUID,
    file_type_id INTEGER      NOT NULL,
    name         VARCHAR(255) NOT NULL,
    format       VARCHAR(255) NOT NULL,

    CONSTRAINT files_pkey PRIMARY KEY (id),

    CONSTRAINT files_file_type_id_fkey FOREIGN KEY (file_type_id) REFERENCES nsi_file_types (id),
    CONSTRAINT files_user_id_fkey FOREIGN KEY (user_id) REFERENCES users (id)
);

INSERT INTO nsi_file_types (id, name)
VALUES (1, 'Курсовая работа'),
       (2, 'Лабораторная работа'),
       (3, 'Дипломная работа');