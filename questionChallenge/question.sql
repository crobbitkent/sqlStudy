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

create table tbl_member (
    mid varchar2(100) not null, -- not null : 이건 빠지면 안된다는 뜻, 튜닝할 때 필요...
    mpw varchar2(100) not null,
    mname varchar2(50) not null,
    grade number(10, 6) default 0,
    regdate date default sysdate,
    updatedate date default sysdate
);

alter table tbl_member add constraint pk_member primary key (mid);


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

alter table tbl_qhistory add constraint pk_qhistory primary key (hno);
create sequence seq_qhistory;

alter table tbl_question add deprecated varchar2(1) default 'n' not null;

create table tbl_qnaboard (
    bno number not null, -- not null : 이건 빠지면 안된다는 뜻, 튜닝할 때 필요...
    mid varchar2(100) not null,
    qno number not null,
    title varchar2(100) not null,
    content varchar2(500) not null,
    state number(1) default 0 not null,
    checkanswer varchar2(1) not null,
    regdate date default sysdate,
    updatedate date default sysdate
);

create sequence seq_qnaboard;
alter table tbl_qnaboard add constraint pk_qnaboard primary key (bno);

truncate table tbl_qnaboard;

alter table tbl_qhistory drop column score;

create table tbl_admin (
    aid varchar2(100) not null, -- not null : 이건 빠지면 안된다는 뜻, 튜닝할 때 필요...
    apw varchar2(100) not null,
    hno number not null,
    regdate date default sysdate,
    updatedate date default sysdate
);


alter table tbl_admin add constraint pk_admin primary key (aid);

alter table tbl_question add constraint pk_admin primary key (aid);

alter table tbl_qnaboard drop column checkanswer;
alter table tbl_qnaboard add category varchar2(2) not null;

alter table tbl_question add aid varchar2(100) not null;

insert into tbl_admin (aid, apw)
VALUES ('mingyuAdmin', '1234');

-- QUESTION TOY
insert into tbl_question (qno, quiz, answer, difficulty, aid)
VALUES (seq_question.nextval, 'testQuiz', 'testAnswer', round(dbms_random.value * 4) + 1, 'mingyuAdmin');
commit;

insert into tbl_question(qno, quiz, answer, difficulty, aid)
(select seq_question.nextval, 'testQuiz'||seq_question.currval,'testAnswer'||seq_question.currval, round(dbms_random.value * 4) + 1, 'mingyuAdmin'
    from tbl_question);
commit;

select count(*) from tbl_question;
select * from tbl_question order by qno desc;
select * from tbl_admin;

truncate table tbl_question;

-- 262144 중에서
insert into tbl_qhistory (hno, qno, mid, memberanswer, checkanswer)
VALUES (seq_qhistory.nextval, 131075, 'mingyu', '3', '0');


select * from tbl_qhistory;
select * from tbl_member;
select * from tbl_admin;

	SELECT /*+ordered use_nl(temp tbl_question)*/ * FROM
	(
    SELECT ROWNUM RN, RD FROM
        	(
           	SELECT ROWID RD FROM tbl_question
                ORDER BY qno DESC
            ) T WHERE ROWNUM <= 10 * 24
    	) temp, tbl_question
	WHERE RN > 10 * (24 - 1) AND temp.RD = tbl_question.ROWID

select count(*) from tbl_question where qno not in
    (select qno from tbl_qhistory where mid = 'mingyu' and qno > 0)
       and difficulty = 1

	insert into tbl_question(qno, aid, quiz, answer, difficulty)
	VALUES (seq_question.nextval, #{qno}, #{aid}, #{quiz}, #{answer}, #{difficulty})

	-- paging 조회
		SELECT /*+ordered use_nl(temp tbl_qhistory)*/ hno,qno,mid,memberanswer,checkanswer
		     regdate,updatedate FROM
	(
    SELECT ROWNUM RN, RD FROM
        	(
           	SELECT ROWID RD FROM tbl_qhistory
                ORDER BY hno DESC
            ) T WHERE ROWNUM <= 10 * 2
    	) temp, tbl_qhistory
	WHERE RN > 10 * (2 - 1) AND temp.RD = tbl_qhistory.ROWID;