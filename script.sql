/*INSERTS IN AUX_DATA_GROUPS AND AUX_DATA*/
insert into aux_data_groups(group_name,short_name,creation_date,modification_date) values('SI/NO','YESNO',NOW(),NOW());
CALL `ucompiler`.`InsertAuxData`('YESNO','SI', 'YES',1);
CALL `ucompiler`.`InsertAuxData`('YESNO','NO', 'NOT',2);

insert into aux_data_groups(group_name,short_name,creation_date,modification_date) values('ESTADO','STATUS',NOW(),NOW());
CALL `ucompiler`.`InsertAuxData`('STATUS','ACTIVO', 'ACTIVE',1);
CALL `ucompiler`.`InsertAuxData`('STATUS','INACTIVO', 'INACTIVE',2);

insert into aux_data_groups(group_name,short_name,creation_date,modification_date) values('GENERO','SEX',NOW(),NOW());
CALL `ucompiler`.`InsertAuxData`('SEX','HOMBRE', 'MALE',1);
CALL `ucompiler`.`InsertAuxData`('SEX','MUJER', 'FEMALE',2);