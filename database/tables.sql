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
DROP TABLE IF EXISTS scio_user;
DROP TABLE IF EXISTS role;

CREATE TABLE role(
  id INTEGER PRIMARY KEY,
  name VARCHAR(200) NOT NULL
);

INSERT INTO role
VALUES
  (0, 'Employee'),
  (1, 'Etudiant');


CREATE TABLE scio_user (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(200) NOT NULL,
    phone VARCHAR(200) NOT NULL,
    email VARCHAR(200) NOT NULL,
    password VARCHAR(200) NOT NULL,
    description VARCHAR(200) NOT NULL,
    id_role INTEGER NOT NULL REFERENCES role(id),
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);

CREATE TABLE note (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    value INT NOT NULL,
    id_employee UUID NOT NULL REFERENCES scio_user(id),
    id_student UUID NOT NULL REFERENCES scio_user(id),
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);

CREATE TABLE report (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    comment VARCHAR(200) NOT NULL,
    id_student UUID NOT NULL REFERENCES scio_user(id),
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
    id_employee UUID NOT NULL REFERENCES scio_user(id),
    id_course UUID NOT NULL REFERENCES course(id),
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);

CREATE TABLE meeting (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    description VARCHAR(200) NOT NULL,
    date TIMESTAMP WITH TIME ZONE NOT NULL,
    id_course UUID NOT NULL REFERENCES course(id),
    id_employee UUID NOT NULL REFERENCES scio_user(id),
    id_student UUID NOT NULL REFERENCES scio_user(id)
);

CREATE TABLE preference (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    id_course UUID NOT NULL REFERENCES course(id),
    id_student UUID NOT NULL REFERENCES scio_user(id)
);

CREATE TABLE file (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    value VARCHAR(200) NOT NULL,
    id_student UUID NOT NULL REFERENCES scio_user(id),
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

INSERT INTO course(id, id_theme, id_level)
VALUES
    ('ce488093-696e-4881-8e56-6055009ef208','6591450e-b404-4d02-b8cf-848fd659c571', '5d0f381a-91f2-4348-b86d-a7a5adec9e5c'),
    ('71708cf9-fd2d-4e07-9ffa-3e416105a6b8','6591450e-b404-4d02-b8cf-848fd659c571', 'eeda5691-01ef-4d73-99fd-cabf32bf38b2'),
    ('e870f85d-c93c-42da-9088-6285875fd25e','6591450e-b404-4d02-b8cf-848fd659c571', '511c450a-fae7-4156-a66d-1ab3da0374a3'),
    ('fc8b67aa-76f4-4193-aff2-b39f29233ad3','6591450e-b404-4d02-b8cf-848fd659c571', '4d6fc3b6-a36e-4484-8200-3cc29024620f'),
    ('0140c982-3c7f-4dfe-b198-e0c257f368db','6591450e-b404-4d02-b8cf-848fd659c571', '010970e5-e4f5-4ba1-bece-d767e985b032'),
    ('289eeb62-fd24-4575-9b9d-341249316140','6591450e-b404-4d02-b8cf-848fd659c571', '258445c6-f8ee-40e5-a254-2eadb0fb129b'),
    ('602ebf4e-e1ae-4bcd-9a08-0ca4de5d756f','6591450e-b404-4d02-b8cf-848fd659c571', '5555219f-a5bc-43ee-8e6a-4ac7ac734008'),
    ('3b5a6432-526f-4458-9c9e-6c73c4355f9c','6591450e-b404-4d02-b8cf-848fd659c571', '13cb3cb9-b762-4ebe-8019-ca537675e920'),
    ('3809676a-bb5c-42b2-bf92-46d53ec5e8a8','6591450e-b404-4d02-b8cf-848fd659c571', 'e5423258-d00b-42e4-8a2b-944b46b48067'),
    ('ccc7f32d-eace-4a7a-974c-52547fb331e5','ac1d2076-c459-4861-99a3-877f77d7f7a0', '5d0f381a-91f2-4348-b86d-a7a5adec9e5c'),
    ('e3e151c8-9e81-4c10-845d-e9f8535f5930','ac1d2076-c459-4861-99a3-877f77d7f7a0', 'eeda5691-01ef-4d73-99fd-cabf32bf38b2'),
    ('0087fda2-e81e-416c-9562-a45395dc4f34','ac1d2076-c459-4861-99a3-877f77d7f7a0', '511c450a-fae7-4156-a66d-1ab3da0374a3'),
    ('0d9eba38-cda6-4dbb-b94d-7a230bf9aa97','ac1d2076-c459-4861-99a3-877f77d7f7a0', '4d6fc3b6-a36e-4484-8200-3cc29024620f'),
    ('d22c9567-d41d-42d5-8004-7d4ec7f3bb09','ac1d2076-c459-4861-99a3-877f77d7f7a0', '010970e5-e4f5-4ba1-bece-d767e985b032'),
    ('5c7a7acf-c692-4ca3-a30f-75a72e7cc101','ac1d2076-c459-4861-99a3-877f77d7f7a0', '258445c6-f8ee-40e5-a254-2eadb0fb129b'),
    ('4bf14691-67d2-4322-9cb6-052dd9e84cdd','ac1d2076-c459-4861-99a3-877f77d7f7a0', '5555219f-a5bc-43ee-8e6a-4ac7ac734008'),
    ('dac52daf-2278-47b6-bffc-ffe29d9d49fe','ac1d2076-c459-4861-99a3-877f77d7f7a0', '13cb3cb9-b762-4ebe-8019-ca537675e920'),
    ('0453c2d6-6146-49b0-b8d2-5dfe71f40045','ac1d2076-c459-4861-99a3-877f77d7f7a0', 'e5423258-d00b-42e4-8a2b-944b46b48067'),
    ('9ed02bf7-5641-4555-9d02-d7bbe5eb41e9','3356f3a3-f6cc-4ed9-ac5d-37f2654b83e2', '5d0f381a-91f2-4348-b86d-a7a5adec9e5c'),
    ('745fac2a-a3d2-4e4e-a806-46517c8bfe4b','3356f3a3-f6cc-4ed9-ac5d-37f2654b83e2', 'eeda5691-01ef-4d73-99fd-cabf32bf38b2'),
    ('a0dd44ce-7440-4172-8d9f-625cd9bb2e0a','3356f3a3-f6cc-4ed9-ac5d-37f2654b83e2', '511c450a-fae7-4156-a66d-1ab3da0374a3');
