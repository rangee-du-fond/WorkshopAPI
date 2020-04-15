DROP TABLE IF EXISTS administrator;
DROP TABLE IF EXISTS file;
DROP TABLE IF EXISTS preference;
DROP TABLE IF EXISTS meeting;
DROP TABLE IF EXISTS request;
DROP TABLE IF EXISTS course;
DROP TABLE IF EXISTS theme;
DROP TABLE IF EXISTS level;
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
    id_company UUID NOT NULL REFERENCES company(id),
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);

CREATE TABLE student (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(200) NOT NULL,
    phone VARCHAR(200) NOT NULL,
    email VARCHAR(200) NOT NULL,
    description VARCHAR(200) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);

CREATE TABLE note (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    value INT NOT NULL,
    id_employee UUID NOT NULL REFERENCES employee(id),
    id_student UUID NOT NULL REFERENCES student(id),
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);

CREATE TABLE report (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    comment VARCHAR(200) NOT NULL,
    id_student UUID NOT NULL REFERENCES student(id),
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);

CREATE TABLE theme (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(200) NOT NULL
);

CREATE TABLE level (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(200) NOT NULL
);

CREATE TABLE course (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    id_theme UUID NOT NULL REFERENCES theme(id),
    id_level UUID NOT NULL REFERENCES level(id)
);

CREATE TABLE request (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    description VARCHAR(200) NOT NULL,
    id_employee UUID NOT NULL REFERENCES employee(id),
    id_course UUID NOT NULL REFERENCES course(id),
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
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
    id_student UUID NOT NULL REFERENCES student(id),
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);

CREATE TABLE administrator (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(200) NOT NULL
);

INSERT INTO theme
VALUES
    ('6591450e-b404-4d02-b8cf-848fd659c571', 'Mathématiques'),
    ('ac1d2076-c459-4861-99a3-877f77d7f7a0', 'Français'),
    ('3356f3a3-f6cc-4ed9-ac5d-37f2654b83e2', 'Physique');

INSERT INTO level
VALUES
    ('5d0f381a-91f2-4348-b86d-a7a5adec9e5c', '3ème'),
    ('eeda5691-01ef-4d73-99fd-cabf32bf38b2', '4ème'),
    ('511c450a-fae7-4156-a66d-1ab3da0374a3', '5ème'),
    ('4d6fc3b6-a36e-4484-8200-3cc29024620f', '6ème'),
    ('010970e5-e4f5-4ba1-bece-d767e985b032', 'CM2'),
    ('258445c6-f8ee-40e5-a254-2eadb0fb129b', 'CM1'),
    ('5555219f-a5bc-43ee-8e6a-4ac7ac734008', 'CE2'),
    ('13cb3cb9-b762-4ebe-8019-ca537675e920', 'CE1'),
    ('e5423258-d00b-42e4-8a2b-944b46b48067', 'CP');

INSERT INTO course(id_theme, id_level)
VALUES
    ('6591450e-b404-4d02-b8cf-848fd659c571', '5d0f381a-91f2-4348-b86d-a7a5adec9e5c'),
    ('6591450e-b404-4d02-b8cf-848fd659c571', 'eeda5691-01ef-4d73-99fd-cabf32bf38b2'),
    ('6591450e-b404-4d02-b8cf-848fd659c571', '511c450a-fae7-4156-a66d-1ab3da0374a3'),
    ('6591450e-b404-4d02-b8cf-848fd659c571', '4d6fc3b6-a36e-4484-8200-3cc29024620f'),
    ('6591450e-b404-4d02-b8cf-848fd659c571', '010970e5-e4f5-4ba1-bece-d767e985b032'),
    ('6591450e-b404-4d02-b8cf-848fd659c571', '258445c6-f8ee-40e5-a254-2eadb0fb129b'),
    ('6591450e-b404-4d02-b8cf-848fd659c571', '5555219f-a5bc-43ee-8e6a-4ac7ac734008'),
    ('6591450e-b404-4d02-b8cf-848fd659c571', '13cb3cb9-b762-4ebe-8019-ca537675e920'),
    ('6591450e-b404-4d02-b8cf-848fd659c571', 'e5423258-d00b-42e4-8a2b-944b46b48067'),
    ('ac1d2076-c459-4861-99a3-877f77d7f7a0', '5d0f381a-91f2-4348-b86d-a7a5adec9e5c'),
    ('ac1d2076-c459-4861-99a3-877f77d7f7a0', 'eeda5691-01ef-4d73-99fd-cabf32bf38b2'),
    ('ac1d2076-c459-4861-99a3-877f77d7f7a0', '511c450a-fae7-4156-a66d-1ab3da0374a3'),
    ('ac1d2076-c459-4861-99a3-877f77d7f7a0', '4d6fc3b6-a36e-4484-8200-3cc29024620f'),
    ('ac1d2076-c459-4861-99a3-877f77d7f7a0', '010970e5-e4f5-4ba1-bece-d767e985b032'),
    ('ac1d2076-c459-4861-99a3-877f77d7f7a0', '258445c6-f8ee-40e5-a254-2eadb0fb129b'),
    ('ac1d2076-c459-4861-99a3-877f77d7f7a0', '5555219f-a5bc-43ee-8e6a-4ac7ac734008'),
    ('ac1d2076-c459-4861-99a3-877f77d7f7a0', '13cb3cb9-b762-4ebe-8019-ca537675e920'),
    ('ac1d2076-c459-4861-99a3-877f77d7f7a0', 'e5423258-d00b-42e4-8a2b-944b46b48067'),
    ('3356f3a3-f6cc-4ed9-ac5d-37f2654b83e2', '5d0f381a-91f2-4348-b86d-a7a5adec9e5c'),
    ('3356f3a3-f6cc-4ed9-ac5d-37f2654b83e2', 'eeda5691-01ef-4d73-99fd-cabf32bf38b2'),
    ('3356f3a3-f6cc-4ed9-ac5d-37f2654b83e2', '511c450a-fae7-4156-a66d-1ab3da0374a3');