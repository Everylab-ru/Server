CREATE TABLE files_to_products
(
    id         INTEGER NOT NULL,
    file_id    INTEGER NOT NULL,
    product_id INTEGER NOT NULL,

    CONSTRAINT files_to_products_pkey PRIMARY KEY (id),
    CONSTRAINT files_to_products_file_id_fkey FOREIGN KEY (file_id) REFERENCES files (id),
    CONSTRAINT files_to_products_product_id_fkey FOREIGN KEY (product_id) REFERENCES products (id)
);