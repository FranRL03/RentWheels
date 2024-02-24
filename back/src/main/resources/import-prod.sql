--INSERT INTO USUARIO (id, username, password, email, telefono, avatar, account_non_expired, account_non_locked,credentials_non_expired, enabled) VALUES ('1ce9c1c7-7a02-4c7f-bf69-6d0306cbed61', 'fernando01','{bcrypt}$2a$12$qG8MR/W6ExYtPPdpr2Ry/eEy.x30mvHWlRyLuG6fP57lCK.6Kuz.W', 'fernando@gmail.com','112332112', 'https://media.istockphoto.com/id/92044396/es/foto/rana-con-gafas-de-sol.jpg?s=170667a&w=0&k=20&c=jEh4ZMUWU9Y3gx5odmT-LmbCGymtiBVzzEPerkawqm0=', true, true, true, true);
--INSERT INTO CLIENTE (id, pin) VALUES ('1ce9c1c7-7a02-4c7f-bf69-6d0306cbed61','2222');
--INSERT INTO USUARIO_ROLES (roles, usuario_id) VALUES (1,'1ce9c1c7-7a02-4c7f-bf69-6d0306cbed61');
--
--INSERT INTO USUARIO (id, username, password, email, telefono, avatar, account_non_expired, account_non_locked,credentials_non_expired, enabled) VALUES ('86cc45ac-7e72-40d7-b528-2863a1e2500f', 'angel02','{bcrypt}$2a$12$qG8MR/W6ExYtPPdpr2Ry/eEy.x30mvHWlRyLuG6fP57lCK.6Kuz.W', 'angel@gmail.com','333223311', 'https://media.istockphoto.com/id/92044396/es/foto/rana-con-gafas-de-sol.jpg?s=170667a&w=0&k=20&c=jEh4ZMUWU9Y3gx5odmT-LmbCGymtiBVzzEPerkawqm0=', true, true, true, true);
--INSERT INTO USUARIO_ROLES (roles, usuario_id) VALUES (0,'86cc45ac-7e72-40d7-b528-2863a1e2500f');

INSERT INTO USUARIO (id, username, password, avatar, account_non_expired, account_non_locked,credentials_non_expired, enabled) VALUES ('1ce9c1c7-7a02-4c7f-bf69-6d0306cbed61', 'fernando01','{bcrypt}$2a$12$qG8MR/W6ExYtPPdpr2Ry/eEy.x30mvHWlRyLuG6fP57lCK.6Kuz.W', 'https://media.istockphoto.com/id/92044396/es/foto/rana-con-gafas-de-sol.jpg?s=170667a&w=0&k=20&c=jEh4ZMUWU9Y3gx5odmT-LmbCGymtiBVzzEPerkawqm0=', true, true, true, true);
INSERT INTO CLIENTE (id, pin, email, telefono) VALUES ('1ce9c1c7-7a02-4c7f-bf69-6d0306cbed61','2222', 'fernando@gmail.com','112332112');
INSERT INTO USUARIO_ROLES (roles, usuario_id) VALUES (1,'1ce9c1c7-7a02-4c7f-bf69-6d0306cbed61');

INSERT INTO USUARIO (id, username, password, avatar, account_non_expired, account_non_locked,credentials_non_expired, enabled) VALUES ('86cc45ac-7e72-40d7-b528-2863a1e2500f', 'angel02','{bcrypt}$2a$12$qG8MR/W6ExYtPPdpr2Ry/eEy.x30mvHWlRyLuG6fP57lCK.6Kuz.W', 'https://media.istockphoto.com/id/92044396/es/foto/rana-con-gafas-de-sol.jpg?s=170667a&w=0&k=20&c=jEh4ZMUWU9Y3gx5odmT-LmbCGymtiBVzzEPerkawqm0=', true, true, true, true);
INSERT INTO USUARIO_ROLES (roles, usuario_id) VALUES (0,'86cc45ac-7e72-40d7-b528-2863a1e2500f');


--########################

--TIPO VEHICULOS

insert into TIPO_VEHICULO (id, tipo) values ('5d79d7a0-46c8-4b5b-95f3-8f83195c768b', 'Coche')
insert into TIPO_VEHICULO (id, tipo) values ('e192b5d1-86e7-4b79-92b6-823f9f9f5aa1', 'Moto')
insert into TIPO_VEHICULO (id, tipo) values ('38c7c21e-13d7-4d2b-9fb3-df5ec849dd34', 'Camioneta')

--########################

-- MODELO DE COCHES

insert into MODELO (id, modelo) values ('afcf760a-8e8a-4e7c-ae94-f5af066c0be7', 'Toyota Corolla');
insert into MODELO (id, modelo) values ('b13f10a7-5cc1-4bc2-8e16-21260b2a1fe2', 'Honda Civic');
insert into MODELO (id, modelo) values ('7d7d67f8-73e5-4cfb-87fd-3c7769db2b24', 'Ford Mustang');
insert into MODELO (id, modelo) values ('e04f9cd6-f5e1-4db2-9eaa-29b9b29431a1', 'Chevrolet Silverado');
insert into MODELO (id, modelo) values ('35eef7de-5b6e-48d7-803e-b201d8b032f6', 'BMW Serie 3');
insert into MODELO (id, modelo) values ('fe3756a0-2262-4ec7-a924-95e0eefdaa15', 'Mercedes-Benz Clase C');
insert into MODELO (id, modelo) values ('8c5e42c3-3c2b-4e15-af8c-498e5e63509f', 'Audi A4');
insert into MODELO (id, modelo) values ('4f8a0e86-b937-4189-9435-65f66543e956', 'Volkswagen Golf');
insert into MODELO (id, modelo) values ('b40e4dd4-b0d7-4715-8391-eb5a7b0bbd1a', 'Tesla Model S');
insert into MODELO (id, modelo) values ('1c4e89a2-0ac4-41e8-a885-4b8b0d11fcdf', 'Nissan Rogue');
insert into MODELO (id, modelo) values ('eb3d7d0d-1667-494d-9912-90521e057010', 'Subaru Outback');
insert into MODELO (id, modelo) values ('b8b5f10e-41a4-4705-91eb-305c7f00df53', 'Jeep Wrangler');
insert into MODELO (id, modelo) values ('0d96352d-8295-4622-87d1-511398daac50', 'Porsche 911');
insert into MODELO (id, modelo) values ('a18715cc-b94b-43b0-bb73-52a1d0b89e61', 'Hyundai Sonata');
insert into MODELO (id, modelo) values ('ec3c2e40-6892-4725-8670-4b79922fe7b3', 'Kia Sportage');

--COCHES

insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, tipo_vehiculo_id, modelo_id) values ('0f8fad5b-d9cb-469f-a165-70867728950e', 'https://assets.stickpng.com/thumbs/59db69d33752880e93e16efc.png', 'Eléctrico', 'Manual', 5, 266426, 107, 'Nuevo', 5, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', 'ec3c2e40-6892-4725-8670-4b79922fe7b3');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, tipo_vehiculo_id, modelo_id) values ('7c9e6679-7425-40de-944b-e07fc1f90ae7', 'https://assets.stickpng.com/thumbs/59db694b3752880e93e16eef.png', 'Eléctrico', 'Automático', 4, 195418, 135, 'Nuevo', 5, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', '1c4e89a2-0ac4-41e8-a885-4b8b0d11fcdf');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, tipo_vehiculo_id, modelo_id) values ('6d099b7a-1b22-4d17-b3ae-583ebc4ab9f2', 'https://assets.stickpng.com/thumbs/59db69ed3752880e93e16efd.png', 'Eléctrico', 'Manual', 4, 278662, 152, 'Nuevo', 5, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', 'b13f10a7-5cc1-4bc2-8e16-21260b2a1fe2');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, tipo_vehiculo_id, modelo_id) values ('9d3b8d45-87d5-4a4a-a663-dbb6899c9f9b', 'https://assets.stickpng.com/thumbs/59db693c3752880e93e16eed.png', 'Eléctrico', 'Manual', 5, 150881, 155, 'Nuevo', 5, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', 'a18715cc-b94b-43b0-bb73-52a1d0b89e61');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, tipo_vehiculo_id, modelo_id) values ('2641c15b-3c06-4fe5-81d3-5a3deaa9d366', 'https://assets.stickpng.com/thumbs/59db69733752880e93e16ef4.png', 'Eléctrico', 'Automático', 5, 221462, 157, 'Nuevo', 5, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', 'ec3c2e40-6892-4725-8670-4b79922fe7b3');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, tipo_vehiculo_id, modelo_id) values ('a3fdd079-4c68-4f3f-af67-d72c2cbe41b6', 'https://assets.stickpng.com/thumbs/59db69433752880e93e16eee.png', 'Diesel', 'Manual', 2, 354427, 122, 'Seminuevo', 5, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', 'e04f9cd6-f5e1-4db2-9eaa-29b9b29431a1');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, tipo_vehiculo_id, modelo_id) values ('c775e7b7-4c68-4f3f-af67-6c420eb004b6', 'https://assets.stickpng.com/thumbs/59db697f3752880e93e16ef5.png', 'Gasolina', 'Automático', 4, 256038, 181, 'Nuevo', 5, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', '4f8a0e86-b937-4189-9435-65f66543e956');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, tipo_vehiculo_id, modelo_id) values ('efc0e187-4d08-4a8e-bf5b-eb10c26aadb4', 'https://assets.stickpng.com/thumbs/59db6a303752880e93e16f02.png', 'Eléctrico', 'Manual', 5, 296856, 188, 'Seminuevo', 5, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', '7d7d67f8-73e5-4cfb-87fd-3c7769db2b24');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, tipo_vehiculo_id, modelo_id) values ('85e5ab7d-4e9e-4f93-bfb4-cf5471f7051d', 'https://assets.stickpng.com/thumbs/59db695b3752880e93e16ef1.png', 'Diesel', 'Manual', 3, 357966, 96, 'Nuevo', 5, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', 'b8b5f10e-41a4-4705-91eb-305c7f00df53');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, tipo_vehiculo_id, modelo_id) values ('68335ec3-1aeb-41a9-b5c3-40e464e3ecf0', 'https://assets.stickpng.com/thumbs/59db69a03752880e93e16ef7.png', 'Diesel', 'Automático', 5, 353017, 162, 'Seminuevo', 5, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', '35eef7de-5b6e-48d7-803e-b201d8b032f6');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, tipo_vehiculo_id, modelo_id) values ('5d7f9e1d-08fb-44df-880c-cbd348f5890d', 'https://assets.stickpng.com/thumbs/59db69ab3752880e93e16ef8.png', 'Híbrido', 'Manual', 3, 208214, 163, 'Nuevo', 5, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', 'b8b5f10e-41a4-4705-91eb-305c7f00df53');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, tipo_vehiculo_id, modelo_id) values ('8f0913b0-1229-4b9f-9ea4-765d6d189e47', 'https://assets.stickpng.com/thumbs/59db696a3752880e93e16ef3.png', 'Eléctrico', 'Manual', 4, 272828, 182, 'Nuevo', 5, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', '35eef7de-5b6e-48d7-803e-b201d8b032f6');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, tipo_vehiculo_id, modelo_id) values ('504d1b3a-5a15-4898-b579-d05d5f570e07', 'https://assets.stickpng.com/thumbs/59db6a243752880e93e16f01.png', 'Diesel', 'Manual', 3, 357706, 192, 'Nuevo', 5, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', 'ec3c2e40-6892-4725-8670-4b79922fe7b3');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, tipo_vehiculo_id, modelo_id) values ('99b5f3fc-ef56-4768-8a1a-8728b6a56f3f', 'https://assets.stickpng.com/thumbs/59db69633752880e93e16ef2.png', 'Híbrido', 'Manual', 3, 222930, 143, 'Nuevo', 5, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', '4f8a0e86-b937-4189-9435-65f66543e956');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, tipo_vehiculo_id, modelo_id) values ('6c7d47ff-9b5c-4721-96f6-bb4015e49512', 'https://assets.stickpng.com/thumbs/59db6a143752880e93e16f00.png', 'Eléctrico', 'Manual', 2, 294615, 110, 'Seminuevo', 5, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', 'ec3c2e40-6892-4725-8670-4b79922fe7b3');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, tipo_vehiculo_id, modelo_id) values ('37250484-c4f1-47d1-ba9e-8ca4ef72622c', 'https://assets.stickpng.com/thumbs/59db6a083752880e93e16eff.png', 'Diesel', 'Manual', 2, 353386, 102, 'Seminuevo', 5, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', 'ec3c2e40-6892-4725-8670-4b79922fe7b3');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, tipo_vehiculo_id, modelo_id) values ('609e067b-05ef-48b4-b2b4-3f97899bb07d', 'https://assets.stickpng.com/thumbs/59db69fe3752880e93e16efe.png', 'Híbrido', 'Automático', 2, 216241, 152, 'Seminuevo', 5, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', 'fe3756a0-2262-4ec7-a924-95e0eefdaa15');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, tipo_vehiculo_id, modelo_id) values ('17ed71b8-5e2e-4c5f-a12e-7e1adff08a3e', 'https://assets.stickpng.com/thumbs/59db69d33752880e93e16efc.png', 'Gasolina', 'Manual', 5, 259473, 122, 'Nuevo', 5, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', '1c4e89a2-0ac4-41e8-a885-4b8b0d11fcdf');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, tipo_vehiculo_id, modelo_id) values ('9b85cccf-26cd-45f8-a2ad-d80d8d6b8962', 'https://assets.stickpng.com/thumbs/59db694b3752880e93e16eef.png', 'Diesel', 'Manual', 3, 350347, 122, 'Nuevo', 5, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', 'a18715cc-b94b-43b0-bb73-52a1d0b89e61');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, tipo_vehiculo_id, modelo_id) values ('9b11dd61-4424-46c9-9daa-c5d70025c478', 'https://assets.stickpng.com/thumbs/59db69ed3752880e93e16efd.png', 'Híbrido', 'Manual', 4, 247587, 170, 'Nuevo', 5, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', 'b8b5f10e-41a4-4705-91eb-305c7f00df53');

--###########################

-- MOTOS