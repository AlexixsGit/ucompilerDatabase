use ucompiler;

/*INICIO TABLAS MAESTRAS*/
drop table if exists `algoritm_templates`;
create table algoritm_templates
(
	id bigint(20) unsigned not null primary key comment 'Id autogenerado' auto_increment,
    complete_name  nvarchar(20) not null comment 'Nombre de la plantilla',
    template text not null comment 'Plantilla almacenada',
    creation_date datetime not null comment 'Fecha de creacion',
    modification_date datetime not null comment 'Fecha de modificacion'
);
drop table if exists `volumes`;
create table volumes
(
	id bigint(20) unsigned not null primary key comment 'Id autogenerado' auto_increment,
    description nvarchar(100) not null comment 'Descripcion',
    creation_date datetime not null comment 'Fecha de creacion',
    modification_date datetime not null comment 'Fecha de modificacion'
);
drop table if exists `categories`;
create table categories
(
	id bigint(20) unsigned not null primary key comment 'Id autogenerado' auto_increment,
    cat_name nvarchar(50) not null comment 'Nombre',
    description nvarchar(100) not null comment 'Descripcion',
    creation_date datetime not null comment 'Fecha de creacion',
    modification_date datetime not null comment 'Fecha de modificacion'
);
drop table if exists `aux_data_groups`;
create table aux_data_groups
(
	id bigint(20) unsigned not null primary key comment 'Id autogenerado' auto_increment,
    group_name nvarchar(25) not null comment 'Nombre del Grupo',
    short_name nvarchar(10) not null comment 'Nombre corto del grupo',
    creation_date datetime not null comment 'Fecha de creacion',
    modification_date datetime not null comment 'Fecha de modificacion'
);
/*FIN TABLAS MAESTRAS*/
drop table if exists `sub_categories`;
create table sub_categories
(
	id bigint(20) unsigned not null primary key comment 'Id autogenerado' auto_increment,
    sub_name nvarchar(50) not null comment 'Nombre',
    description nvarchar(100) not null comment 'Descripcion',
    id_category bigint(20) unsigned not null comment 'Id de la categoria', /*foreign key*/
    subcat_level bigint(20) unsigned not null comment 'Nivel de la subcategoria',/*foreign key*/
    creation_date datetime not null comment 'Fecha de creacion',
    modification_date datetime not null comment 'Fecha de modificacion'
);
drop table if exists `users`;
create table users
(
  id bigint(20) unsigned not null primary key comment 'Id autogenerado' auto_increment,
  user_name  nvarchar(50) not null comment 'Nombre de usuario',
  complete_name  nvarchar(100)  null comment 'Nombre',
  email nvarchar(100) not null comment 'Correo',
  user_password nvarchar(500) not null comment 'Contraseña',
  birthdate datetime null comment 'Fecha de nacimiento',
  sex bigint(20) unsigned null comment 'Genero',
  user_status bigint(20) unsigned not null comment 'Estado',
  country nvarchar(50)  null comment 'Pais',
  institution nvarchar(60)  null comment 'Institucion',
  course_code nvarchar(25)  null comment 'Codigo del curso',
  photo nvarchar(500)  null comment 'Url Foto de perfil',
  is_email_confirmed bigint(20) unsigned not null comment 'Indica si el correo ha sido confirmado', /*foreign key*/
  is_admin bigint(20) unsigned not null comment 'Indica si el usuario es administrador', /*foreign key*/
  is_superadmin bigint(20) unsigned not null comment 'Indica si el usuario es super administrador', /*foreign key*/
  is_password_temp bigint(20) unsigned not null comment 'Indica si la contraseña es temporal', /*foreign key*/
  creation_date datetime not null comment 'Fecha de creacion',
  modification_date datetime not null comment 'Fecha de modificacion'
);
drop table if exists `problems`;
create table problems
(
  id bigint(20) unsigned not null primary key comment 'Id autogenerado' auto_increment,
  title nvarchar(50) not null comment 'Titulo',
  id_subcategory bigint(20) unsigned not null comment 'Id de la subcategoria',
  id_volume bigint(20) unsigned not null comment 'Id del volumen',
  problem_text text not null comment 'Texto del problema o enunciado',
  input_description nvarchar(1000) null comment 'Descripcion de la entrada',
  output_description nvarchar(1000) null comment 'Descripcion de la salida',
  input_example nvarchar(1000) null comment 'Ejemplo de entrada',
  output_example nvarchar(1000) null comment 'Ejemplo de salida',
  attached_file nvarchar(500) null comment 'Ruta del archivo adjunto',
  is_pdf bigint(20) unsigned  null comment 'Indica si el registro tiene un pdf o no',
  complexity bigint(20) unsigned  null comment 'Complejidad',
  creation_date datetime not null comment 'Fecha de creacion',
  modification_date datetime not null comment 'Fecha de modificacion'
);
drop table if exists `aux_data`;
create table aux_data
(
 id bigint(20) unsigned not null primary key comment 'Id autogenerado' auto_increment,
 aux_name nvarchar(25) not null comment 'Nombre',
 short_name nvarchar(10) not null comment 'Nombre corto',
 id_aux_data_group  bigint(20) unsigned not null comment 'Id del grupo',
 aux_order int not null comment 'Orden',
 creation_date datetime not null comment 'Fecha de creacion',
 modification_date datetime not null comment 'Fecha de modificacion'
);
drop table if exists `analysis_logs`;
create table analysis_logs
(
 id bigint(20) unsigned not null primary key comment 'Id autogenerado' auto_increment,
 id_user bigint(20) unsigned not null comment 'Id del usuario', /*foreign key*/
 id_problem bigint(20) unsigned not null comment 'Id del problema', /*foreign key*/
 algorithms text not null comment 'Algoritmo ejecutado',
 creation_date datetime not null comment 'Fecha de creacion',
 modification_date datetime not null comment 'Fecha de modificacion'
);
drop table if exists `compilation_logs`;
create table compilation_logs
(
 id bigint(20) unsigned not null primary key comment 'Id autogenerado' auto_increment,
 id_user bigint(20) unsigned not null comment 'Id del usuario', /*foreign key*/
 id_problem bigint(20) unsigned not null comment 'Id del problema', /*foreign key*/
 algorithms text not null comment 'Algoritmo compilado',
 result_message text not null comment 'Resultado de la compilacion',
 comp_status  bigint(20) unsigned null comment 'Estado de la compilacion',
 creation_date datetime not null comment 'Fecha de creacion',
 modification_date datetime not null comment 'Fecha de modificacion'
);
drop table if exists `init_page`;
create table init_page
(
 id bigint(20) unsigned not null primary key comment 'Id autogenerado' auto_increment,
 description text not null comment 'Que es',
 how_start text not null comment 'Como empiezo',
 id_week_problem bigint(20) unsigned null comment 'Problema de la semana',
 image_folder nvarchar(500) null comment 'Ruta de la carpeta de imagenes',
 creation_date datetime not null comment 'Fecha de creacion',
 modification_date datetime not null comment 'Fecha de modificacion'
);

/*FOREIGN KEYS*/
/*EL NOMBRAMIENTO SE HARA DE LA SIGUIENTE FORMA Fk_nombreTablaDestino_nombreTablaOrigen_campo*/
ALTER TABLE users
ADD CONSTRAINT FK_aux_data_users_sex
FOREIGN KEY (sex) REFERENCES aux_data(id);

ALTER TABLE users
ADD CONSTRAINT FK_aux_data_users_user_status
FOREIGN KEY (user_status) REFERENCES aux_data(id);

ALTER TABLE users
ADD CONSTRAINT FK_aux_data_users_is_email_confirmed
FOREIGN KEY (is_email_confirmed) REFERENCES aux_data(id);


ALTER TABLE users
ADD CONSTRAINT FK_aux_data_users_is_admin
FOREIGN KEY (is_admin) REFERENCES aux_data(id);

ALTER TABLE users
ADD CONSTRAINT FK_aux_data_users_is_superadmin
FOREIGN KEY (is_superadmin) REFERENCES aux_data(id);

ALTER TABLE users
ADD CONSTRAINT FK_aux_data_users_is_password_temp
FOREIGN KEY (is_password_temp) REFERENCES aux_data(id);

ALTER TABLE analysis_logs
ADD CONSTRAINT FK_users_analysis_logs_id_user
FOREIGN KEY (id_user) REFERENCES users(id);

ALTER TABLE compilation_logs
ADD CONSTRAINT FK_users_compilation_logs_id_user
FOREIGN KEY (id_user) REFERENCES users(id);

ALTER TABLE compilation_logs
ADD CONSTRAINT FK_aux_data_compilation_logs_comp_status
FOREIGN KEY (comp_status) REFERENCES aux_data(id);

ALTER TABLE compilation_logs
ADD CONSTRAINT FK_problems_compilation_logs_id_problem
FOREIGN KEY (id_problem) REFERENCES problems(id);

ALTER TABLE init_page
ADD CONSTRAINT FK_problems_init_page_id_week_problem
FOREIGN KEY (id_week_problem) REFERENCES problems(id);

ALTER TABLE problems
ADD CONSTRAINT FK_subcategories_problems_id_subcategory
FOREIGN KEY (id_subcategory) REFERENCES sub_categories(id);

ALTER TABLE problems
ADD CONSTRAINT FK_volumes_problems_id_volume
FOREIGN KEY (id_volume) REFERENCES volumes(id);

ALTER TABLE problems
ADD CONSTRAINT FK_aux_data_problems_is_pdf
FOREIGN KEY (is_pdf) REFERENCES aux_data(id);

ALTER TABLE problems
ADD CONSTRAINT FK_aux_data_problems_complexity
FOREIGN KEY (complexity) REFERENCES aux_data(id);

ALTER TABLE aux_data
ADD CONSTRAINT FK_aux_data_group_aux_data_id_aux_data_group
FOREIGN KEY (id_aux_data_group) REFERENCES aux_data_groups(id);

ALTER TABLE sub_categories
ADD CONSTRAINT FK_categories_sub_categories_id_category
FOREIGN KEY (id_category) REFERENCES categories(id);