use scott;
drop table products;

-- 1. 상품정보를 저장할 수 있는 테이블을 구성하여 보자. (상품코드, 상품명, 상품가격 등)
create table products(
gno   int auto_increment primary key,   -- 상품 번호 
brand varchar(100) not null,			-- 상품 명
price int          default 0,			-- 상품 가격
maker varchar(50),						-- 제조사
image varchar(50),						-- 상품 이미지
info  varchar(300),						-- 상품 정보 
cno		char(2),						-- 상품코드 
foreign key fk_goods_cno(cno) references category(cno)
);

-- 2. 상품 데이터를 5개 이상 저장하는 SQL을 작성하여 보자. ( 상품명에 TV, 노트북 포함 하도록 하여 5개 이상)
insert into products (brand, price, maker, info, cno)
values('LG TV', 2000000,'LG', '삼성 보다는 성능이 좋지 않음','20');
insert into products (brand, price, maker, info, cno)
values('슬림 노트북', 1000000,'LG','가볍운 노트북','20');
insert into products (brand, price, maker, image, info, cno)
values('마우스', 9700,'LG', 'lgMouse.png','컴퓨터 입력장치','20');
insert into products (brand, price, maker, image, info, cno)
values('태양의 마테차', 1700,'코카콜라', 'sun.png','다이어트할 때 좋아요','10');
insert into products (brand, price, maker,cno)
values('울트라 노트북', 1500000,'삼성','20');
insert into products (brand, price, maker,cno)
values('프리미엄 TV', 500000,'삼성','20');
insert into products (brand, price, maker,  image)
values('이것이 자바다', 30000,'한빛미디어','java.png');
insert into products (brand, price, maker,  image, cno)
values('오후에 마시는 마테차', 9000,'동글실업','afternoonTea.png', 10);
insert into products (brand, price, maker,  image, cno)
values('usb 마우스', 12000,'삼성전자','usbmouse.png', 20);
insert into products (brand, price, maker,  image, cno)
values('사무용 데스크', 85000,'PATRA','par_desk.png', 40);

select *
from products;

-- 3. 상품을 세일하려고 한다. 15% 인하된 가격의 상품 정보를 출력하세요.
select gno, brand, price, maker, info, cno, (price*0.85) as '할인 가격'
from products;


-- 4. TV 관련 상품을 가격을 20% 인하하여 저장하세요. 그 결과를 출력하세요. 
/*
update products set price = 2000000
where brand like 'LG TV';
update products set price = 500000
where brand like '프리미엄 TV';
*/
update products set price = price*0.8
where brand like '%TV%';
select *
from products;


-- 5. 저장된 상품 가격의 총 금액을 출력하는 SQL 문장을 작성하세요.
select sum(price) as '총 금액'
from products;


