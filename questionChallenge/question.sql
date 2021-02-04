create sequence seq_question;

create table tbl_question (
    qno number(10) not null, -- not null : 이건 빠지면 안된다는 뜻, 튜닝할 때 필요...
    quiz varchar2(500) not null,
    answer varchar2(500) not null,
    difficulty number(1) default 1, -- 낮은 게 쉽다
    regdate date default sysdate,
    updatedate date default sysdate
);

alter table tbl_question add constraint pk_question primary key(qno); --sno에 식별키 부여

insert into tbl_question (qno, quiz, answer, difficulty)
VALUES (seq_question.nextval, 'testquiz', 'testanswer', 3);

insert into tbl_question(qno, quiz, answer, difficulty)
(select seq_question.nextval, 'testquiz'||seq_question.currval,'testanswer'||seq_question.currval, 1
    from tbl_question);
commit;

select * from tbl_question order by qno desc;
select count(*) from tbl_question;

create table tbl_member (
    mid varchar2(100) not null, -- not null : 이건 빠지면 안된다는 뜻, 튜닝할 때 필요...
    mpw varchar2(100) not null,
    mname varchar2(50) not null,
    regdate date default sysdate,
    updatedate date default sysdate
);


alter table tbl_member add constraint pk_member primary key (mid);

insert into tbl_member (mid, mpw, mname)
VALUES ('admin', '1234', 'admin');

select * from tbl_member;




-------------------------------- 시험 내역
create table tbl_qhistory (
    hno number not null, -- not null : 이건 빠지면 안된다는 뜻, 튜닝할 때 필요...
    qno number not null,
    mid varchar2(100) not null,
    memberanswer varchar2(500) not null,
    checkanswer varchar2(1) not null,
    score varchar2(1) default 1,
    regdate date default sysdate,
    updatedate date default sysdate
);

create sequence seq_qhistory;

-- 0 = 틀림(false라는 뜻)
insert into tbl_qhistory (hno, qno, mid, memberanswer, checkanswer, score)
VALUES (seq_qhistory.nextval, 2049, 'admin', '3', '0', 3);

insert into tbl_qhistory (hno, qno, mid, memberanswer, checkanswer, score)
VALUES (seq_qhistory.nextval, 2058, 'admin', '4', '0', 2);

SELECT * FROM TBL_QHISTORY;
SELECT * FROM TBL_member;
select * from tbl_question;

----------------------- toy data
insert into tbl_question (qno, quiz, answer, difficulty)
VALUES (seq_question.nextval, 'testquiz10', 'testanswer10', 1);

select * from tbl_question;

select count(*) from tbl_question where difficulty = 2;

-- SELECT * FROM
--        (SELECT * FROM table ORDER BY dbms_random.value)
-- WHERE rownum <= 5;

SELECT * FROM
       (SELECT * FROM tbl_question where difficulty = round(dbms_random.value * 3) ORDER BY dbms_random.value )
WHERE rownum <= 1;

SELECT * FROM
       (SELECT * FROM tbl_question where difficulty = 2 ORDER BY dbms_random.value )
WHERE rownum <= 1;

select * from tbl_qhistory;
select * from tbl_question;

truncate table tbl_question;
commit;

-- 1. history에서 본인 id에 맞는 qno를 모두 불러온다.
-- 2. 그 테이블에 있는 걸 제외한 qno를 정렬 rownum을 줘서
-- 3. 그리고 랜덤으로 찾는다.
select * from
(select /*+ordered use_nl(QTABLE)*/ rownum, qno, quiz, answer, difficulty from tbl_question where qno not in
   (select qno from tbl_qhistory where mid = 'admin' and qno > 0)
       and difficulty = 1 order by dbms_random.VALUE * 2)
where rownum <= 1;


select * from
(select rownum rn, qno, quiz, answer, difficulty from tbl_question where qno not in
    (select qno from tbl_qhistory where mid = 'admin' and qno > 0)
       and difficulty = 1)
where rn = (select count(*) from (select rownum rn, qno, quiz, answer, difficulty from tbl_question where qno not in
    (select qno from tbl_qhistory where mid = 'admin' and qno > 0)
       and difficulty = 1));

select * from
(select rownum rn, qno, quiz, answer, difficulty from tbl_question where qno not in
    (select qno from tbl_qhistory where mid = 'admin' and qno > 0)
       and difficulty = 1)
where rn = 100000;

-- 최종
select * from tbl_question where qno = (select qno from
(select rownum rn, qno, quiz, answer, difficulty from tbl_question where qno not in
    (select qno from tbl_qhistory where mid = 'admin' and qno > 0)
       and difficulty = 1)
where rn = 100000);

-- count
select count(*) from tbl_question where qno not in
    (select qno from tbl_qhistory where mid = 'admin' and qno > 0)
       and difficulty = 1