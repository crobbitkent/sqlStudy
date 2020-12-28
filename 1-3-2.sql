-- NULL 비교하기 (NULL이면 등산, 그리고 등산인 사람 조회)
SELECT EMP_NAME FROM TEMP 
WHERE NVL(HOBBY, '등산') = '등산'; 