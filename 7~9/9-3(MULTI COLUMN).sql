
SELECT EMP_ID, EMP_NAME
FROM TEMP
WHERE (DEPT_CODE, EMP_ID)
IN 
(SELECT DEPT_CODE, BOSS_ID FROM TDEPT)
