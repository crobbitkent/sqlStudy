
create sequence seq_store;
-- 생성 완료

create table tbl_store (
    sno number(10) not null, -- not null : 이건 빠지면 안된다는 뜻, 튜닝할 때 필요...
    name varchar2(200) not null,
    lat number(10, 6) not null,
    lng number(10, 6) not null,
    menu varchar2(500),
    regdate date default sysdate,
    updatedate date default sysdate
);
-- 생성 완료(테이블 생성)

alter table tbl_store add constraint pk_store primary key(sno); --sno에 식별키 부여
-- 생성 완료

-- 오브젝트를 다룰 땐 = create, alter, drop
-- 37.503767, 127.020794
-- 레코드를 다룰 땐 = insert, update, delete...
insert into tbl_store (sno, name, lat, lng)
VALUES (seq_store.nextval, '멘야시노기', 37.503767, 127.020794);
-- 생성 완료(레코드 추가)

select * from tbl_store;

delete from tbl_store  where sno > 4;
-- 생성 완료

update tbl_store set menu = '시노기 라멘' where sno = 1;
-- 생성 완료


