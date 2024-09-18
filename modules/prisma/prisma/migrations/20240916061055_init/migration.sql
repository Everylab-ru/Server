-- CreateTable
CREATE TABLE Roles
(
    id   INTEGER      NOT NULL,
    name VARCHAR(255) NOT NULL,

    CONSTRAINT Roles_pkey PRIMARY KEY (id)
);

-- CreateTable
CREATE TABLE Users
(
    id       UUID         NOT NULL,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email    VARCHAR(255) NOT NULL,

    CONSTRAINT Users_pkey PRIMARY KEY (id)
);

-- CreateTable
CREATE TABLE UserRoles
(
    usersId UUID    NOT NULL,
    rolesId INTEGER NOT NULL,

    CONSTRAINT UserRoles_pkey PRIMARY KEY (usersId, rolesId)
);

-- AddForeignKey
ALTER TABLE UserRoles
    ADD CONSTRAINT UserRoles_usersId_fkey FOREIGN KEY (usersId) REFERENCES Users (id) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE UserRoles
    ADD CONSTRAINT UserRoles_rolesId_fkey FOREIGN KEY (rolesId) REFERENCES Roles (id) ON DELETE RESTRICT ON UPDATE CASCADE;

INSERT INTO Roles (name)
VALUES ('ADMIN'),
       ('USER');
