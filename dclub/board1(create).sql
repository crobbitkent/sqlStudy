--sequence

create sequence seq_board;

create table tbl_board (
bno number not null,
title varchar2(500) not null,
content varchar2(1000) not null,
writer varchar2(100) not null,
regdate date default sysdate,
updatedate date default sysdate
);


alter table tbl_board add constraint pk_board primary key (bno);

-- 재귀 복사
INSERT INTO tbl_board (bno, title, content, writer)
values (seq_board.nextval, '공지사항 - ', '공지사항 내용입니다. - ', 'mingyuadmin');

INSERT INTO tbl_board (bno, title, content, writer)
    (select seq_board.nextval, '공지사항 - '||seq_board.currval, '공지사항 내용입니다. - '||seq_board.currval, writer from tbl_board);


-- select
select * from tbl_board order by bno desc
;
select * from tbl_board where bno = 2
;

-- update
update tbl_board set title = '공지사항 - 2-1', content = '공지사항 내용입니다 - 2-1', updatedate = sysdate where bno = 2
;

-- delete
DELETE FROM tbl_board where bno = 1
;
