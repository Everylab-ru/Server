-- CreateTable
CREATE TABLE roles
(
    id   INTEGER      NOT NULL,
    name VARCHAR(255) NOT NULL,

    CONSTRAINT Roles_pkey PRIMARY KEY (id)
);

-- CreateTable
CREATE TABLE users
(
    id       UUID         NOT NULL,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email    VARCHAR(255) NOT NULL,

    CONSTRAINT Users_pkey PRIMARY KEY (id)
);

-- CreateTable
CREATE TABLE user_roles
(
    user_id UUID    NOT NULL,
    role_id INTEGER NOT NULL,

    CONSTRAINT UserRoles_pkey PRIMARY KEY (user_id, role_id)
);

-- AddForeignKey
ALTER TABLE user_roles
    ADD CONSTRAINT UserRoles_usersId_fkey FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE user_roles
    ADD CONSTRAINT UserRoles_rolesId_fkey FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE RESTRICT ON UPDATE CASCADE;

INSERT INTO roles (id, name)
VALUES (1, 'ADMIN'),
       (2, 'USER');
