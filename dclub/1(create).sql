create user mingyu identified by alsrb;
grant  connect, dba to mingyu;



-------------------------스토어 테이블 만들기--------------------------------
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

-------------------------회원 테이블 만들기--------------------------------
create table tbl_member(
  mid varchar2(100) not null ,
  mpw varchar2(100) not null ,
  mname varchar2(50) not null ,
  regdate date default sysdate,
  updatedate date default sysdate
);
--사용자가 직접 지정해야하는 것은 시퀀스를 사용하지 않는다.

alter table tbl_member add constraint pk_member primary key (mid);




-------------------------리뷰 테이블 만들기--------------------------------
update tbl_store set menu = '시노기 라멘' where sno = 1;
-- 생성 완료

CREATE SEQUENCE SEQ_REVIEW;

CREATE TABLE TBL_REVIEW(
    RNO NUMBER NOT NULL,
    SNO NUMBER NOT NULL,
    MID VARCHAR2(100) NOT NULL,
    REVIEWDATE DATE DEFAULT SYSDATE,
    SCORE NUMBER DEFAULT 1,
    TEXT VARCHAR2(500),
    UPDATEDATE DATE DEFAULT SYSDATE
);

-- PK ADD
ALTER TABLE TBL_REVIEW ADD CONSTRAINT PK_REVIEW PRIMARY KEY (RNO);

-- FK ADD
ALTER TABLE TBL_REVIEW ADD CONSTRAINT FK_REVIEW_MEMBER FOREIGN KEY (MID) REFERENCES TBL_MEMBER(MID);
ALTER TABLE TBL_REVIEW ADD CONSTRAINT FK_REVIEW_STORE FOREIGN KEY (SNO) REFERENCES TBL_STORE(SNO);


select * from (select sno from TBL_STORE where sno = ?) store, (select * from TBL_REVIEW where sno = ?) review
		