INSERT INTO public.scio_user (id,name,phone,email,password,description, id_role)
VALUES
    ('6d7ff6b5-d7b1-494e-92ca-807236e8d701', 'Michel', '0909090909', 'michel@auchan.com','pass','EMPLOYEE_1', 0),
    ('e924108e-57ae-4b0e-9c23-f5540d7c91a3', 'George', '0909090909', 'georgie@gmail.com','pass', 'EMPLOYEE_2', 0),
    ('39eff212-7ecd-4d7e-9041-66f1863a3da6', 'Mickael', '0909090909', 'mick@gmail.com','pass', 'EMPLOYEE_3', 0),
    ('7f2d5d2b-5ca3-4255-8efb-3b303d243bb3', 'Julie', '0909090909', 'jul@gmail.com','pass', 'EMPLOYEE_4', 0),
    ('ed449967-5c82-4737-b60a-5f11fb200d72', 'Pascale', '0909090909', 'pas@gmail.com','pass', 'EMPLOYEE_5', 0),
    ('8a54c86f-1c6b-4117-9b6f-919923eadd65', 'Pablo', '0707070707', 'pablo@tuta.io','pass', 'STUDENT_1', 1),
    ('bd793081-a155-4ac6-9be4-d00fe58f6bf8', 'Thierry', '0707070707', 'thierry@tuta.io','pass', 'STUDENT_2', 1),
    ('12f9ccdf-7aa0-4661-a198-b4e547f76a51', 'Lucie', '0707070707', 'lucie@tuta.io','pass', 'STUDENT_3', 1),
    ('6f20fe7d-1cbd-4bc9-82f9-afc61fb1969c', 'Enzo', '0707070707', 'enzo@tuta.io','pass', 'STUDENT_4', 1);

INSERT INTO public.request(id,description,id_employee,id_course)
VALUES
    ('7a480b3f-7f1c-4c72-8d8e-0621f987cf8c', 'REQUEST_1', '8b24b094-574f-4c5b-b4d4-302a70de9f91', 'ce488093-696e-4881-8e56-6055009ef208'),
    ('6f2a1a84-e3ab-4aa4-bebf-9e235e72345c', 'REQUEST_2', '8b24b094-574f-4c5b-b4d4-302a70de9f91', '9ed02bf7-5641-4555-9d02-d7bbe5eb41e9'),
    ('17834421-9cb7-4dd5-91b1-4b0dc14f57c0', 'REQUEST_3', '7f2d5d2b-5ca3-4255-8efb-3b303d243bb3', 'dac52daf-2278-47b6-bffc-ffe29d9d49fe'),
    ('99d88dfe-8198-4c59-9704-a702880b6002', 'REQUEST_4', '39eff212-7ecd-4d7e-9041-66f1863a3da6', 'ccc7f32d-eace-4a7a-974c-52547fb331e5');

INSERT INTO public.meeting(id,description,date,id_course,id_employee,id_student)
VALUES
    ('ba091675-766b-4796-8407-648c8bb4d83b', 'MEETING_1', '2020-04-16 09:54:25.862426+00', 'ccc7f32d-eace-4a7a-974c-52547fb331e5', 'e924108e-57ae-4b0e-9c23-f5540d7c91a3', '8a54c86f-1c6b-4117-9b6f-919923eadd65'),
    ('79ba0c6e-0298-42f2-a9c5-3a5d25e87e3d', 'MEETING_2', '2020-05-08 10:54:25.862426+00', 'ccc7f32d-eace-4a7a-974c-52547fb331e5', 'e924108e-57ae-4b0e-9c23-f5540d7c91a3', 'bd793081-a155-4ac6-9be4-d00fe58f6bf8'),
    ('5de9a7fb-f1d7-4dc3-8218-85b65ecef704', 'MEETING_3', '2020-04-16 11:54:25.862426+00', 'dac52daf-2278-47b6-bffc-ffe29d9d49fe', 'ed449967-5c82-4737-b60a-5f11fb200d72', '6f20fe7d-1cbd-4bc9-82f9-afc61fb1969c'),
    ('6f1ed765-5cca-4ec6-a530-9481cc15a1b6', 'MEETING_4', '2020-04-18 13:54:25.862426+00', 'ce488093-696e-4881-8e56-6055009ef208', 'e924108e-57ae-4b0e-9c23-f5540d7c91a3', '12f9ccdf-7aa0-4661-a198-b4e547f76a51'),
    ('33f00f8d-d4c9-4ad0-a3c6-f790d7726827', 'MEETING_5', '2020-05-16 19:54:25.862426+00', 'ce488093-696e-4881-8e56-6055009ef208', 'ed449967-5c82-4737-b60a-5f11fb200d72', '8a54c86f-1c6b-4117-9b6f-919923eadd65'),
    ('a6d944a2-25ac-4ad4-8942-fd280b388f73', 'MEETING_6', '2020-04-24 23:54:25.862426+00', '9ed02bf7-5641-4555-9d02-d7bbe5eb41e9', '8b24b094-574f-4c5b-b4d4-302a70de9f91', 'bd793081-a155-4ac6-9be4-d00fe58f6bf8');
