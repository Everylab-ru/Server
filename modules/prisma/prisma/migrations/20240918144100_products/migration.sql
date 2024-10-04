CREATE TABLE nsi_product_type
(
    id   INTEGER      NOT NULL,
    name VARCHAR(255) NOT NULL,

    CONSTRAINT nsi_product_type_pkey PRIMARY KEY (id)
);

CREATE TABLE products
(
    id              INTEGER        NOT NULL,
    header          VARCHAR(255)   NOT NULL,
    description     VARCHAR(5000)  NOT NULL,
    price           NUMERIC(18, 2) NOT NULL,

    owner_id        UUID           NOT NULL,

    product_type_id INTEGER        NOT NULL,

    CONSTRAINT products_pkey PRIMARY KEY (id)
);

ALTER TABLE products
    ADD CONSTRAINT products_product_type_id_fkey FOREIGN KEY (product_type_id) REFERENCES nsi_product_type (id);

ALTER TABLE products
    ADD CONSTRAINT products_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES users (id);

INSERT INTO nsi_product_type (id, name)
VALUES (1, 'Лабораторная работа'),
       (2, 'Курсовая работа'),
       (3, 'Дипломная работа'),
       (4, 'Конспект'),
       (5, 'Прочие работы');

CREATE SEQUENCE products_id_seq;
ALTER TABLE products
    ALTER COLUMN id SET DEFAULT nextval('products_id_seq');