DROP TABLE IF EXISTS administrator;
DROP TABLE IF EXISTS file;
DROP TABLE IF EXISTS preference;
DROP TABLE IF EXISTS meeting;
DROP TABLE IF EXISTS request;
DROP TABLE IF EXISTS course;
DROP TABLE IF EXISTS report;
DROP TABLE IF EXISTS note;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS company;

CREATE TABLE company (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(200) NOT NULL,
    postal_code VARCHAR(200) NOT NULL,
    country VARCHAR(200) NOT NULL,
    street VARCHAR(200) NOT NULL,
    state VARCHAR(200) NOT NULL,
    city VARCHAR(200) NOT NULL
);

CREATE TABLE employee (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(200) NOT NULL,
    phone VARCHAR(200) NOT NULL,
    email VARCHAR(200) NOT NULL,
    id_company UUID NOT NULL REFERENCES company(id)
);

CREATE TABLE student (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(200) NOT NULL,
    phone VARCHAR(200) NOT NULL,
    email VARCHAR(200) NOT NULL,
    description VARCHAR(200) NOT NULL
);

CREATE TABLE note (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    value INT NOT NULL,
    id_employee UUID NOT NULL REFERENCES employee(id),
    id_student UUID NOT NULL REFERENCES student(id)
);

CREATE TABLE report (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    comment VARCHAR(200) NOT NULL,
    id_student UUID NOT NULL REFERENCES student(id)
);

CREATE TABLE course (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    theme VARCHAR(200) NOT NULL,
    level VARCHAR(200) NOT NULL
);

CREATE TABLE request (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    description VARCHAR(200) NOT NULL,
    id_employee UUID NOT NULL REFERENCES employee(id),
    id_course UUID NOT NULL REFERENCES course(id)
);

CREATE TABLE meeting (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    description VARCHAR(200) NOT NULL,
    date TIMESTAMP WITH TIME ZONE,
    id_course UUID NOT NULL REFERENCES course(id)
);

CREATE TABLE preference (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    id_course UUID NOT NULL REFERENCES course(id),
    id_student UUID NOT NULL REFERENCES student(id)
);

CREATE TABLE file (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    value VARCHAR(200) NOT NULL,
    id_student UUID NOT NULL REFERENCES student(id)
);

CREATE TABLE administrator (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(200) NOT NULL
);


INSERT INTO course
VALUES
    ('1936cf80-2a8f-4407-94ed-e3f352e6d763', 'Mathématiques', '3ème'),
    ('05c73d66-f782-4268-80d2-ddfbfbb557c0', 'Mathématiques', '4ème'),
    ('9ecfc68d-ae58-481c-ae91-a3bfd50cadd9', 'Mathématiques', '5ème'),
    ('ce1fc079-eb29-4fa6-879b-93d7026a6d17', 'Mathématiques', '6ème'),
    ('b441074b-ab14-4420-8f13-58ae629e1bb7', 'Mathématiques', 'CM2'),
    ('9981efc1-6bd1-4f4f-a336-38cc91a3a50a', 'Mathématiques', 'CM1'),
    ('d172cb78-bac7-4fad-8c15-71992174dc0d', 'Mathématiques', 'CE2'),
    ('033185ef-7053-48b1-950f-699036831355', 'Mathématiques', 'CE1'),
    ('4bbb734f-89f1-42c2-b634-8e0a5aed7787', 'Mathématiques', 'CP'),
    ('c175268c-a084-45c1-b9c0-59428b30506f', 'Français', '3ème'),
    ('a01e16a7-b2f9-406f-a225-928e61268bd7', 'Français', '4ème'),
    ('a2276644-e63e-414d-90e7-e099969fd0d4', 'Français', '5ème'),
    ('c096b602-2866-4ad5-9d46-c0e5ba71fb8e', 'Français', '6ème'),
    ('3caef256-a1e0-404e-94dd-9c90c9bc5753', 'Français', 'CM2'),
    ('1a93b1c8-9f0a-4d76-9eb8-3bdab0b68455', 'Français', 'CM1'),
    ('a28fa928-25b0-4f5c-82f0-5e6d7a1823ec', 'Français', 'CE2'),
    ('0dbfd640-8424-4412-9ccf-898160944313', 'Français', 'CE1'),
    ('200ecc19-510c-4e3c-84ad-cf4acac10ca2', 'Français', 'CP');