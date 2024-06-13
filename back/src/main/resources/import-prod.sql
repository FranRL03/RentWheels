--INSERT INTO USUARIO (id, username, password, email, telefono, avatar, account_non_expired, account_non_locked,credentials_non_expired, enabled) VALUES ('1ce9c1c7-7a02-4c7f-bf69-6d0306cbed61', 'fernando01','{bcrypt}$2a$12$qG8MR/W6ExYtPPdpr2Ry/eEy.x30mvHWlRyLuG6fP57lCK.6Kuz.W', 'fernando@gmail.com','112332112', 'https://media.istockphoto.com/id/92044396/es/foto/rana-con-gafas-de-sol.jpg?s=170667a&w=0&k=20&c=jEh4ZMUWU9Y3gx5odmT-LmbCGymtiBVzzEPerkawqm0=', true, true, true, true);
--INSERT INTO CLIENTE (id, pin) VALUES ('1ce9c1c7-7a02-4c7f-bf69-6d0306cbed61','2222');
--INSERT INTO USUARIO_ROLES (roles, usuario_id) VALUES (1,'1ce9c1c7-7a02-4c7f-bf69-6d0306cbed61');
--
--INSERT INTO USUARIO (id, username, password, email, telefono, avatar, account_non_expired, account_non_locked,credentials_non_expired, enabled) VALUES ('86cc45ac-7e72-40d7-b528-2863a1e2500f', 'angel02','{bcrypt}$2a$12$qG8MR/W6ExYtPPdpr2Ry/eEy.x30mvHWlRyLuG6fP57lCK.6Kuz.W', 'angel@gmail.com','333223311', 'https://media.istockphoto.com/id/92044396/es/foto/rana-con-gafas-de-sol.jpg?s=170667a&w=0&k=20&c=jEh4ZMUWU9Y3gx5odmT-LmbCGymtiBVzzEPerkawqm0=', true, true, true, true);
--INSERT INTO USUARIO_ROLES (roles, usuario_id) VALUES (0,'86cc45ac-7e72-40d7-b528-2863a1e2500f');

INSERT INTO USUARIO (id, username, password, avatar, account_non_expired, account_non_locked,credentials_non_expired, enabled) VALUES ('1ce9c1c7-7a02-4c7f-bf69-6d0306cbed61', 'fernando01','{bcrypt}$2a$12$qG8MR/W6ExYtPPdpr2Ry/eEy.x30mvHWlRyLuG6fP57lCK.6Kuz.W', 'https://media.istockphoto.com/id/92044396/es/foto/rana-con-gafas-de-sol.jpg?s=170667a&w=0&k=20&c=jEh4ZMUWU9Y3gx5odmT-LmbCGymtiBVzzEPerkawqm0=', true, true, true, true);
INSERT INTO CLIENTE (id, pin, email, telefono, cash) VALUES ('1ce9c1c7-7a02-4c7f-bf69-6d0306cbed61','2222', 'fernando@gmail.com','112332112', 1000.0);
INSERT INTO USUARIO_ROLES (roles, usuario_id) VALUES (1,'1ce9c1c7-7a02-4c7f-bf69-6d0306cbed61');

INSERT INTO USUARIO (id, username, password, avatar, account_non_expired, account_non_locked,credentials_non_expired, enabled) VALUES ('86cc45ac-7e72-40d7-b528-2863a1e2500f', 'fran02','{bcrypt}$2a$12$qG8MR/W6ExYtPPdpr2Ry/eEy.x30mvHWlRyLuG6fP57lCK.6Kuz.W', 'https://images.vexels.com/media/users/3/157970/isolated/preview/c156b4270aea292b9b335dd463ea17eb-icono-de-planeta-tierra-icono-de-tierra.png', true, true, true, true);
INSERT INTO CLIENTE (id, pin, email, telefono, cash) VALUES ('86cc45ac-7e72-40d7-b528-2863a1e2500f','1111', 'fran@gmail.com','123456789', 0.0);
INSERT INTO USUARIO_ROLES (roles, usuario_id) VALUES (0,'86cc45ac-7e72-40d7-b528-2863a1e2500f');


--########################

--TIPO VEHICULOS

insert into TIPO_VEHICULO (id, tipo) values ('5d79d7a0-46c8-4b5b-95f3-8f83195c768b', 'Coche')
insert into TIPO_VEHICULO (id, tipo) values ('e192b5d1-86e7-4b79-92b6-823f9f9f5aa1', 'Moto')
insert into TIPO_VEHICULO (id, tipo) values ('38c7c21e-13d7-4d2b-9fb3-df5ec849dd34', 'Camioneta')

--########################

-- MODELO DE COCHES

insert into MODELO (id, modelo, logo) values ('afcf760a-8e8a-4e7c-ae94-f5af066c0be7', 'Toyota', 'toyota_logo.png');
insert into MODELO (id, modelo, logo) values ('b13f10a7-5cc1-4bc2-8e16-21260b2a1fe2', 'Honda', 'honda_logo.png');
insert into MODELO (id, modelo, logo) values ('7d7d67f8-73e5-4cfb-87fd-3c7769db2b24', 'Mustang', 'mustang_logo.png');
insert into MODELO (id, modelo, logo) values ('e04f9cd6-f5e1-4db2-9eaa-29b9b29431a1', 'Chevrolet', 'chevrolet_logo.png');
insert into MODELO (id, modelo, logo) values ('35eef7de-5b6e-48d7-803e-b201d8b032f6', 'BMW', 'bmw_logo.png');
insert into MODELO (id, modelo, logo) values ('fe3756a0-2262-4ec7-a924-95e0eefdaa15', 'Mercedes', 'mercedes_logo.png');
insert into MODELO (id, modelo, logo) values ('8c5e42c3-3c2b-4e15-af8c-498e5e63509f', 'Audi', 'audi_logo.png');
insert into MODELO (id, modelo, logo) values ('4f8a0e86-b937-4189-9435-65f66543e956', 'Volkswagen', 'volkswagen_logo.png');
insert into MODELO (id, modelo, logo) values ('b40e4dd4-b0d7-4715-8391-eb5a7b0bbd1a', 'Tesla', 'tesla_logo.png');
insert into MODELO (id, modelo, logo) values ('1c4e89a2-0ac4-41e8-a885-4b8b0d11fcdf', 'Nissan', 'nissan_logo.png');
insert into MODELO (id, modelo, logo) values ('eb3d7d0d-1667-494d-9912-90521e057010', 'Subaru', 'subaru_logo.png');
insert into MODELO (id, modelo, logo) values ('b8b5f10e-41a4-4705-91eb-305c7f00df53', 'Jeep', 'jeep_logo.png');
insert into MODELO (id, modelo, logo) values ('0d96352d-8295-4622-87d1-511398daac50', 'Porsche', 'porsche_logo.png');
insert into MODELO (id, modelo, logo) values ('a18715cc-b94b-43b0-bb73-52a1d0b89e61', 'Hyundai', 'hyundai_logo.png');
insert into MODELO (id, modelo, logo) values ('ec3c2e40-6892-4725-8670-4b79922fe7b3', 'Kia', 'kia_logo.png');

--COCHES

insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, disponible, precio_base, tipo_vehiculo_id, modelo_id) values ('0f8fad5b-d9cb-469f-a165-70867728950e', 'kia1.png', 'Electrico', 'Manual', 5, 266426, 107, 'Nuevo', 5, false, 208.50, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', 'ec3c2e40-6892-4725-8670-4b79922fe7b3');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, disponible, precio_base, tipo_vehiculo_id, modelo_id) values ('7c9e6679-7425-40de-944b-e07fc1f90ae7', 'toyota1.png', 'Electrico', 'Automatico', 4, 195418, 135, 'Nuevo', 5, true, 220.00, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', 'afcf760a-8e8a-4e7c-ae94-f5af066c0be7');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, disponible, precio_base, tipo_vehiculo_id, modelo_id) values ('6d099b7a-1b22-4d17-b3ae-583ebc4ab9f2', 'honda1.png', 'Hibrido', 'Manual', 4, 278662, 152, 'Nuevo', 5,true, 190.00, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', 'b13f10a7-5cc1-4bc2-8e16-21260b2a1fe2');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, disponible, precio_base, tipo_vehiculo_id, modelo_id) values ('9d3b8d45-87d5-4a4a-a663-dbb6899c9f9b', 'hyundai1.png', 'Electrico', 'Manual', 5, 150881, 155, 'Nuevo', 5, true, 240.00, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', 'a18715cc-b94b-43b0-bb73-52a1d0b89e61');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, disponible, precio_base, tipo_vehiculo_id, modelo_id) values ('2641c15b-3c06-4fe5-81d3-5a3deaa9d366', 'toyota2.png', 'Hibrido', 'Automatico', 5, 221462, 157, 'Nuevo', 5, true, 208.50, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', 'afcf760a-8e8a-4e7c-ae94-f5af066c0be7');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, disponible, precio_base, tipo_vehiculo_id, modelo_id) values ('a3fdd079-4c68-4f3f-af67-d72c2cbe41b6', 'chevrolet1.png', 'Diesel', 'Manual', 2, 354427, 122, 'Seminuevo', 5, true, 230.00, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', 'e04f9cd6-f5e1-4db2-9eaa-29b9b29431a1');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, disponible, precio_base, tipo_vehiculo_id, modelo_id) values ('c775e7b7-4c68-4f3f-af67-6c420eb004b6', 'volkswagen1.png', 'Gasolina', 'Automatico', 4, 256038, 181, 'Nuevo', 5, true, 240.00, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', '4f8a0e86-b937-4189-9435-65f66543e956');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, disponible, precio_base, tipo_vehiculo_id, modelo_id) values ('efc0e187-4d08-4a8e-bf5b-eb10c26aadb4', 'mustang1.png', 'Electrico', 'Manual', 5, 296856, 188, 'Seminuevo', 5, true, 280.90, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', '7d7d67f8-73e5-4cfb-87fd-3c7769db2b24');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, disponible, precio_base, tipo_vehiculo_id, modelo_id) values ('85e5ab7d-4e9e-4f93-bfb4-cf5471f7051d', 'audi1.png', 'Diesel', 'Manual', 3, 357966, 96, 'Nuevo', 5, true, 265.00, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', '8c5e42c3-3c2b-4e15-af8c-498e5e63509f');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, disponible, precio_base, tipo_vehiculo_id, modelo_id) values ('68335ec3-1aeb-41a9-b5c3-40e464e3ecf0', 'bmw1.png', 'Diesel', 'Automatico', 5, 353017, 162, 'Seminuevo', 5, true, 270.00, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', '35eef7de-5b6e-48d7-803e-b201d8b032f6');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, disponible, precio_base, tipo_vehiculo_id, modelo_id) values ('5d7f9e1d-08fb-44df-880c-cbd348f5890d', 'jeep1.png', 'Hibrido', 'Manual', 3, 208214, 163, 'Nuevo', 5, true, 220.00, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', 'b8b5f10e-41a4-4705-91eb-305c7f00df53');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, disponible, precio_base, tipo_vehiculo_id, modelo_id) values ('8f0913b0-1229-4b9f-9ea4-765d6d189e47', 'bmw2.png', 'Electrico', 'Manual', 4, 272828, 182, 'Nuevo', 5, true, 270.00, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', '35eef7de-5b6e-48d7-803e-b201d8b032f6');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, disponible, precio_base, tipo_vehiculo_id, modelo_id) values ('504d1b3a-5a15-4898-b579-d05d5f570e07', 'chevrolet2.png', 'Diesel', 'Manual', 3, 357706, 192, 'Nuevo', 5, true, 230.00, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', 'e04f9cd6-f5e1-4db2-9eaa-29b9b29431a1');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, disponible, precio_base, tipo_vehiculo_id, modelo_id) values ('99b5f3fc-ef56-4768-8a1a-8728b6a56f3f', 'volkswagen2.png', 'Hibrido', 'Manual', 3, 222930, 143, 'Nuevo', 5, true, 240.00, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', '4f8a0e86-b937-4189-9435-65f66543e956');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, disponible, precio_base, tipo_vehiculo_id, modelo_id) values ('6c7d47ff-9b5c-4721-96f6-bb4015e49512', 'porsche1.png', 'Electrico', 'Manual', 2, 294615, 110, 'Seminuevo', 5, true, 305.00, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', '0d96352d-8295-4622-87d1-511398daac50');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, disponible, precio_base, tipo_vehiculo_id, modelo_id) values ('37250484-c4f1-47d1-ba9e-8ca4ef72622c', 'tesla1.png', 'Diesel', 'Manual', 2, 353386, 102, 'Seminuevo', 5, true, 280.00, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', 'b40e4dd4-b0d7-4715-8391-eb5a7b0bbd1a');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, disponible, precio_base, tipo_vehiculo_id, modelo_id) values ('609e067b-05ef-48b4-b2b4-3f97899bb07d', 'mercedes2.png', 'Hibrido', 'Automatico', 2, 216241, 152, 'Seminuevo', 5, true, 275.00, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', 'fe3756a0-2262-4ec7-a924-95e0eefdaa15');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, disponible, precio_base, tipo_vehiculo_id, modelo_id) values ('17ed71b8-5e2e-4c5f-a12e-7e1adff08a3e', 'nissan1.png', 'Gasolina', 'Manual', 5, 259473, 122, 'Nuevo', 5, true, 210.00, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', '1c4e89a2-0ac4-41e8-a885-4b8b0d11fcdf');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, disponible, precio_base, tipo_vehiculo_id, modelo_id) values ('9b85cccf-26cd-45f8-a2ad-d80d8d6b8962', 'subaru1.png', 'Diesel', 'Manual', 3, 350347, 122, 'Nuevo', 5, true, 190.00, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', 'eb3d7d0d-1667-494d-9912-90521e057010');
insert into VEHICULO (id, imagen, combustible, transmision, capacidad_pasajeros, autonomia, potencia, estado, num_puertas, disponible, precio_base, tipo_vehiculo_id, modelo_id) values ('9b11dd61-4424-46c9-9daa-c5d70025c478', 'mercedes1.png', 'Hibrido', 'Manual', 4, 247587, 170, 'Nuevo', 5, true, 275.00, '5d79d7a0-46c8-4b5b-95f3-8f83195c768b', 'fe3756a0-2262-4ec7-a924-95e0eefdaa15');

--###########################

--ALQUILERES

insert into ALQUILER (id, precio, kilometros_anos, fecha_creacion, fecha_inicio, fecha_fin, origen, destino, cliente_id, vehiculo_id, en_alquiler) values ('e6d26b2c-ffcb-4859-b9b8-71a1d52042f6', 287.91, 16195, '2023-03-01', '2023-04-15', '2025-07-22', 'Mordor', 'La Comarca', '1ce9c1c7-7a02-4c7f-bf69-6d0306cbed61', '0f8fad5b-d9cb-469f-a165-70867728950e', true);
insert into ALQUILER (id, precio, kilometros_anos, fecha_creacion, fecha_inicio, fecha_fin, origen, destino, cliente_id, vehiculo_id, en_alquiler) values ('b5812fc3-2e70-4a91-b63e-d29a9ee0b041', 385.82, 16625, '2023-03-01', '2023-09-13', '2023-12-30', 'Mordor', 'La Comarca', '1ce9c1c7-7a02-4c7f-bf69-6d0306cbed61', 'c775e7b7-4c68-4f3f-af67-6c420eb004b6', false);
insert into ALQUILER (id, precio, kilometros_anos, fecha_creacion, fecha_inicio, fecha_fin, origen, destino, cliente_id, vehiculo_id, en_alquiler) values ('f2a8fd4e-15e8-4f26-89f1-0e4ef6b0a41e', 261.96, 15800, '2023-03-01', '2023-05-23', '2023-06-13', 'Mordor', 'La Comarca', '1ce9c1c7-7a02-4c7f-bf69-6d0306cbed61', '5d7f9e1d-08fb-44df-880c-cbd348f5890d', false);
insert into ALQUILER (id, precio, kilometros_anos, fecha_creacion, fecha_inicio, fecha_fin, origen, destino, cliente_id, vehiculo_id, en_alquiler) values ('c738c1fb-5a94-49ae-a2b0-29f494e4d47b', 411.93, 15308, '2023-03-01', '2023-07-31', '2023-08-20', 'Mordor', 'La Comarca', '1ce9c1c7-7a02-4c7f-bf69-6d0306cbed61', '99b5f3fc-ef56-4768-8a1a-8728b6a56f3f', false);
insert into ALQUILER (id, precio, kilometros_anos, fecha_creacion, fecha_inicio, fecha_fin, origen, destino, cliente_id, vehiculo_id, en_alquiler) values ('7c057276-dc22-4e27-9b5c-5d24e0d7e72a', 305.72, 19897, '2023-03-01', '2023-03-07', '2023-06-12', 'Mordor', 'La Comarca', '1ce9c1c7-7a02-4c7f-bf69-6d0306cbed61', '17ed71b8-5e2e-4c5f-a12e-7e1adff08a3e', false);


--###########################

-- MOTOS