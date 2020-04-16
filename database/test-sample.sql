INSERT INTO public.company(id,name,postal_code,country,street,state,city)
VALUES
    ('31ae6682-538c-4930-a7eb-e362645953cf', 'Auchan', '44000', 'France', '', '', 'NANTES'),
    ('5f3e22d4-e7d0-4465-8f92-e11e9e14ade9', 'LVMH', '75000', 'France', '', '', 'PARIS');

INSERT INTO public.employee(id,name,phone,email,id_company)
VALUES
    ('8b24b094-574f-4c5b-b4d4-302a70de9f91', 'Michel', '0909090909', 'michel@gmail.com', '31ae6682-538c-4930-a7eb-e362645953cf'),
    ('e924108e-57ae-4b0e-9c23-f5540d7c91a3', 'George', '0909090909', 'georgie@gmail.com', '31ae6682-538c-4930-a7eb-e362645953cf'),
    ('39eff212-7ecd-4d7e-9041-66f1863a3da6', 'Mickael', '0909090909', 'mick@gmail.com', '31ae6682-538c-4930-a7eb-e362645953cf'),
    ('7f2d5d2b-5ca3-4255-8efb-3b303d243bb3', 'Julie', '0909090909', 'jul@gmail.com', '5f3e22d4-e7d0-4465-8f92-e11e9e14ade9'),
    ('ed449967-5c82-4737-b60a-5f11fb200d72', 'Pascale', '0909090909', 'pas@gmail.com', '5f3e22d4-e7d0-4465-8f92-e11e9e14ade9');

INSERT INTO public.request(id,description,id_employee,id_course)
VALUES
    ('7a480b3f-7f1c-4c72-8d8e-0621f987cf8c', 'REQUEST_1', '8b24b094-574f-4c5b-b4d4-302a70de9f91', '9e168199-8d81-48c7-a21f-41a1b85ab10f'),
    ('6f2a1a84-e3ab-4aa4-bebf-9e235e72345c', 'REQUEST_2', '8b24b094-574f-4c5b-b4d4-302a70de9f91', 'cbcdc0c0-088d-4a2a-9b75-fcc158f24eed'),
    ('17834421-9cb7-4dd5-91b1-4b0dc14f57c0', 'REQUEST_3', '7f2d5d2b-5ca3-4255-8efb-3b303d243bb3', 'b1056078-f329-4892-96d9-b42f16e12932'),
    ('99d88dfe-8198-4c59-9704-a702880b6002', 'REQUEST_4', '39eff212-7ecd-4d7e-9041-66f1863a3da6', 'a17ebf0d-d10e-4842-8960-3eba87659ad1');

INSERT INTO public.student(id,name,phone,email,description)
VALUES
    ('8a54c86f-1c6b-4117-9b6f-919923eadd65', 'Pablo', '0707070707', 'pablo@tuta.io', 'STUDENT_1'),
    ('bd793081-a155-4ac6-9be4-d00fe58f6bf8', 'Thierry', '0707070707', 'thierry@tuta.io', 'STUDENT_2'),
    ('12f9ccdf-7aa0-4661-a198-b4e547f76a51', 'Lucie', '0707070707', 'lucie@tuta.io', 'STUDENT_3'),
    ('6f20fe7d-1cbd-4bc9-82f9-afc61fb1969c', 'Enzo', '0707070707', 'enzo@tuta.io', 'STUDENT_4');

INSERT INTO public.meeting(id,description,date,id_course)
VALUES
    ('ba091675-766b-4796-8407-648c8bb4d83b', 'MEETING_1', '2020-04-16 09:54:25.862426+00', 'cbcdc0c0-088d-4a2a-9b75-fcc158f24eed'),
    ('79ba0c6e-0298-42f2-a9c5-3a5d25e87e3d', 'MEETING_2', '2020-05-08 10:54:25.862426+00', 'a17ebf0d-d10e-4842-8960-3eba87659ad1'),
    ('5de9a7fb-f1d7-4dc3-8218-85b65ecef704', 'MEETING_3', '2020-04-16 11:54:25.862426+00', 'b1056078-f329-4892-96d9-b42f16e12932'),
    ('6f1ed765-5cca-4ec6-a530-9481cc15a1b6', 'MEETING_4', '2020-04-18 13:54:25.862426+00', '9e168199-8d81-48c7-a21f-41a1b85ab10f'),
    ('33f00f8d-d4c9-4ad0-a3c6-f790d7726827', 'MEETING_5', '2020-05-16 19:54:25.862426+00', '9e168199-8d81-48c7-a21f-41a1b85ab10f'),
    ('a6d944a2-25ac-4ad4-8942-fd280b388f73', 'MEETING_6', '2020-04-24 23:54:25.862426+00', 'a17ebf0d-d10e-4842-8960-3eba87659ad1');