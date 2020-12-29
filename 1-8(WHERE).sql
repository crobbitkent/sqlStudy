-- 조건절이지만 전체 조건을 다 만족시키는 조건을 주는 경우
--해당 컬럼에 존재하는 INDEX를 사용하기 위해 자동 정렬 된다.
SELECT EMP_ID, EMP_NAME
FROM TEMP
WHERE EMP_ID > 0;