create database lab1
create table usersss(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

alter table usersss
add is_admin int default 1;
alter table usersss
alter column is_admin type boolean
using is_admin::boolean;
create table tasks_2(
    id serial primary key,
    name varchar(50),
    user_id int
);
insert into usersss(first_name, last_name)
values('Alpamys','Kaliyev');
select * from usersss;

