create database ssafyweb;

use ssafyweb;

-- DROP TABLE `ssafy_member`;

CREATE TABLE `ssafy_member` (
	`userid`	VARCHAR(20) 	PRIMARY KEY,
	`username`	VARCHAR(20) 	NOT NULL,
	`userpwd`	VARCHAR(100) 	NOT NULL,
	`email`		VARCHAR(2000),
	`address` 	VARCHAR(2000),
	`joindate` 	TIMESTAMP		NOT NULL DEFAULT current_timestamp
);

INSERT INTO ssafy_member (userid, username, userpwd, email, address)
VALUES('admin', '관리자', 'admin', 'admin@ssafy.com','서울시 역삼동');

INSERT INTO ssafy_member (userid, username, userpwd, email, address)
VALUES('ssafy', '김싸피', 'ssafy', 'ssafy@ssafy.com','대전시 덕명동');

commit;

-- drop table products;

create table products(
gno   int primary key,   -- 상품 번호 
brand varchar(100) not null,			-- 상품 명
price int          default 0,			-- 상품 가격
maker varchar(50),						-- 제조사
image varchar(50),						-- 상품 이미지
info  varchar(300),						-- 상품 정보 
cno		char(2),						-- 상품코드 
userid varchar(30),
regtime TIMESTAMP   NOT NULL DEFAULT current_timestamp
);

select * from products;
