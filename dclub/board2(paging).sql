-- paging 1
select * from
(
    select rownum rn, bno, title
    from tbl_board
    where rownum <= 20 -- stop key
    order by bno desc
)
where rn > 10;


-- paging 2
-- 인라인 뷰 / rownum
select * from
(
    select /*+INDEX_DESC(tbl_board pk_board)*/ rownum rn, bno, title, content, writer, regdate, updatedate
    from tbl_board
    where bno > 0 and rownum <= 10 * 4 -- stop key
)
where rn > 10 * (4 - 1);


-- paging 2.5
select /*+INDEX_DESC(tbl_store pk_store)*/
* from
( select rownum rn, sno, name, menu, count(sno) over()
    from tbl_store
    where rownum <= 101
    )
where rn > 10 and rn <= 20;


-- paging 3
-- selecting the 10th page of length 100 each
SELECT /*+ordered use_nl(p s)*/ * FROM
(
    SELECT ROWNUM RN, RD FROM
        (
            SELECT ROWID RD FROM STUDENT
                ORDER BY RNO
            ) T WHERE ROWNUM < 1000
    ) P, STUDENT S
WHERE RN > 900 AND P.RD = S.ROWID;


SELECT /*+ordered use_nl(temp tbl_board)*/ * FROM
(
    SELECT ROWNUM RN, RD FROM
        (
            SELECT ROWID RD FROM TBL_BOARD
                ORDER BY bno
            ) T WHERE ROWNUM <= 10 * 200000
    ) temp, tbl_board
WHERE RN > 10 * (200000 - 1)  AND temp.RD = tbl_board.ROWID;