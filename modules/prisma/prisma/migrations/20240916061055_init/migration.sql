-- CreateTable
CREATE TABLE Roles (
    id SERIAL NOT NULL,
    name TEXT NOT NULL,

    CONSTRAINT Roles_pkey PRIMARY KEY (id)
);

-- CreateTable
CREATE TABLE Users (
    id TEXT NOT NULL,
    username TEXT NOT NULL,
    password TEXT NOT NULL,
    email TEXT NOT NULL,

    CONSTRAINT Users_pkey PRIMARY KEY (id)
);

-- CreateTable
CREATE TABLE UserRoles (
    usersId TEXT NOT NULL,
    rolesId INTEGER NOT NULL,

    CONSTRAINT UserRoles_pkey PRIMARY KEY (usersId,rolesId)
);

-- AddForeignKey
ALTER TABLE UserRoles ADD CONSTRAINT UserRoles_usersId_fkey FOREIGN KEY (usersId) REFERENCES Users(id) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE UserRoles ADD CONSTRAINT UserRoles_rolesId_fkey FOREIGN KEY (rolesId) REFERENCES Roles(id) ON DELETE RESTRICT ON UPDATE CASCADE;

INSERT INTO Roles (name) VALUES ('ADMIN'), ('USER');
