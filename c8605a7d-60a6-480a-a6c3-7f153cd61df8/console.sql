drop database lab_1;
drop table usersss;
create database lab_1;
create table usersss(
    id int ,
    firstname varchar(50),
    lastname varchar(50),
    primary key (id)
);
alter table usersss add isAdmin integer ;
alter table usersss alter column isAdmin type boolean using (false);
create table tasks(
    id int,
    name varchar(50),
    user_id int,
    primary key(id)
);

drop table tasks;
drop database lab_1;