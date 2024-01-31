-- 创建名为co_forum的数据库
CREATE DATABASE IF NOT EXISTS co_forum;
USE co_forum;

DROP TABLE IF EXISTS users;

create table if not exists users (
    id integer primary key auto_increment,
    employee_id integer not null unique,
    nickname varchar(32) not null,
    user_type tinyint not null default 0, 
    user_status tinyint not null default 1,
    gender tinyint,
    age smallint,
    pwd varchar(64) not null,
    region varchar(32) not null,
    phone varchar(11) not null unique,
    email varchar(256) not null unique,
    create_time datetime not null default current_timestamp,
    update_time datetime not null default current_timestamp ON UPDATE CURRENT_TIMESTAMP,
    delete_time datetime default null,
    reserve1 varchar(256) default null,
    reserve2 varchar(256) default null
) engine=INNODB DEFAULT charset=utf8;

-- 插入 users 表的数据
INSERT INTO users (employee_id, nickname, user_type, user_status, gender, age, pwd, region, phone, email)
VALUES
(1, 'Alice', 0, 1, 1, 25, 'password1', 'Region1', '12345678901', 'alice@example.com'),
(2, 'Bob', 0, 1, 0, 30, 'password2', 'Region2', '12345678902', 'bob@example.com'),
(3, 'Charlie', 0, 1, 0, 35, 'password3', 'Region3', '12345678903', 'charlie@example.com'),
(4, 'David', 0, 1, 1, 40, 'password4', 'Region4', '12345678904', 'david@example.com'),
(5, 'Eve', 0, 1, 1, 45, 'password5', 'Region5', '12345678905', 'eve@example.com');

-- 删除名为posts的表（如果存在）
DROP TABLE IF EXISTS posts;

-- 创建新的posts表
create table if not exists posts (
    id integer not null primary key auto_increment,
    user_id integer not null,
    foreign key (user_id) references users(id),
    channel_id varchar(255) not null,
    title varchar(255) not null,
    content varchar(255) default null,
    pics JSON default null,
    status tinyint not null default 1,
    like_count int not null default 0,
    view_count int not null default 1,
    create_time datetime not null default current_timestamp,
    update_time datetime not null default current_timestamp ON UPDATE CURRENT_TIMESTAMP,
    delete_time datetime default null
)engine=innodb default charset=utf8;

-- 插入 posts 表的数据
INSERT INTO posts (user_id, channel_id, title, content, status)
VALUES
(1, '1', 'Title1', 'Content1', 1),
(2, '1', 'Title2', 'Content2', 1),
(3, '1', 'Title3', 'Content3', 1),
(4, '1', 'Title4', 'Content4', 1),
(5, '1', 'Title5', 'Content5', 1);
